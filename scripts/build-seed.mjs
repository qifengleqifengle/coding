import { readFile, writeFile, mkdir } from 'node:fs/promises';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const rawDir = path.join(root, 'server', 'data', 'raw');
const outputFile = path.join(root, 'server', 'data', 'seed.json');

const entities = { '&nbsp;': ' ', '&lt;': '<', '&gt;': '>', '&amp;': '&', '&quot;': '"', '&#39;': "'" };
const decode = (value = '') => value.replace(/&(nbsp|lt|gt|amp|quot|#39);/g, (m) => entities[m] ?? m);
const textOnly = (value = '') => decode(value)
  .replace(/<br\s*\/?>/gi, '\n')
  .replace(/<\/p>|<\/li>|<\/pre>|<\/div>/gi, '\n')
  .replace(/<li[^>]*>/gi, '• ')
  .replace(/<[^>]+>/g, '')
  .replace(/\r/g, '')
  .replace(/[ \t]+\n/g, '\n')
  .replace(/\n{3,}/g, '\n\n')
  .trim();

function parseSamples(html = '') {
  const samples = [];
  const blocks = [
    ...[...html.matchAll(/<pre[^>]*>([\s\S]*?)<\/pre>/gi)].map((match) => match[1]),
    ...[...html.matchAll(/<div[^>]*class="[^"]*example-block[^"]*"[^>]*>([\s\S]*?)<\/div>/gi)].map((match) => match[1]),
  ];
  for (const block of blocks) {
    const value = textOnly(block);
    const input = value.match(/(?:输入|Input)\s*[:：]?\s*([\s\S]*?)(?=(?:输出|Output)\s*[:：]?)/i)?.[1]?.trim();
    const output = value.match(/(?:输出|Output)\s*[:：]?\s*([\s\S]*?)(?=(?:解释|Explanation)\s*[:：]?|$)/i)?.[1]?.trim();
    const explanation = value.match(/(?:解释|Explanation)\s*[:：]?\s*([\s\S]*)/i)?.[1]?.trim();
    if (input && output) samples.push({ input, output, explanation: explanation ?? '' });
  }
  return [...new Map(samples.map((sample) => [`${sample.input}\n${sample.output}`, sample])).values()].slice(0, 4);
}

function parseHot100(html) {
  const result = [];
  const sections = [...html.matchAll(/<h2[^>]*>([\s\S]*?)<\/h2>([\s\S]*?)(?=<h2|$)/gi)];
  for (const section of sections) {
    const category = textOnly(section[1]).replace(/¶/g, '').replace(/（\d+）.*/, '').trim();
    const table = section[2].match(/<table>([\s\S]*?)<\/table>/i)?.[1];
    if (!table) continue;
    for (const row of table.matchAll(/<tr>([\s\S]*?)<\/tr>/gi)) {
      const cells = [...row[1].matchAll(/<td[^>]*>([\s\S]*?)<\/td>/gi)].map((m) => m[1]);
      if (cells.length < 3) continue;
      const frontendId = textOnly(cells[0]);
      const link = cells[1].match(/href="https:\/\/leetcode\.cn\/problems\/([^/]+)\/?[^\"]*"/i);
      if (!/^\d+$/.test(frontendId) || !link) continue;
      result.push({
        rank: result.length + 1,
        frontendId,
        title: textOnly(cells[1]),
        slug: link[1],
        difficulty: textOnly(cells[2]),
        category,
      });
    }
  }
  const unique = [...new Map(result.map((item) => [item.frontendId, item])).values()];
  if (unique.length !== 100) throw new Error(`Hot 100 解析结果应为 100，实际为 ${unique.length}`);
  return unique.map((item, index) => ({ ...item, rank: index + 1 }));
}

async function queryLeetCode(slug) {
  const query = `query questionData($titleSlug: String!) { question(titleSlug: $titleSlug) { questionFrontendId translatedTitle translatedContent difficulty exampleTestcases codeSnippets { lang langSlug code } topicTags { translatedName slug } } }`;
  for (let attempt = 1; attempt <= 3; attempt += 1) {
    try {
      const response = await fetch('https://leetcode.cn/graphql/', {
        method: 'POST',
        headers: { 'content-type': 'application/json', 'user-agent': 'AlgoArena/1.0 local-study-tool' },
        body: JSON.stringify({ query, variables: { titleSlug: slug } }),
      });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      const payload = await response.json();
      if (!payload?.data?.question) throw new Error('题目不存在');
      return payload.data.question;
    } catch (error) {
      if (attempt === 3) throw error;
      await new Promise((resolve) => setTimeout(resolve, attempt * 800));
    }
  }
}

async function mapConcurrent(values, limit, mapper) {
  const output = new Array(values.length);
  let cursor = 0;
  await Promise.all(Array.from({ length: limit }, async () => {
    while (cursor < values.length) {
      const index = cursor++;
      output[index] = await mapper(values[index], index);
    }
  }));
  return output;
}

const acmTemplates = {
  java: `import java.io.*;\nimport java.util.*;\n\npublic class Main {\n    public static void main(String[] args) throws Exception {\n        Scanner scanner = new Scanner(System.in);\n        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。\n        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。\n        // TODO: 解析输入并输出答案。\n        scanner.close();\n    }\n}\n`,
};

async function main() {
  const codetopPages = await Promise.all([1, 2, 3, 4, 5].map(async (page) => {
    const payload = JSON.parse(await readFile(path.join(rawDir, `codetop-page-${page}.json`), 'utf8'));
    return payload.list.map((item, index) => ({
      rank: (page - 1) * 20 + index + 1,
      sourceEntryId: item.id,
      frontendId: String(item.leetcode.frontend_question_id),
      title: item.leetcode.title,
      slug: item.leetcode.slug_title,
      difficulty: ({ 1: '简单', 2: '中等', 3: '困难' })[item.leetcode.level] ?? '未知',
      frequency: item.value,
      updatedAt: item.time,
      fallbackContent: item.leetcode.content,
    }));
  }));
  const codetop = codetopPages.flat();
  if (codetop.length !== 100) throw new Error(`CodeTop 前五页应为 100，实际为 ${codetop.length}`);

  const hotHtml = await readFile(path.join(rawDir, 'hot100-source.html'), 'utf8');
  const hot100 = parseHot100(hotHtml);
  const slugs = [...new Set([...codetop.map((x) => x.slug), ...hot100.map((x) => x.slug)])];
  console.log(`正在读取 ${slugs.length} 道唯一题目的公开元数据...`);
  const details = await mapConcurrent(slugs, 6, async (slug, index) => {
    const data = await queryLeetCode(slug);
    console.log(`[${index + 1}/${slugs.length}] ${slug}`);
    return [slug, data];
  });
  const detailMap = new Map(details);
  const codetopIds = new Set(codetop.map((x) => x.frontendId));
  const hotIds = new Set(hot100.map((x) => x.frontendId));

  const enrich = (entry, source) => {
    const detail = detailMap.get(entry.slug);
    const contentHtml = detail?.translatedContent || entry.fallbackContent || '';
    return {
      ...entry,
      source,
      inBoth: source === 'codetop' ? hotIds.has(entry.frontendId) : codetopIds.has(entry.frontendId),
      sourceUrl: `https://leetcode.cn/problems/${entry.slug}/`,
      contentText: textOnly(contentHtml),
      samples: parseSamples(contentHtml),
      exampleTestcases: detail?.exampleTestcases ?? '',
      tags: detail?.topicTags?.map((tag) => tag.translatedName || tag.slug) ?? [],
      templates: Object.fromEntries((detail?.codeSnippets ?? [])
        .filter((snippet) => snippet.langSlug === 'java')
        .map((snippet) => [snippet.langSlug, snippet.code])),
      acmTemplates,
      fallbackContent: undefined,
    };
  };

  const seed = {
    generatedAt: new Date().toISOString(),
    stats: {
      codetop: codetop.length,
      hot100: hot100.length,
      overlap: hot100.filter((item) => codetopIds.has(item.frontendId)).length,
    },
    lists: {
      codetop: codetop.map((item) => enrich(item, 'codetop')),
      hot100: hot100.map((item) => enrich(item, 'hot100')),
    },
  };
  await mkdir(path.dirname(outputFile), { recursive: true });
  await writeFile(outputFile, `${JSON.stringify(seed, null, 2)}\n`, 'utf8');
  console.log(`已生成 ${outputFile}，交集 ${seed.stats.overlap} 道。`);
}

main().catch((error) => { console.error(error); process.exitCode = 1; });
