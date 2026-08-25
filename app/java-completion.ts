import { snippetCompletion, type Completion, type CompletionContext } from '@codemirror/autocomplete';
import { ensureSyntaxTree, syntaxTree } from '@codemirror/language';
import type { SyntaxNode } from '@lezer/common';

type SymbolKind = 'variable' | 'function' | 'class';
type JavaSymbol = { name: string; kind: SymbolKind; javaType?: string };
type Analysis = {
  symbols: Map<string, JavaSymbol>;
  classMembers: Map<string, Completion[]>;
  classFields: Map<string, Map<string, string>>;
  classMethods: Map<string, Map<string, string>>;
  currentClass?: string;
};

const JAVA_KEYWORDS = [
  'abstract', 'assert', 'boolean', 'break', 'byte', 'case', 'catch', 'char', 'class', 'const',
  'continue', 'default', 'do', 'double', 'else', 'enum', 'extends', 'false', 'final', 'finally',
  'float', 'for', 'goto', 'if', 'implements', 'import', 'instanceof', 'int', 'interface', 'long',
  'native', 'new', 'null', 'package', 'private', 'protected', 'public', 'return', 'short', 'static',
  'strictfp', 'super', 'switch', 'synchronized', 'this', 'throw', 'throws', 'transient', 'true',
  'try', 'var', 'void', 'volatile', 'while',
] as const;

const COMMON_CLASSES = [
  'ArrayDeque', 'ArrayList', 'Arrays', 'Collections', 'Comparator', 'Deque', 'HashMap', 'HashSet',
  'LinkedHashMap', 'LinkedHashSet', 'LinkedList', 'List', 'Map', 'Math', 'Objects', 'Optional',
  'PriorityQueue', 'Queue', 'Set', 'Stack', 'Stream', 'String', 'StringBuilder', 'TreeMap', 'TreeSet',
] as const;

const PRIMITIVES = new Set(['boolean', 'byte', 'char', 'double', 'float', 'int', 'long', 'short', 'void']);
const LEXICAL_SCOPES = new Set([
  'Block', 'MethodDeclaration', 'ConstructorDeclaration', 'LambdaExpression', 'ForStatement',
  'EnhancedForStatement', 'CatchClause', 'SwitchBlock', 'ClassBody',
]);

function method(label: string, apply = `${label}()`, detail = '方法'): Completion {
  if (apply.includes('${')) return snippetCompletion(apply, { label, type: 'method', detail });
  return { label, apply, type: 'method', detail };
}

const objectMembers = [
  method('equals', 'equals(${object})', 'Object'), method('hashCode', 'hashCode()', 'Object'),
  method('toString', 'toString()', 'Object'),
];
const collectionMembers = [
  method('add', 'add(${value})', 'Collection'), method('clear', 'clear()', 'Collection'),
  method('contains', 'contains(${value})', 'Collection'), method('isEmpty', 'isEmpty()', 'Collection'),
  method('remove', 'remove(${value})', 'Collection'), method('size', 'size()', 'Collection'),
  method('stream', 'stream()', 'Collection'), method('toArray', 'toArray()', 'Collection'),
];

