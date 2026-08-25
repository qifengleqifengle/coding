import express from 'express';
import { mkdtemp, rm, writeFile } from 'node:fs/promises';
import { spawn } from 'node:child_process';
import { tmpdir } from 'node:os';
import path from 'node:path';

const app = express();
app.use(express.json({ limit: '256kb' }));

const configs = {
  java: { file: 'Main.java', compile: ['javac', ['-encoding', 'UTF-8', 'Main.java']], run: ['java', ['-Xmx128m', 'Main']] },
};

function execute(command, args, cwd, stdin, timeoutMs) {
  return new Promise((resolve) => {
    const started = Date.now();
    const child = spawn(command, args, { cwd, env: { PATH: process.env.PATH } });
    let stdout = '';
    let stderr = '';
    let overflow = false;
    const timer = setTimeout(() => child.kill('SIGKILL'), timeoutMs);
    const append = (target, chunk) => {
      const next = target + chunk.toString('utf8');
      if (next.length > 65536) { overflow = true; child.kill('SIGKILL'); return next.slice(0, 65536); }
      return next;
    };
    child.stdout.on('data', (chunk) => { stdout = append(stdout, chunk); });
    child.stderr.on('data', (chunk) => { stderr = append(stderr, chunk); });
    child.on('error', (error) => { clearTimeout(timer); resolve({ exitCode: -1, stdout, stderr: error.message, durationMs: Date.now() - started }); });
    child.on('close', (exitCode, signal) => {
      clearTimeout(timer);
      const timedOut = signal === 'SIGKILL' && !overflow;
      resolve({ exitCode, stdout, stderr, durationMs: Date.now() - started, timedOut, overflow });
    });
    if (stdin) child.stdin.write(stdin);
    child.stdin.end();
  });
}

app.get('/health', (_req, res) => res.json({ status: 'ok' }));

app.post('/run', async (req, res) => {
  const { language, code, stdin = '' } = req.body || {};
  const config = configs[language];
  if (!config) return res.status(400).json({ status: 'UNSUPPORTED_LANGUAGE', stderr: '不支持的语言' });
  const workDir = await mkdtemp(path.join(tmpdir(), 'algo-run-'));
  try {
    await writeFile(path.join(workDir, config.file), code, 'utf8');
    if (config.compile) {
      const compiled = await execute(config.compile[0], config.compile[1], workDir, '', 8000);
      if (compiled.exitCode !== 0) return res.status(400).json({ status: compiled.timedOut ? 'COMPILE_TIMEOUT' : 'COMPILE_ERROR', ...compiled });
    }
    const result = await execute(config.run[0], config.run[1], workDir, stdin, 3000);
    const status = result.timedOut ? 'TIME_LIMIT_EXCEEDED' : result.overflow ? 'OUTPUT_LIMIT_EXCEEDED' : result.exitCode === 0 ? 'FINISHED' : 'RUNTIME_ERROR';
    res.status(status === 'FINISHED' ? 200 : 400).json({ status, ...result });
  } catch (error) {
    res.status(500).json({ status: 'SYSTEM_ERROR', stderr: error.message });
  } finally {
    await rm(workDir, { recursive: true, force: true });
  }
});

app.listen(8090, '0.0.0.0', () => console.log('Runner listening on 8090'));
