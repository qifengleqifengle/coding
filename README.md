# Algo Arena

本地 Java 算法练习站。题库、数据库和代码 Runner 都在本机运行，启动后不需要再访问 CodeTop 或 LeetCode API。

- CodeTop 默认频度榜前五页：100 条；
- LeetCode Hot 100：100 条；
- 两个榜单分别保留，交集 67 题；
- 只支持 Java 17，自由练习模式，从 `public class Main` 开始写；
- 在 `main` 中写死用例，`System.out` / `System.err` 会直接显示在运行结果中；
- PostgreSQL 持久化完成状态、收藏和运行记录；
- Runner 容器限制了执行时间、内存、进程数和输出大小。

## 换电脑一键安装

新电脑只需要先安装：

1. [Git](https://git-scm.com/downloads)
2. [Docker Desktop](https://www.docker.com/products/docker-desktop/)，并确保已经启动

Windows：

```powershell
git clone https://github.com/qifengleqifengle/coding.git
cd coding
.\setup.bat
```

也可以直接双击 `setup.bat`。macOS / Linux：

```bash
git clone https://github.com/qifengleqifengle/coding.git
cd coding
chmod +x setup.sh
./setup.sh
```

脚本会自动创建 `.env`、构建全部镜像、初始化数据库并启动服务。首次构建需要下载 Node、Java 和 PostgreSQL 镜像，之后会快很多。

默认地址：

- 页面：http://localhost:3000
- API：http://localhost:8080
- PostgreSQL：localhost:5433

如端口冲突，先修改本机 `.env`。若修改 `API_PORT`，需同时修改 `NEXT_PUBLIC_API_URL`，然后重新执行 setup。

## 日常命令

```bash
# 启动已有容器
docker compose up -d

# 修改代码后重新构建
docker compose up -d --build

# 查看状态和日志
docker compose ps
docker compose logs -f

# 停止服务，保留题库与练习记录
docker compose down
```

不要随意执行 `docker compose down -v`：`-v` 会删除数据库卷，完成状态和提交记录也会一起清空。清空后再次启动，会从 SQL 重新初始化题库。

## 数据库和备份

全量静态题库位于：

- `db/init/001-schema.sql`：表结构；
- `db/init/002-problems.sql`：200 条题目数据。

PostgreSQL 只会在数据卷第一次创建时自动执行这两个文件。修改初始化 SQL 不会覆盖已有数据库。

Windows 备份全部练习数据：

```powershell
.\scripts\backup.ps1
```

备份默认写入 `backups`（已被 Git 忽略）。恢复时：

```powershell
.\scripts\restore.ps1 -BackupPath .\backups\algo-arena-20260825-220000.dump
```

恢复操作会要求输入 `RESTORE` 确认，并覆盖当前练习进度与运行记录。

## 更新题库快照

仓库运行完全依赖 SQL，不会在页面打开或 API 启动时联网拉题。维护者需要更新榜单时，先生成离线快照，再导出 SQL：

```bash
npm run seed
npm run export:sql
```

同步脚本只读取公开页面和公开 GraphQL 数据，不处理登录、验证码或付费内容。更新 SQL 后，已有数据库需要通过迁移或重新创建数据卷才能应用。
