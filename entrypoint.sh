#!/bin/sh
# ==============================
# 环境变量配置与默认值
# ==============================
# Agent 自动注册所需的变量
KOMARI_SERVER="${KOMARI_SERVER:-}"
KOMARI_SECRET="${KOMARI_SECRET:-}"

# ==============================
# 1. 启动 komari-agent
# ==============================
if [ -n "$KOMARI_SERVER" ] && [ -n "$KOMARI_SECRET" ]; then
    echo "[Komari] 启动监控..."
    /app/komari-agent -e "$KOMARI_SERVER" -t "$KOMARI_SECRET" --disable-auto-update >/dev/null 2>&1 &
else
    echo "[Komari] 未配置，跳过。"
fi

# ==============================
# 2. 初始化目录与静态文件
# ==============================
echo "[Open WebUI] 初始化目录结构..."
mkdir -p /tmp/data /tmp/static

echo "[Open WebUI] 复制静态文件..."
cp -r /app/backend/open_webui/static/* /tmp/static/

# ==============================
# 3. 执行 CMD 传入的命令
# ==============================
echo "[Open WebUI] 启动应用..."
exec "$@"