const memberGroups: Record<string, Completion[]> = {
  array: [{ label: 'length', type: 'property', detail: '数组长度' }, method('clone', 'clone()', '数组')],
  String: [
    method('charAt', 'charAt(${index})', 'String'), method('compareTo', 'compareTo(${other})', 'String'),
    method('contains', 'contains(${text})', 'String'), method('endsWith', 'endsWith(${suffix})', 'String'),
    method('equals', 'equals(${other})', 'String'), method('indexOf', 'indexOf(${value})', 'String'),
    method('isEmpty', 'isEmpty()', 'String'), method('lastIndexOf', 'lastIndexOf(${value})', 'String'),
    method('length', 'length()', 'String'), method('replace', 'replace(${oldValue}, ${newValue})', 'String'),
    method('split', 'split(${regex})', 'String'), method('startsWith', 'startsWith(${prefix})', 'String'),
    method('substring', 'substring(${beginIndex}, ${endIndex})', 'String'), method('toCharArray', 'toCharArray()', 'String'),
    method('toLowerCase', 'toLowerCase()', 'String'), method('toUpperCase', 'toUpperCase()', 'String'),
    method('trim', 'trim()', 'String'), ...objectMembers,
  ],
  StringBuilder: [
    method('append', 'append(${value})', 'StringBuilder'), method('charAt', 'charAt(${index})', 'StringBuilder'),
    method('delete', 'delete(${start}, ${end})', 'StringBuilder'), method('deleteCharAt', 'deleteCharAt(${index})', 'StringBuilder'),
    method('insert', 'insert(${offset}, ${value})', 'StringBuilder'), method('length', 'length()', 'StringBuilder'),
    method('reverse', 'reverse()', 'StringBuilder'), method('setCharAt', 'setCharAt(${index}, ${char})', 'StringBuilder'),
    method('substring', 'substring(${start}, ${end})', 'StringBuilder'), method('toString', 'toString()', 'StringBuilder'),
  ],
  List: [
    ...collectionMembers, method('get', 'get(${index})', 'List'), method('indexOf', 'indexOf(${value})', 'List'),
    method('set', 'set(${index}, ${value})', 'List'), method('sort', 'sort(${comparator})', 'List'),
    method('subList', 'subList(${from}, ${to})', 'List'), ...objectMembers,
  ],
  Set: [...collectionMembers, ...objectMembers],
  Collection: [...collectionMembers, ...objectMembers],
  Map: [
    method('clear', 'clear()', 'Map'), method('containsKey', 'containsKey(${key})', 'Map'),
    method('containsValue', 'containsValue(${value})', 'Map'), method('entrySet', 'entrySet()', 'Map'),
    method('get', 'get(${key})', 'Map'), method('getOrDefault', 'getOrDefault(${key}, ${defaultValue})', 'Map'),
    method('isEmpty', 'isEmpty()', 'Map'), method('keySet', 'keySet()', 'Map'),
    method('put', 'put(${key}, ${value})', 'Map'), method('putIfAbsent', 'putIfAbsent(${key}, ${value})', 'Map'),
    method('remove', 'remove(${key})', 'Map'), method('size', 'size()', 'Map'), method('values', 'values()', 'Map'),
    ...objectMembers,
  ],
  Queue: [
    ...collectionMembers, method('offer', 'offer(${value})', 'Queue'), method('peek', 'peek()', 'Queue'),
    method('poll', 'poll()', 'Queue'), method('remove', 'remove()', 'Queue'), ...objectMembers,
  ],
  Deque: [
    ...collectionMembers, method('addFirst', 'addFirst(${value})', 'Deque'), method('addLast', 'addLast(${value})', 'Deque'),
    method('offerFirst', 'offerFirst(${value})', 'Deque'), method('offerLast', 'offerLast(${value})', 'Deque'),
    method('peekFirst', 'peekFirst()', 'Deque'), method('peekLast', 'peekLast()', 'Deque'),
    method('pollFirst', 'pollFirst()', 'Deque'), method('pollLast', 'pollLast()', 'Deque'),
    method('pop', 'pop()', 'Deque'), method('push', 'push(${value})', 'Deque'), ...objectMembers,
  ],
  Stream: [
    method('allMatch', 'allMatch(${predicate})', 'Stream'), method('anyMatch', 'anyMatch(${predicate})', 'Stream'),
    method('collect', 'collect(${collector})', 'Stream'), method('count', 'count()', 'Stream'),
    method('distinct', 'distinct()', 'Stream'), method('filter', 'filter(${predicate})', 'Stream'),
    method('findFirst', 'findFirst()', 'Stream'), method('forEach', 'forEach(${consumer})', 'Stream'),
    method('limit', 'limit(${maxSize})', 'Stream'), method('map', 'map(${mapper})', 'Stream'),
    method('sorted', 'sorted()', 'Stream'), method('toList', 'toList()', 'Stream'),
  ],
  Math: [
    method('abs', 'abs(${value})', 'Math'), method('max', 'max(${a}, ${b})', 'Math'),
    method('min', 'min(${a}, ${b})', 'Math'), method('pow', 'pow(${a}, ${b})', 'Math'),
    method('sqrt', 'sqrt(${value})', 'Math'), { label: 'PI', type: 'constant', detail: 'Math' },
  ],
  Arrays: [
    method('asList', 'asList(${items})', 'Arrays'), method('binarySearch', 'binarySearch(${array}, ${key})', 'Arrays'),
    method('copyOf', 'copyOf(${array}, ${length})', 'Arrays'), method('equals', 'equals(${a}, ${b})', 'Arrays'),
    method('fill', 'fill(${array}, ${value})', 'Arrays'), method('sort', 'sort(${array})', 'Arrays'),
    method('stream', 'stream(${array})', 'Arrays'), method('toString', 'toString(${array})', 'Arrays'),
  ],
  Collections: [
    method('binarySearch', 'binarySearch(${list}, ${key})', 'Collections'), method('max', 'max(${collection})', 'Collections'),
    method('min', 'min(${collection})', 'Collections'), method('reverse', 'reverse(${list})', 'Collections'),
    method('sort', 'sort(${list})', 'Collections'), method('swap', 'swap(${list}, ${i}, ${j})', 'Collections'),
  ],
  PrintStream: [
    method('print', 'print(${value})', 'System.out'), method('printf', 'printf(${format}, ${args})', 'System.out'),
    method('println', 'println(${value})', 'System.out'),
  ],
};

