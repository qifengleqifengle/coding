'use client';

import { useEffect, useMemo, useRef, useState } from 'react';
import CodeMirror from '@uiw/react-codemirror';
import { autocompletion, clearSnippet, completionKeymap, completionStatus, insertCompletionText, nextSnippetField, pickedCompletion, prevSnippetField, selectedCompletion } from '@codemirror/autocomplete';
import { java } from '@codemirror/lang-java';
import { indentWithTab, selectAll } from '@codemirror/commands';
import { HighlightStyle, indentUnit, syntaxHighlighting } from '@codemirror/language';
import { EditorSelection, EditorState, Prec } from '@codemirror/state';
import { EditorView, keymap } from '@codemirror/view';
import { tags } from '@lezer/highlight';
import { javaCompletionSource } from './java-completion';

type Source = 'codetop' | 'hot100';

type ProblemRow = {
  id: number; source: Source; rank: number; frontendId: string; title: string; slug: string;
  difficulty: string; category?: string; frequency?: number; inBoth: boolean; tags: string[];
  completed: boolean; starred: boolean;
};

type Sample = { input: string; output: string; explanation: string };
type ProblemDetail = ProblemRow & {
  sourceUrl: string; contentText: string; samples: Sample[];
};

const API = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080';
const SELFTEST_TEMPLATE = `import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        // 从这里开始写算法，并在 main 中写死用例。
        // System.out.println(...) 会显示在运行结果中。
    }
}
`;

const javaHighlightStyle = HighlightStyle.define([
  { tag: [tags.keyword, tags.controlKeyword, tags.definitionKeyword, tags.operatorKeyword], color: '#c792ea' },
  { tag: tags.modifier, color: '#89ddff' },
  { tag: [tags.className, tags.typeName], color: '#ffcb6b' },
  { tag: [tags.function(tags.variableName), tags.function(tags.propertyName)], color: '#82aaff' },
  { tag: [tags.variableName, tags.self], color: '#d7deea' },
  { tag: tags.definition(tags.variableName), color: '#f4f7ff' },
  { tag: [tags.propertyName, tags.attributeName], color: '#80cbc4' },
  { tag: [tags.number, tags.bool, tags.null, tags.atom], color: '#f78c6c' },
  { tag: [tags.string, tags.special(tags.string)], color: '#c3e88d' },
  { tag: tags.comment, color: '#676e85', fontStyle: 'italic' },
  { tag: [tags.operator, tags.compareOperator, tags.arithmeticOperator, tags.logicOperator], color: '#89ddff' },
  { tag: [tags.bracket, tags.squareBracket, tags.paren, tags.brace], color: '#aab4c8' },
  { tag: [tags.separator, tags.punctuation], color: '#76839a' },
]);

const editorTheme = EditorView.theme({
  '&, .cm-scroller': { backgroundColor: '#171b24' },
  '&': { height: '100%', color: '#d7deea', fontSize: '13px' },
  '&.cm-focused': { outline: 'none' },
  '.cm-scroller': { fontFamily: 'JetBrains Mono, Cascadia Code, ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace', lineHeight: '21px', color: '#d7deea' },
  '.cm-content': { minHeight: '100%', padding: '14px 0', backgroundColor: 'transparent', caretColor: '#ffcc66', cursor: 'text' },
  '.cm-line': { padding: '0 14px' },
  '.cm-gutters': { backgroundColor: '#171b24', color: '#63708a', border: 'none' },
  '.cm-lineNumbers .cm-gutterElement': { minWidth: '34px', padding: '0 10px 0 6px' },
  '.cm-foldGutter .cm-gutterElement': { color: '#58647a' },
  '.cm-selectionBackground, &.cm-focused .cm-selectionBackground': { backgroundColor: '#43577f !important' },
  '.cm-matchingBracket': { backgroundColor: '#2c3a4f', color: '#ffffff', outline: '1px solid #5fb3b3' },
  '.cm-cursor': { borderLeftColor: '#ffcc66' },
  '.cm-tooltip': { border: '1px solid #30384a', backgroundColor: '#1f2531', color: '#d7deea', boxShadow: '0 16px 42px rgba(0,0,0,.35)' },
  '.cm-tooltip-autocomplete': { borderRadius: '8px', overflow: 'hidden' },
  '.cm-tooltip-autocomplete ul': { fontFamily: 'inherit', maxHeight: '260px' },
  '.cm-tooltip-autocomplete ul li': { padding: '4px 10px', color: '#d7deea' },
  '.cm-tooltip-autocomplete ul li[aria-selected]': { backgroundColor: '#2d3a52', color: '#ffffff' },
  '.cm-completionLabel': { color: '#e5e9f2' },
  '.cm-completionDetail': { color: '#8793aa', marginLeft: '12px' },
}, { dark: true });

