import pg from 'pg';
import { readFile } from 'node:fs/promises';

const { Pool } = pg;
export const pool = new Pool({
  connectionString: process.env.DATABASE_URL || 'postgres://algo:algo@localhost:5432/algo_arena',
  max: 10,
});

export async function initializeDatabase() {
  const schema = await readFile(new URL('../sql/init.sql', import.meta.url), 'utf8');
  await pool.query(schema);
}
