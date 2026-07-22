# ==========================================
# 基于 open-webui:main-slim
# ==========================================
FROM ghcr.io/open-webui/open-webui:latest-slim

# --- 修复安全漏洞 ---
# 切换为 root 用户以升级系统/Python 依赖
USER root
# 对系统层做全量安全升级，修复 libgnutls30 等 Debian 包漏洞。
# 这样系统库每次重建都会自动吃到最新补丁，不必再为每个新报的 CVE
# 单独点名升级（配合定期重建效果最佳）。
RUN apt-get update && \
    apt-get -y upgrade && \
    rm -rf /var/lib/apt/lists/*
# 升级 nltk 以修复 CVE-2025-14009 (Zip Slip 漏洞)
RUN pip install --no-cache-dir --upgrade "nltk>=3.9.3"

COPY --from=ghcr.io/komari-monitor/komari-agent:latest /app/komari-agent /app/komari-agent
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

# --- 1. 核心路径配置 (指向 /tmp) ---
ENV DATA_DIR=/tmp/data
ENV HOME=/tmp
ENV STATIC_DIR=/tmp/static
# 覆盖模型缓存路径
ENV HF_HOME=/tmp/data/cache/embedding/models
ENV SENTENCE_TRANSFORMERS_HOME=/tmp/data/cache/embedding/models
ENV TIKTOKEN_CACHE_DIR=/tmp/data/cache/tiktoken
ENV WHISPER_MODEL_DIR=/tmp/data/cache/whisper/models

# --- 2. Choreo Web App 不支持 WebSocket ---
ENV ENABLE_WEBSOCKET_SUPPORT=false

# --- 3. 关闭 Ollama API ---
ENV ENABLE_OLLAMA_API=false

# --- 4. 切换用户 ---
# 依赖安装完成后，再切换回低权限用户以保证运行安全
USER 10014

EXPOSE 8080

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["bash", "start.sh"]
