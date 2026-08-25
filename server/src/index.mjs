import express from 'express';
import cors from 'cors';
import { initializeDatabase, pool } from './database.mjs';

const app = express();
const port = Number(process.env.PORT || 8080);
const runnerUrl = process.env.RUNNER_URL || 'http://localhost:8090';

app.use(cors({ origin: true }));
app.use(express.json({ limit: '256kb' }));

app.get('/health', async (_req, res) => {
  try {
    await pool.query('SELECT 1');
    res.json({ status: 'ok', database: 'connected' });
  } catch (error) {
    res.status(503).json({ status: 'error', error: error.message });
  }
});

app.get('/api/stats', async (_req, res, next) => {
  try {
    const { rows } = await pool.query(`
      SELECT
        COUNT(*) FILTER (WHERE source='codetop')::int AS codetop,
        COUNT(*) FILTER (WHERE source='hot100')::int AS hot100,
        COUNT(*) FILTER (WHERE source='hot100' AND in_both)::int AS overlap,
        COUNT(*) FILTER (WHERE completed)::int AS completed
      FROM problem_entries
    `);
    res.json(rows[0]);
  } catch (error) { next(error); }
});

app.get('/api/problems', async (req, res, next) => {
  try {
    const source = req.query.source === 'hot100' ? 'hot100' : 'codetop';
    const q = String(req.query.q || '').trim();
    const difficulty = String(req.query.difficulty || '').trim();
    const page = Math.max(1, Number(req.query.page || 1));
    const limit = Math.min(100, Math.max(1, Number(req.query.limit || 20)));
    const params = [source];
    const where = ['source = $1'];
    if (q) { params.push(`%${q}%`); where.push(`(title ILIKE $${params.length} OR frontend_id ILIKE $${params.length})`); }
    if (difficulty) { params.push(difficulty); where.push(`difficulty = $${params.length}`); }
    const count = await pool.query(`SELECT COUNT(*)::int AS count FROM problem_entries WHERE ${where.join(' AND ')}`, params);
    params.push(limit, (page - 1) * limit);
    const { rows } = await pool.query(`
      SELECT id, source, rank, frontend_id AS "frontendId", title, slug, difficulty,
        category, frequency, in_both AS "inBoth", tags, completed, starred
      FROM problem_entries WHERE ${where.join(' AND ')}
      ORDER BY rank LIMIT $${params.length - 1} OFFSET $${params.length}
    `, params);
    res.json({ items: rows, total: count.rows[0].count, page, limit });
  } catch (error) { next(error); }
});

app.get('/api/problems/:source/:rank', async (req, res, next) => {
  try {
    const { rows } = await pool.query(`
      SELECT id, source, rank, frontend_id AS "frontendId", title, slug, difficulty,
        category, frequency, in_both AS "inBoth", source_url AS "sourceUrl",
        content_text AS "contentText", samples, tags, completed, starred
      FROM problem_entries WHERE source=$1 AND rank=$2
    `, [req.params.source, Number(req.params.rank)]);
    if (!rows[0]) return res.status(404).json({ error: '题目不存在' });
    res.json(rows[0]);
  } catch (error) { next(error); }
});

app.patch('/api/problems/:source/:rank/progress', async (req, res, next) => {
  try {
    const { completed, starred } = req.body || {};
    const { rows } = await pool.query(`
      UPDATE problem_entries SET
        completed=COALESCE($3, completed), starred=COALESCE($4, starred)
      WHERE source=$1 AND rank=$2
      RETURNING completed, starred
    `, [req.params.source, Number(req.params.rank), completed ?? null, starred ?? null]);
    if (!rows[0]) return res.status(404).json({ error: '题目不存在' });
    res.json(rows[0]);
  } catch (error) { next(error); }
});

app.post('/api/run', async (req, res, next) => {
  try {
    const { source, rank, mode = 'selftest', language = 'java', code } = req.body || {};
    if (language !== 'java') return res.status(400).json({ error: '当前仅支持 Java 17' });
    if (mode !== 'selftest') return res.status(400).json({ error: '当前仅支持自由练习' });
    if (typeof code !== 'string' || !code.trim() || code.length > 100000) return res.status(400).json({ error: '代码为空或过长' });
    const problem = await pool.query('SELECT id FROM problem_entries WHERE source=$1 AND rank=$2', [source, Number(rank)]);
    if (!problem.rows[0]) return res.status(404).json({ error: '题目不存在' });
    const response = await fetch(`${runnerUrl}/run`, {
      method: 'POST', headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ language, code, stdin: '' }), signal: AbortSignal.timeout(12000),
    });
    const result = await response.json();
    await pool.query(`INSERT INTO submissions(problem_entry_id,mode,language,source_code,stdin,status,stdout,stderr,duration_ms)
      VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9)`, [problem.rows[0].id, 'selftest', language, code, '', result.status, result.stdout || '', result.stderr || '', result.durationMs || null]);
    res.status(response.ok ? 200 : 400).json(result);
  } catch (error) { next(error); }
});

app.use((error, _req, res, _next) => {
  void _next;
  console.error(error);
  res.status(500).json({ error: error.message || '服务器内部错误' });
});

async function start() {
  for (let attempt = 1; attempt <= 20; attempt += 1) {
    try {
      await initializeDatabase();
      const { rows } = await pool.query('SELECT COUNT(*)::int AS count FROM problem_entries');
      if (rows[0].count === 0) throw new Error('题库为空，请重新创建数据库卷以执行初始化 SQL');
      console.log(`题库已就绪，共 ${rows[0].count} 条`);
      app.listen(port, '0.0.0.0', () => console.log(`API listening on ${port}`));
      return;
    } catch (error) {
      if (attempt === 20) throw error;
      console.log(`等待数据库 (${attempt}/20): ${error.message}`);
      await new Promise((resolve) => setTimeout(resolve, 1500));
    }
  }
}

start().catch((error) => { console.error(error); process.exit(1); });
