#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$SCRIPT_DIR"

if ! command -v docker >/dev/null 2>&1; then
  echo "未找到 Docker，请先安装并启动 Docker Desktop。" >&2
  exit 1
fi
if ! docker info >/dev/null 2>&1; then
  echo "Docker 尚未启动，请启动后重试。" >&2
  exit 1
fi
if [ ! -f .env ]; then
  cp .env.example .env
  echo "已从 .env.example 创建本机配置。"
fi

echo "正在构建并启动服务，首次运行需要下载镜像，请稍候……"
docker compose up -d --build

WEB_PORT=$(sed -n 's/^WEB_PORT=//p' .env | tail -n 1)
WEB_PORT=${WEB_PORT:-3000}
URL="http://localhost:$WEB_PORT"
attempt=1
while [ "$attempt" -le 60 ]; do
  if curl -fsS "$URL" >/dev/null 2>&1; then
    echo "启动成功：$URL"
    echo "以后启动：docker compose up -d；停止：docker compose down（不会删除数据）。"
    exit 0
  fi
  sleep 2
  attempt=$((attempt + 1))
done

docker compose ps
echo "服务未能在预期时间内就绪，请运行 docker compose logs 查看日志。" >&2
exit 1