const editorBasicSetup = {
  lineNumbers: true,
  foldGutter: true,
  highlightActiveLine: false,
  highlightActiveLineGutter: false,
  bracketMatching: true,
  closeBrackets: true,
  autocompletion: false,
  indentOnInput: true,
};

function acceptSelectedCompletion(view: EditorView) {
  const completion = selectedCompletion(view.state);
  if (!completion) return false;
  const to = view.state.selection.main.head;
  const prefix = view.state.sliceDoc(0, to).match(/[A-Za-z_$][\w$]*$/)?.[0] ?? '';
  const from = to - prefix.length;
  if (typeof completion.apply === 'function') completion.apply(view, completion, from, to);
  else {
    const transaction = insertCompletionText(view.state, completion.apply ?? completion.label, from, to);
    view.dispatch({ ...transaction, annotations: pickedCompletion.of(completion) });
  }
  return true;
}

export default function Home() {
  const [source, setSource] = useState<Source>('codetop');
  const [rows, setRows] = useState<ProblemRow[]>([]);
  const [stats, setStats] = useState({ codetop: 100, hot100: 100, overlap: 0, completed: 0 });
  const [query, setQuery] = useState('');
  const [difficulty, setDifficulty] = useState('');
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(100);
  const [loading, setLoading] = useState(true);
  const [problem, setProblem] = useState<ProblemDetail | null>(null);
  const [code, setCode] = useState('');
  const [runResult, setRunResult] = useState<{ status: string; stdout?: string; stderr?: string; durationMs?: number } | null>(null);
  const [running, setRunning] = useState(false);
  const editorViewRef = useRef<EditorView | null>(null);
  const editorExtensions = useMemo(() => [
    java(),
    editorTheme,
    syntaxHighlighting(javaHighlightStyle),
    autocompletion({ override: [javaCompletionSource], activateOnTyping: true, icons: true }),
    indentUnit.of('    '),
    EditorState.tabSize.of(4),
    EditorState.allowMultipleSelections.of(true),
    EditorView.contentAttributes.of({ spellcheck: 'false', autocapitalize: 'off', autocomplete: 'off' }),
    EditorView.domEventHandlers({
      keydown(event, view) {
        if (event.key === 'Tab' && nextSnippetField(view)) {
          event.preventDefault();
          return true;
        }
        if (!['Enter', 'Tab'].includes(event.key) || completionStatus(view.state) !== 'active') return false;
        event.preventDefault();
        return acceptSelectedCompletion(view);
      },
    }),
    Prec.highest(keymap.of([
      ...completionKeymap,
      { key: 'Tab', run: nextSnippetField, shift: prevSnippetField },
      { key: 'Escape', run: clearSnippet },
      { key: 'Mod-a', run: selectAll },
      indentWithTab,
    ])),
  ], []);

  function selectEditorContent() {
    const view = editorViewRef.current;
    if (!view) return;
    view.dispatch({ selection: EditorSelection.single(0, view.state.doc.length), scrollIntoView: true });
    view.focus();
  }

  useEffect(() => {
    if (!problem) { editorViewRef.current = null; return; }
    const captureSelectAll = (event: KeyboardEvent) => {
      if (!(event.ctrlKey || event.metaKey) || event.altKey || event.key.toLowerCase() !== 'a') return;
      if (!editorViewRef.current?.hasFocus) return;
      event.preventDefault();
      event.stopImmediatePropagation();
      selectEditorContent();
    };
    document.addEventListener('keydown', captureSelectAll, true);
    return () => document.removeEventListener('keydown', captureSelectAll, true);
  }, [problem]);

  useEffect(() => { fetch(`${API}/api/stats`).then((r) => r.json()).then(setStats).catch(() => undefined); }, []);
  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(true);
      const params = new URLSearchParams({ source, page: String(page), limit: '20' });
      if (query) params.set('q', query);
      if (difficulty) params.set('difficulty', difficulty);
      fetch(`${API}/api/problems?${params}`).then((r) => r.json()).then((data) => { setRows(data.items || []); setTotal(data.total || 0); }).catch(() => { setRows([]); setTotal(0); }).finally(() => setLoading(false));
    }, 180);
    return () => clearTimeout(timer);
  }, [source, query, difficulty, page]);

  const pages = Math.max(1, Math.ceil(total / 20));
  const completedPercent = useMemo(() => Math.round((stats.completed / 200) * 100), [stats.completed]);

  async function openProblem(row: ProblemRow) {
    const detail = await fetch(`${API}/api/problems/${row.source}/${row.rank}`).then((r) => r.json()) as ProblemDetail;
    setProblem(detail);
    setCode(SELFTEST_TEMPLATE);
    setRunResult(null);
  }

  async function updateProgress(field: 'completed' | 'starred', value: boolean) {
    if (!problem) return;
    const updated = await fetch(`${API}/api/problems/${problem.source}/${problem.rank}/progress`, {
      method: 'PATCH', headers: { 'content-type': 'application/json' }, body: JSON.stringify({ [field]: value }),
    }).then((r) => r.json());
    setProblem({ ...problem, ...updated });
    setRows((current) => current.map((row) => row.rank === problem.rank && row.source === problem.source ? { ...row, ...updated } : row));
    fetch(`${API}/api/stats`).then((r) => r.json()).then(setStats);
  }

  async function runCode() {
    if (!problem || running) return;
    setRunning(true); setRunResult(null);
    try {
      const result = await fetch(`${API}/api/run`, {
        method: 'POST', headers: { 'content-type': 'application/json' },
        body: JSON.stringify({
          source: problem.source, rank: problem.rank, mode: 'selftest', language: 'java', code,
        }),
      }).then(async (r) => ({ ok: r.ok, body: await r.json() }));
      setRunResult(result.body);
    } catch (error) {
      setRunResult({ status: 'SYSTEM_ERROR', stderr: error instanceof Error ? error.message : '运行失败' });
    } finally { setRunning(false); }
  }

  return (
    <main className="min-h-screen bg-[#f6f7fb] text-[13px] text-[#172033]">
      <header className="sticky top-0 z-20 border-b border-[#e7e9f2] bg-white/95 backdrop-blur">
        <div className="mx-auto flex max-w-[1540px] items-center justify-between px-4 py-2 lg:px-6">
          <div className="flex items-center gap-2.5"><div className="grid h-8 w-8 place-items-center rounded-lg bg-[#6657f5] text-xs font-black text-white">A</div><div><div className="text-sm font-semibold tracking-tight">Algo Arena</div><div className="text-[10px] text-[#8690a8]">本地算法训练台</div></div></div>
          <div className="flex items-center gap-3"><div className="hidden text-right sm:block"><div className="text-xs font-medium text-[#59637b]">总进度 {stats.completed}/200</div><div className="mt-1 h-1.5 w-28 overflow-hidden rounded-full bg-[#e9ebf2]"><div className="h-full rounded-full bg-[#6657f5]" style={{ width: `${completedPercent}%` }} /></div></div><div className="flex items-center gap-2 rounded-full bg-[#f1f8f4] px-3 py-1.5 text-xs font-medium text-[#27865a]"><span className="h-2 w-2 rounded-full bg-[#34b779]" /> localhost</div></div>
        </div>
      </header>

      <section className="mx-auto max-w-[1540px] px-4 py-4 lg:px-6">
        <div className="mb-4 flex flex-col justify-between gap-3 md:flex-row md:items-end">
          <div><p className="mb-1 text-[10px] font-semibold tracking-wider text-[#6657f5]">INTERVIEW PRACTICE</p><h1 className="text-2xl font-bold tracking-tight">今天，从高频题开始。</h1><p className="mt-1.5 text-xs text-[#69738d]">两个题单独立保留，重合题目用“双榜”标记。</p></div>
          <div className="grid grid-cols-3 gap-2">{[[stats.codetop,'CodeTop'],[stats.hot100,'Hot 100'],[stats.overlap,'交集题']].map(([value,label]) => <div key={String(label)} className="min-w-20 rounded-xl border border-[#e5e8f1] bg-white px-3 py-2 shadow-sm"><div className="text-base font-bold">{value}</div><div className="text-[10px] text-[#8a93a9]">{label}</div></div>)}</div>
        </div>

        <div className="overflow-hidden rounded-2xl border border-[#e2e5ef] bg-white shadow-[0_10px_35px_rgba(31,38,65,.06)]">
          <div className="flex flex-col gap-3 border-b border-[#eceef4] p-3 lg:flex-row lg:items-center lg:justify-between">
            <div className="flex w-fit rounded-lg bg-[#f3f4f8] p-1">{(['codetop','hot100'] as Source[]).map((item) => <button key={item} onClick={() => { setSource(item); setPage(1); }} className={`rounded-md px-3 py-1.5 text-xs font-semibold transition ${source === item ? 'bg-white text-[#5b4ce8] shadow-sm' : 'text-[#727b91]'}`}>{item === 'codetop' ? 'CodeTop 前五页' : 'LeetCode Hot 100'}</button>)}</div>
            <div className="flex flex-col gap-2 sm:flex-row"><select aria-label="筛选难度" value={difficulty} onChange={(e) => { setDifficulty(e.target.value); setPage(1); }} className="rounded-lg border border-[#e2e5ee] bg-[#fafbfc] px-3 py-1.5 text-xs text-[#606a80] outline-none"><option value="">全部难度</option><option>简单</option><option>中等</option><option>困难</option></select><label className="flex min-w-[250px] items-center gap-2 rounded-lg border border-[#e2e5ee] bg-[#fafbfc] px-3 py-1.5 text-xs text-[#8b93a6]"><span>⌕</span><input value={query} onChange={(e) => { setQuery(e.target.value); setPage(1); }} aria-label="搜索题目" className="w-full bg-transparent outline-none" placeholder="搜索题号或题目名称" /></label></div>
          </div>

          <div className="overflow-x-auto"><table className="w-full min-w-[830px] text-left">
            <thead className="bg-[#fafbfc] text-[10px] tracking-wider text-[#9199ac]"><tr><th className="px-4 py-2.5">进度</th><th className="px-3 py-2.5">排名</th><th className="px-3 py-2.5">题目</th><th className="px-3 py-2.5">难度</th><th className="px-3 py-2.5">{source === 'codetop' ? '出现频度' : '专题'}</th><th className="px-4 py-2.5 text-right">操作</th></tr></thead>
            <tbody className="divide-y divide-[#eef0f5]">{loading ? <tr><td colSpan={6} className="px-4 py-12 text-center text-xs text-[#8b93a6]">正在读取本地题库…</td></tr> : rows.map((row) => <tr key={`${row.source}-${row.rank}`} className="group hover:bg-[#fafaff]">
              <td className="px-4 py-2.5"><span className={`grid h-4 w-4 place-items-center rounded-full border text-[9px] ${row.completed ? 'border-[#34b779] bg-[#34b779] text-white' : 'border-[#cfd4e0]'}`}>{row.completed ? '✓' : ''}</span></td>
              <td className="px-3 py-2.5 font-mono text-xs text-[#9aa2b5]">{String(row.rank).padStart(2,'0')}</td>
              <td className="px-3 py-2.5"><div className="flex items-center gap-2"><span className="font-mono text-xs text-[#8d95a9]">{row.frontendId}</span><span className="font-semibold">{row.title}</span>{row.inBoth && <span className="rounded-full bg-[#eeeaff] px-2 py-0.5 text-[9px] font-semibold text-[#6657f5]">双榜</span>}</div></td>
              <td className="px-3 py-2.5"><span className={`text-xs font-medium ${row.difficulty === '困难' ? 'text-[#e65568]' : row.difficulty === '简单' ? 'text-[#27966a]' : 'text-[#d3892b]'}`}>{row.difficulty}</span></td>
              <td className="px-3 py-2.5 text-xs text-[#667087]">{source === 'codetop' ? row.frequency : row.category}</td>
              <td className="px-4 py-2.5 text-right"><button onClick={() => openProblem(row)} className="rounded-md bg-[#6657f5] px-3 py-1.5 text-[11px] font-semibold text-white opacity-90 transition group-hover:opacity-100">开始练习</button></td>
            </tr>)}</tbody>
          </table></div>
          <div className="flex items-center justify-between border-t border-[#eceef4] px-4 py-2.5 text-xs text-[#7e879c]"><span>共 {total} 道 · 第 {page}/{pages} 页</span><div className="flex gap-1.5"><button disabled={page === 1} onClick={() => setPage((x) => x - 1)} className="rounded-md border border-[#e0e3ec] px-2.5 py-1 disabled:cursor-not-allowed disabled:opacity-40">上一页</button><button disabled={page === pages} onClick={() => setPage((x) => x + 1)} className="rounded-md border border-[#e0e3ec] px-2.5 py-1 disabled:cursor-not-allowed disabled:opacity-40">下一页</button></div></div>
        </div>
      </section>

      {problem && <div className="fixed inset-0 z-50 flex flex-col bg-[#f6f7fb] text-[#172033]">
        <header className="flex items-center justify-between border-b border-[#e2e5ee] bg-white px-4 py-2"><div className="flex min-w-0 items-center gap-2"><button onClick={() => setProblem(null)} className="rounded-md border border-[#e1e4ed] bg-white px-2.5 py-1.5 text-xs text-[#25304a]">← 返回题单</button><div className="truncate"><span className="mr-1.5 font-mono text-xs text-[#929aae]">{problem.frontendId}</span><span className="font-semibold text-[#172033]">{problem.title}</span>{problem.inBoth && <span className="ml-1.5 rounded-full bg-[#eeeaff] px-1.5 py-0.5 text-[9px] font-bold text-[#6657f5]">双榜</span>}</div></div><div className="flex gap-1.5"><button onClick={() => updateProgress('starred', !problem.starred)} className={`rounded-md border px-2.5 py-1.5 text-xs ${problem.starred ? 'border-[#f0bb54] bg-[#fff8e8] text-[#a96d13]' : 'border-[#e1e4ed] bg-white text-[#25304a]'}`}>{problem.starred ? '★ 已收藏' : '☆ 收藏'}</button><button onClick={() => updateProgress('completed', !problem.completed)} className={`rounded-md px-2.5 py-1.5 text-xs font-semibold ${problem.completed ? 'bg-[#e8f7ef] text-[#24835a]' : 'bg-[#6657f5] text-white'}`}>{problem.completed ? '✓ 已完成' : '标记完成'}</button></div></header>
        <div className="grid min-h-0 flex-1 lg:grid-cols-[35%_65%]">
          <section className="min-h-0 overflow-y-auto border-r border-[#e0e3ec] bg-white px-4 py-4 text-[#3f4960] lg:px-5"><div className="mb-2.5 flex flex-wrap items-center gap-1.5"><span className={`rounded-full px-2 py-0.5 text-[10px] font-semibold ${problem.difficulty === '困难' ? 'bg-[#fff0f2] text-[#d94c61]' : problem.difficulty === '简单' ? 'bg-[#eaf8f1] text-[#26845a]' : 'bg-[#fff7e9] text-[#bd7521]'}`}>{problem.difficulty}</span>{problem.tags.slice(0,5).map((tag) => <span key={tag} className="rounded-full bg-[#f0f2f7] px-2 py-0.5 text-[10px] text-[#657087]">{tag}</span>)}</div><h1 className="text-lg font-bold text-[#172033]">{problem.title}</h1><a href={problem.sourceUrl} target="_blank" rel="noreferrer" className="mt-1 inline-block text-[10px] text-[#6657f5] hover:underline">打开力扣原题 ↗</a><div className="mt-4 whitespace-pre-wrap text-xs leading-5 text-[#3f4960]">{problem.contentText}</div>
            <div className="mt-5"><h2 className="mb-2 text-sm font-bold text-[#172033]">样例</h2>{problem.samples.length ? problem.samples.map((sample, index) => <div key={index} className="mb-2 rounded-lg border border-[#e4e7ef] bg-[#f9fafc] p-3"><div className="mb-1 text-[10px] font-bold text-[#8a93a8]">样例 {index + 1}</div><pre className="whitespace-pre-wrap text-[11px] leading-5 text-[#25304a]"><b>输入</b>  {sample.input}\n<b>输出</b>  {sample.output}{sample.explanation ? `\n解释  ${sample.explanation}` : ''}</pre></div>) : <p className="text-xs text-[#8a93a8]">该题使用交互式或结构化测试数据，请参考原题说明。</p>}</div>
          </section>

          <section className="flex min-h-0 flex-col bg-[#171b24] text-[#e7eaf1]"><div className="flex items-center justify-between border-b border-white/10 px-3 py-2"><span className="text-xs font-semibold text-[#cbd1dd]">自由练习</span><div className="flex items-center gap-1.5"><button type="button" title="全选代码 (Ctrl/Cmd+A)" onMouseDown={(event) => event.preventDefault()} onClick={selectEditorContent} className="rounded-md border border-white/10 bg-[#242a37] px-2 py-1 text-[10px] text-[#cbd1dd] hover:bg-[#2d3545]">全选</button><span className="rounded-md border border-white/10 bg-[#242a37] px-2 py-1 text-[10px] text-[#cbd1dd]">Java 17</span></div></div>
            <div className="relative min-h-[300px] flex-1 overflow-hidden" onKeyDownCapture={(event) => { const view = editorViewRef.current; if (!view) return; if (event.key === 'Tab' && nextSnippetField(view)) { event.preventDefault(); event.stopPropagation(); return; } if (['Enter', 'Tab'].includes(event.key) && completionStatus(view.state) === 'active') { event.preventDefault(); event.stopPropagation(); acceptSelectedCompletion(view); } }} onKeyDown={(event) => { if ((event.ctrlKey || event.metaKey) && event.key === 'Enter') { event.preventDefault(); void runCode(); } }}><CodeMirror aria-label="代码编辑器" value={code} height="100%" extensions={editorExtensions} onCreateEditor={(view) => { editorViewRef.current = view; }} onChange={setCode} basicSetup={editorBasicSetup} className="absolute inset-0 h-full [&_.cm-editor]:h-full" /></div>
            <div className="max-h-[28%] min-h-[150px] border-t border-white/10 p-3"><div className="mb-1.5 flex items-center justify-between"><span className="text-[11px] font-semibold text-[#aeb5c4]">控制台</span><span className={`text-[10px] ${runResult?.status === 'FINISHED' ? 'text-[#54d69a]' : runResult ? 'text-[#ff788a]' : 'text-[#747e93]'}`}>{running ? '运行中…' : runResult ? `${runResult.status === 'FINISHED' ? '运行完成' : '运行失败'}${runResult.durationMs != null ? ` · ${runResult.durationMs} ms` : ''}` : ''}</span></div><div className="h-[108px] overflow-auto rounded-md bg-[#0f1219] p-2.5 font-mono text-[11px] leading-5">{running ? <span className="text-[#6f788b]">正在运行程序…</span> : !runResult ? <span className="text-[#6f788b]">程序输出会显示在这里</span> : <>{runResult.stdout ? <pre className="whitespace-pre-wrap text-[#dce1eb]">{runResult.stdout}</pre> : runResult.status === 'FINISHED' && <span className="text-[#6f788b]">（程序没有输出）</span>}{runResult.stderr && <pre className="whitespace-pre-wrap text-[#ff8897]">{runResult.stderr}</pre>}</>}</div></div>
            <div className="flex items-center justify-between border-t border-white/10 bg-[#1b202b] px-3 py-2"><p className="text-[10px] text-[#7f899e]">Tab 4 空格 · Shift+Tab 反缩进 · Ctrl/Cmd+Enter 运行</p><button disabled={running} onClick={runCode} className="rounded-md bg-[#6657f5] px-4 py-1.5 text-xs font-semibold text-white disabled:cursor-not-allowed disabled:opacity-40">{running ? '运行中' : '▶ 运行'}</button></div>
          </section>
        </div>
      </div>}
    </main>
  );
}