const staticMemberGroups: Record<string, Completion[]> = {
  Math: memberGroups.Math,
  Arrays: memberGroups.Arrays,
  Collections: memberGroups.Collections,
  List: [method('copyOf', 'copyOf(${collection})', 'List'), method('of', 'of(${elements})', 'List')],
  Set: [method('copyOf', 'copyOf(${collection})', 'Set'), method('of', 'of(${elements})', 'Set')],
  Map: [method('copyOf', 'copyOf(${map})', 'Map'), method('of', 'of(${entries})', 'Map')],
};

const globalCompletions: Completion[] = [
  snippetCompletion('public static void main(String[] args) {\n    ${}\n}', { label: 'main', detail: '代码片段', type: 'function' }),
  snippetCompletion('for (int ${i} = 0; ${i} < ${n}; ${i}++) {\n    ${}\n}', { label: 'fori', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('for (${Type} ${item} : ${items}) {\n    ${}\n}', { label: 'foreach', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('while (${condition}) {\n    ${}\n}', { label: 'while', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('if (${condition}) {\n    ${}\n}', { label: 'if', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('if (${condition}) {\n    ${}\n} else {\n    ${}\n}', { label: 'ifelse', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('try {\n    ${}\n} catch (${Exception} e) {\n    ${}\n}', { label: 'trycatch', detail: '代码片段', type: 'keyword' }),
  snippetCompletion('System.out.println(${value});', { label: 'sout', detail: '代码片段', type: 'function' }),
  snippetCompletion('new ArrayList<>();', { label: 'new ArrayList', detail: '构造器', type: 'constructor' }),
  snippetCompletion('new HashMap<>();', { label: 'new HashMap', detail: '构造器', type: 'constructor' }),
  snippetCompletion('new HashSet<>();', { label: 'new HashSet', detail: '构造器', type: 'constructor' }),
  snippetCompletion('new PriorityQueue<>();', { label: 'new PriorityQueue', detail: '构造器', type: 'constructor' }),
  ...COMMON_CLASSES.map((label) => ({ label, type: 'class' as const, detail: 'Java 常用类' })),
  ...JAVA_KEYWORDS.map((label) => ({ label, type: 'keyword' as const })),
];

function walk(node: SyntaxNode, visit: (node: SyntaxNode) => void) {
  visit(node);
  for (let child = node.firstChild; child; child = child.nextSibling) walk(child, visit);
}

function directChild(node: SyntaxNode, name: string) {
  for (let child = node.firstChild; child; child = child.nextSibling) if (child.name === name) return child;
  return null;
}

function textOf(node: SyntaxNode, source: string) {
  return source.slice(node.from, node.to);
}

function typeNode(node: SyntaxNode) {
  for (let child = node.firstChild; child; child = child.nextSibling) {
    if (child.name === 'void' || child.name === 'var' || (child.name.includes('Type') && child.name !== 'TypeArguments')) return child;
  }
  return null;
}

function baseType(javaType: string) {
  return javaType.replace(/^static:/, '').replace(/(?:\[\])+$/, '').replace(/<.*>/, '');
}

function canonicalType(rawType: string) {
  const compact = rawType.replace(/\s+/g, '');
  const arraySuffix = compact.match(/(?:\[\])+$/)?.[0] ?? '';
  const withoutArray = compact.slice(0, compact.length - arraySuffix.length);
  const genericIndex = withoutArray.indexOf('<');
  const rawBase = genericIndex < 0 ? withoutArray : withoutArray.slice(0, genericIndex);
  const generic = genericIndex < 0 ? '' : withoutArray.slice(genericIndex);
  const aliases: Record<string, string> = {
    ArrayList: 'List', LinkedList: 'List', Stack: 'List', HashSet: 'Set', LinkedHashSet: 'Set', TreeSet: 'Set',
    HashMap: 'Map', LinkedHashMap: 'Map', TreeMap: 'Map', PriorityQueue: 'Queue', ArrayDeque: 'Deque',
  };
  return `${aliases[rawBase] ?? rawBase}${generic}${arraySuffix}`;
}

function genericArguments(javaType: string) {
  const start = javaType.indexOf('<');
  const end = javaType.lastIndexOf('>');
  if (start < 0 || end < start) return [];
  const result: string[] = [];
  let depth = 0;
  let chunk = '';
  for (const char of javaType.slice(start + 1, end)) {
    if (char === '<') depth += 1;
    if (char === '>') depth -= 1;
    if (char === ',' && depth === 0) { result.push(chunk); chunk = ''; }
    else chunk += char;
  }
  if (chunk) result.push(chunk);
  return result.map((value) => canonicalType(value));
}

function matchingOpen(text: string, closeIndex: number, openChar: string, closeChar: string) {
  let depth = 0;
  for (let index = closeIndex; index >= 0; index -= 1) {
    if (text[index] === closeChar) depth += 1;
    else if (text[index] === openChar && --depth === 0) return index;
  }
  return -1;
}

function lastTopLevelDot(text: string) {
  let round = 0;
  let square = 0;
  for (let index = text.length - 1; index >= 0; index -= 1) {
    const char = text[index];
    if (char === ')') round += 1;
    else if (char === '(') round -= 1;
    else if (char === ']') square += 1;
    else if (char === '[') square -= 1;
    else if (char === '.' && round === 0 && square === 0) return index;
  }
  return -1;
}

function methodReturnType(receiverType: string, name: string) {
  const isStatic = receiverType.startsWith('static:');
  const group = baseType(receiverType);
  const args = genericArguments(receiverType);
  if (isStatic) {
    if (['List', 'Set'].includes(group) && ['copyOf', 'of'].includes(name)) return `${group}<Object>`;
    if (group === 'Map' && ['copyOf', 'of'].includes(name)) return 'Map<Object,Object>';
    if (group === 'Arrays' && name === 'asList') return 'List<Object>';
  }
  if (name === 'toString') return 'String';
  if (group === 'String') {
    if (['substring', 'replace', 'trim', 'toLowerCase', 'toUpperCase'].includes(name)) return 'String';
    if (name === 'toCharArray') return 'char[]';
    if (name === 'split') return 'String[]';
    if (name === 'charAt') return 'char';
  }
  if (group === 'StringBuilder') {
    if (['append', 'delete', 'deleteCharAt', 'insert', 'reverse'].includes(name)) return 'StringBuilder';
    if (name === 'substring' || name === 'toString') return 'String';
    if (name === 'charAt') return 'char';
  }
  if (group === 'List' && name === 'get') return args[0];
  if (['Queue', 'Deque'].includes(group) && ['peek', 'poll', 'pop'].includes(name)) return args[0];
  if (group === 'Map') {
    if (['get', 'getOrDefault', 'put', 'putIfAbsent'].includes(name)) return args[1];
    if (name === 'keySet') return `Set<${args[0] ?? 'Object'}>`;
    if (name === 'values') return `Collection<${args[1] ?? 'Object'}>`;
  }
  if (['List', 'Set', 'Collection', 'Queue', 'Deque'].includes(group) && name === 'stream') return `Stream<${args[0] ?? 'Object'}>`;
  if (group === 'Stream') {
    if (['distinct', 'filter', 'limit', 'sorted'].includes(name)) return receiverType;
    if (name === 'map') return 'Stream<Object>';
    if (name === 'toList') return `List<${args[0] ?? 'Object'}>`;
  }
  if (name === 'clone') return receiverType;
  return undefined;
}

function inferExpressionType(expression: string, analysis: Analysis): string | undefined {
  const text = expression.trim().replace(/;$/, '').trim();
  if (!text) return undefined;
  if (/^"(?:[^"\\]|\\.)*"$/.test(text)) return 'String';
  if (/^'(?:[^'\\]|\\.)*'$/.test(text)) return 'char';
  if (/^(true|false)$/.test(text)) return 'boolean';
  if (/^-?\d+[lL]$/.test(text)) return 'long';
  if (/^-?\d+(?:\.\d+)?[fFdD]?$/.test(text)) return text.includes('.') ? 'double' : 'int';

  const arrayCreation = text.match(/^new\s+([A-Za-z_$][\w$]*)\s*\[/);
  if (arrayCreation) return `${arrayCreation[1]}[]`;
  const constructor = text.match(/^new\s+([A-Za-z_$][\w$]*(?:\s*<[^>]*>)?)/);
  if (constructor) return canonicalType(constructor[1]);
  if (text === 'this') return analysis.currentClass;
  if (text === 'System.out') return 'PrintStream';
  if ((COMMON_CLASSES as readonly string[]).includes(text)) return `static:${text}`;
  if (/^[A-Za-z_$][\w$]*$/.test(text)) return analysis.symbols.get(text)?.javaType;

  if (text.endsWith(']')) {
    const open = matchingOpen(text, text.length - 1, '[', ']');
    if (open > 0) {
      const ownerType = inferExpressionType(text.slice(0, open), analysis);
      if (ownerType?.endsWith('[]')) return ownerType.slice(0, -2);
    }
  }

  if (text.endsWith(')')) {
    const open = matchingOpen(text, text.length - 1, '(', ')');
    if (open > 0) {
      const callable = text.slice(0, open).trim();
      const dot = lastTopLevelDot(callable);
      if (dot >= 0) {
        const receiverType = inferExpressionType(callable.slice(0, dot), analysis);
        if (receiverType) {
          const name = callable.slice(dot + 1);
          return methodReturnType(receiverType, name) ?? analysis.classMethods.get(baseType(receiverType))?.get(name);
        }
      } else return analysis.symbols.get(callable)?.javaType;
    }
  }

  const dot = lastTopLevelDot(text);
  if (dot >= 0) {
    const ownerText = text.slice(0, dot);
    const field = text.slice(dot + 1).trim();
    if (ownerText === 'System' && field === 'out') return 'PrintStream';
    if (ownerText === 'this') return analysis.symbols.get(field)?.javaType;
    const ownerType = inferExpressionType(ownerText, analysis);
    if (ownerType) return analysis.classFields.get(baseType(ownerType))?.get(field);
  }
  return undefined;
}

function methodCompletion(node: SyntaxNode, source: string) {
  const definition = directChild(node, 'Definition');
  if (!definition) return null;
  const parameters = directChild(node, 'FormalParameters');
  const names: string[] = [];
  if (parameters) walk(parameters, (child) => {
    if (child.name === 'Definition') names.push(textOf(child, source));
  });
  const name = textOf(definition, source);
  const fields = names.map((value) => '${' + value + '}').join(', ');
  return method(name, `${name}(${fields})`, '当前类方法');
}

function classData(root: SyntaxNode, source: string) {
  const classMembers = new Map<string, Completion[]>();
  const classFields = new Map<string, Map<string, string>>();
  const classMethods = new Map<string, Map<string, string>>();
  walk(root, (node) => {
    if (node.name !== 'ClassDeclaration') return;
    const definition = directChild(node, 'Definition');
    const body = directChild(node, 'ClassBody');
    if (!definition || !body) return;
    const className = textOf(definition, source);
    const members: Completion[] = [];
    const fields = new Map<string, string>();
    const methods = new Map<string, string>();
    for (let child = body.firstChild; child; child = child.nextSibling) {
      if (child.name === 'FieldDeclaration') {
        const declared = typeNode(child);
        if (!declared) continue;
        for (let part = child.firstChild; part; part = part.nextSibling) {
          if (part.name !== 'VariableDeclarator') continue;
          const fieldDefinition = directChild(part, 'Definition');
          if (!fieldDefinition) continue;
          const name = textOf(fieldDefinition, source);
          const javaType = canonicalType(textOf(declared, source));
          fields.set(name, javaType);
          members.push({ label: name, type: 'property', detail: javaType });
        }
      } else if (child.name === 'MethodDeclaration') {
        const completion = methodCompletion(child, source);
        const methodDefinition = directChild(child, 'Definition');
        const returnType = typeNode(child);
        if (completion) members.push(completion);
        if (methodDefinition && returnType) methods.set(textOf(methodDefinition, source), canonicalType(textOf(returnType, source)));
      }
    }
    classMembers.set(className, [...members, ...objectMembers]);
    classFields.set(className, fields);
    classMethods.set(className, methods);
  });
  return { classMembers, classFields, classMethods };
}

function nearestScope(node: SyntaxNode) {
  for (let parent = node.parent; parent; parent = parent.parent) if (LEXICAL_SCOPES.has(parent.name)) return parent;
  return null;
}

function declaredType(definition: SyntaxNode, source: string, analysis: Analysis) {
  const parent = definition.parent;
  if (!parent) return undefined;
  const declaration = parent.name === 'VariableDeclarator' ? parent.parent : parent;
  if (!declaration) return undefined;
  const declared = typeNode(declaration);
  if (!declared) return undefined;
  const rawType = textOf(declared, source);
  if (rawType !== 'var') return canonicalType(rawType);
  const assign = directChild(parent, 'AssignOp');
  return assign ? inferExpressionType(source.slice(assign.to, parent.to), analysis) : undefined;
}

function analyze(context: CompletionContext): Analysis {
  const source = context.state.doc.toString();
  const tree = ensureSyntaxTree(context.state, context.state.doc.length, 50) ?? syntaxTree(context.state);
  const root = tree.topNode;
  const { classMembers, classFields, classMethods } = classData(root, source);
  const analysis: Analysis = { symbols: new Map(), classMembers, classFields, classMethods };
  let currentClassNode: SyntaxNode | null = null;

  for (let node: SyntaxNode | null = tree.resolveInner(context.pos, -1); node; node = node.parent) {
    if (node.name === 'ClassDeclaration') {
      const definition = directChild(node, 'Definition');
      if (definition) analysis.currentClass = textOf(definition, source);
      currentClassNode = node;
      break;
    }
  }

  walk(root, (node) => {
    if (node.name !== 'ClassDeclaration') return;
    const definition = directChild(node, 'Definition');
    if (definition) {
      const name = textOf(definition, source);
      analysis.symbols.set(name, { name, kind: 'class', javaType: name });
    }
  });

  if (analysis.currentClass && currentClassNode) {
    for (const [name, javaType] of classFields.get(analysis.currentClass) ?? []) analysis.symbols.set(name, { name, kind: 'variable', javaType });
    const body = directChild(currentClassNode, 'ClassBody');
    if (body) for (let child = body.firstChild; child; child = child.nextSibling) {
      if (child.name !== 'MethodDeclaration') continue;
      const definition = directChild(child, 'Definition');
      const returnType = typeNode(child);
      if (definition) {
        const name = textOf(definition, source);
        analysis.symbols.set(name, { name, kind: 'function', javaType: returnType ? canonicalType(textOf(returnType, source)) : undefined });
      }
    }
  }

  walk(root, (node) => {
    if (node.name !== 'Definition' || node.from > context.pos) return;
    const parent = node.parent;
    if (!parent || ['ClassDeclaration', 'MethodDeclaration', 'ConstructorDeclaration'].includes(parent.name)) return;
    if (parent.name === 'VariableDeclarator' && parent.parent?.name === 'FieldDeclaration') return;
    const scope = nearestScope(node);
    if (!scope || context.pos < scope.from || context.pos > scope.to) return;
    const name = textOf(node, source);
    analysis.symbols.set(name, { name, kind: 'variable', javaType: declaredType(node, source, analysis) });
  });
  return analysis;
}

function memberReceiver(beforeCursor: string, wordFrom: number, position: number) {
  let dot = (wordFrom < position ? wordFrom : position) - 1;
  while (dot >= 0 && /\s/.test(beforeCursor[dot])) dot -= 1;
  if (beforeCursor[dot] !== '.') return null;
  let round = 0;
  let square = 0;
  let index = dot - 1;
  for (; index >= 0; index -= 1) {
    const char = beforeCursor[index];
    if (char === ')') round += 1;
    else if (char === '(') round -= 1;
    else if (char === ']') square += 1;
    else if (char === '[') square -= 1;
    if (round === 0 && square === 0 && /[;{}=\n,:?]/.test(char)) break;
  }
  return beforeCursor.slice(index + 1, dot).trim();
}

function memberCandidates(javaType: string | undefined, analysis: Analysis) {
  if (!javaType) return [];
  if (javaType.startsWith('static:')) return staticMemberGroups[baseType(javaType)] ?? [];
  if (javaType.endsWith('[]')) return memberGroups.array;
  const group = baseType(javaType);
  if (PRIMITIVES.has(group)) return [];
  return memberGroups[group] ?? analysis.classMembers.get(group) ?? objectMembers;
}

export function javaCompletionSource(context: CompletionContext) {
  const beforeCursor = context.state.doc.sliceString(0, context.pos);
  const word = context.matchBefore(/[A-Za-z_$][\w$]*/);
  const receiver = memberReceiver(beforeCursor, word?.from ?? context.pos, context.pos);
  const analysis = analyze(context);

  if (receiver != null) {
    const receiverType = inferExpressionType(receiver, analysis);
    const options = memberCandidates(receiverType, analysis);
    if (!options.length) return null;
    return {
      from: word?.from ?? context.pos,
      options: [...new Map(options.map((option) => [option.label, option])).values()],
      validFor: /^[A-Za-z_$][\w$]*$|^$/,
    };
  }

  if (!word || (word.from === word.to && !context.explicit)) return null;
  const dynamicOptions: Completion[] = [...analysis.symbols.values()].map((symbol) => ({
    label: symbol.name,
    type: symbol.kind,
    detail: symbol.javaType || (symbol.kind === 'function' ? '当前代码方法' : symbol.kind === 'class' ? '当前代码类' : '当前作用域变量'),
    apply: symbol.kind === 'function' ? `${symbol.name}()` : symbol.name,
    boost: 50,
  }));
  const options = [...dynamicOptions, ...globalCompletions];
  return {
    from: word.from,
    options: [...new Map(options.map((option) => [`${option.label}:${option.type}`, option])).values()],
    validFor: /^[A-Za-z_$][\w$]*$/,
  };
}
