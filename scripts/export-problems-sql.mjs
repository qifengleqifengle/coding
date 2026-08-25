import { mkdir, readFile, writeFile } from 'node:fs/promises';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const seedPath = path.join(root, 'server', 'data', 'seed.json');
const outputPath = path.join(root, 'db', 'init', '002-problems.sql');

const sqlString = (value) => value == null ? 'NULL' : `'${String(value).replaceAll("'", "''")}'`;
const sqlJson = (value) => `${sqlString(JSON.stringify(value ?? {}))}::jsonb`;
const sqlBoolean = (value) => value ? 'TRUE' : 'FALSE';
const sqlArray = (values = []) => values.length
  ? `ARRAY[${values.map(sqlString).join(',')}]::text[]`
  : "'{}'::text[]";

const seed = JSON.parse(await readFile(seedPath, 'utf8'));
const rows = [];

for (const source of ['codetop', 'hot100']) {
  for (const item of seed.lists[source]) {
    rows.push(`(${[
      sqlString(source), item.rank, sqlString(item.frontendId), item.sourceEntryId ?? 'NULL',
      sqlString(item.title), sqlString(item.slug), sqlString(item.difficulty), sqlString(item.category),
      item.frequency ?? 'NULL', sqlString(item.updatedAt), sqlBoolean(item.inBoth), sqlString(item.sourceUrl),
      sqlString(item.contentText), sqlJson(item.samples ?? []), sqlString(item.exampleTestcases ?? ''),
      sqlArray(item.tags ?? []), sqlJson(item.templates ?? {}), sqlJson(item.acmTemplates ?? {}),
    ].join(',')})`);
  }
}

if (rows.length !== 200) throw new Error(`题库条数应为 200，实际为 ${rows.length}`);

const sql = `-- 由 scripts/export-problems-sql.mjs 从离线题库生成，请勿手工修改。\n` +
  `INSERT INTO problem_entries (\n` +
  `  source, rank, frontend_id, source_entry_id, title, slug, difficulty, category,\n` +
  `  frequency, source_updated_at, in_both, source_url, content_text, samples,\n` +
  `  example_testcases, tags, templates, acm_templates\n` +
  `) VALUES\n${rows.join(',\n')}\n` +
  `ON CONFLICT (source, rank) DO NOTHING;\n`;

await mkdir(path.dirname(outputPath), { recursive: true });
await writeFile(outputPath, sql, 'utf8');
console.log(`已写入 ${path.relative(root, outputPath)}：${rows.length} 条题目`);
