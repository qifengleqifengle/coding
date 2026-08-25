CREATE TABLE IF NOT EXISTS problem_entries (
  id BIGSERIAL PRIMARY KEY,
  source VARCHAR(16) NOT NULL CHECK (source IN ('codetop', 'hot100')),
  rank INTEGER NOT NULL,
  frontend_id VARCHAR(32) NOT NULL,
  source_entry_id BIGINT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL,
  difficulty VARCHAR(16) NOT NULL,
  category VARCHAR(64),
  frequency INTEGER,
  source_updated_at TIMESTAMPTZ,
  in_both BOOLEAN NOT NULL DEFAULT FALSE,
  source_url TEXT NOT NULL,
  content_text TEXT NOT NULL,
  samples JSONB NOT NULL DEFAULT '[]'::jsonb,
  example_testcases TEXT NOT NULL DEFAULT '',
  tags TEXT[] NOT NULL DEFAULT '{}',
  templates JSONB NOT NULL DEFAULT '{}'::jsonb,
  acm_templates JSONB NOT NULL DEFAULT '{}'::jsonb,
  completed BOOLEAN NOT NULL DEFAULT FALSE,
  starred BOOLEAN NOT NULL DEFAULT FALSE,
  imported_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(source, rank)
);

CREATE INDEX IF NOT EXISTS idx_problem_entries_source ON problem_entries(source, rank);
CREATE INDEX IF NOT EXISTS idx_problem_entries_frontend_id ON problem_entries(frontend_id);

CREATE TABLE IF NOT EXISTS submissions (
  id BIGSERIAL PRIMARY KEY,
  problem_entry_id BIGINT REFERENCES problem_entries(id) ON DELETE CASCADE,
  mode VARCHAR(16) NOT NULL CHECK (mode = 'selftest'),
  language VARCHAR(32) NOT NULL CHECK (language = 'java'),
  source_code TEXT NOT NULL,
  stdin TEXT NOT NULL DEFAULT '',
  status VARCHAR(32) NOT NULL,
  stdout TEXT NOT NULL DEFAULT '',
  stderr TEXT NOT NULL DEFAULT '',
  duration_ms INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
