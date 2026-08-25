import assert from 'node:assert/strict';

const api = process.env.API_URL || 'http://localhost:8080';
const request = async (url, options) => {
  const response = await fetch(url, options);
  const body = await response.json();
  return { response, body };
};
const json = async (url, options) => {
  const { response, body } = await request(url, options);
  if (!response.ok) throw new Error(`${url}: ${response.status} ${JSON.stringify(body)}`);
  return body;
};

const stats = await json(`${api}/api/stats`);
assert.deepEqual({ codetop: stats.codetop, hot100: stats.hot100, overlap: stats.overlap }, { codetop: 100, hot100: 100, overlap: 67 });

for (const source of ['codetop', 'hot100']) {
  const list = await json(`${api}/api/problems?source=${source}&limit=100`);
  assert.equal(list.total, 100);
  assert.equal(list.items.length, 100);
  assert.equal(list.items.filter((item) => item.inBoth).length, 67);
}

const search = await json(`${api}/api/problems?source=codetop&q=${encodeURIComponent('两数之和')}&limit=20`);
const row = search.items.find((item) => item.frontendId === '1');
assert.ok(row, 'CodeTop 中缺少两数之和');
const detail = await json(`${api}/api/problems/codetop/${row.rank}`);
assert.ok(detail.samples.length > 0);
assert.equal(detail.templates, undefined);
assert.equal(detail.acmTemplates, undefined);

const javaMain = 'public class Main { public static void main(String[] args) { System.out.println("OK"); } }';
const selftest = await json(`${api}/api/run`, {
  method: 'POST', headers: { 'content-type': 'application/json' },
  body: JSON.stringify({ source: 'codetop', rank: row.rank, mode: 'selftest', language: 'java', code: javaMain }),
});
assert.equal(selftest.status, 'FINISHED');
assert.equal(selftest.stdout.trim(), 'OK');

const unsupported = await request(`${api}/api/run`, {
  method: 'POST', headers: { 'content-type': 'application/json' },
  body: JSON.stringify({ source: 'codetop', rank: row.rank, mode: 'selftest', language: 'python3', code: 'print(1)' }),
});
assert.equal(unsupported.response.status, 400);

const removedMode = await request(`${api}/api/run`, {
  method: 'POST', headers: { 'content-type': 'application/json' },
  body: JSON.stringify({ source: 'codetop', rank: row.rank, mode: 'acm', language: 'java', code: javaMain }),
});
assert.equal(removedMode.response.status, 400);

console.log('Smoke test passed:', { stats, language: 'java', mode: 'selftest' });
