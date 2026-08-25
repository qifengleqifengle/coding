import { readFile, writeFile } from 'node:fs/promises';

const seedUrl = new URL('../server/data/seed.json', import.meta.url);
const scannerTemplate = `import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        // 每个参数占一行；数组、矩阵等复合参数使用 JSON 外观。
        // 可用 nextInt()/next() 读取空白分隔数据，或 nextLine() 读取整行。
        // TODO: 解析输入并输出答案。
        scanner.close();
    }
}
`;

const seed = JSON.parse(await readFile(seedUrl, 'utf8'));
for (const list of Object.values(seed.lists)) {
  for (const problem of list) {
    problem.templates = { java: problem.templates.java };
    problem.acmTemplates = { java: scannerTemplate };
  }
}
await writeFile(seedUrl, `${JSON.stringify(seed, null, 2)}\n`, 'utf8');
console.log('seed.json 已精简为 Java 17，并切换为 Scanner ACM 模板。');
