# ==========================================
# 阶段 1: 构建阶段 (Builder)
# ==========================================
FROM golang:alpine AS builder

WORKDIR /src

# 安装 git
RUN apk add --no-cache git

# 1. 拉取源码
RUN git clone https://github.com/komari-monitor/komari-agent.git .

# 2. 检出最新的 Tag
RUN git fetch --tags && \
    LATEST_TAG=$(git describe --tags --abbrev=0) && \
    git checkout $LATEST_TAG

# 3. 编译并注入版本号
RUN VERSION=$(git describe --tags --always) && \
    echo "--------------------------------------" && \
    echo "正在构建版本: $VERSION" && \
    echo "--------------------------------------" && \
    go mod download && \
    CGO_ENABLED=0 go build \
    -trimpath \
    -ldflags="-s -w -X github.com/komari-monitor/komari-agent/update.CurrentVersion=${VERSION}" \
    -o komari-agent .

# ==========================================
# 第二阶段：运行环境 (Final Image)
# 基于 open-webui:main-slim
# ==========================================
FROM ghcr.io/open-webui/open-webui:latest-slim

# --- 修复安全漏洞 ---
# 切换为 root 用户以升级系统/Python 依赖
USER root
# 升级 Debian 安全修复包，避免 Choreo Trivy 扫描命中旧版 OpenSSL/kernel headers
RUN apt-get update && \
    apt-get install -y --no-install-recommends --only-upgrade \
        openssl \
        libssl3 \
        libssl-dev \
        linux-libc-dev && \
    rm -rf /var/lib/apt/lists/*
# 升级 nltk 以修复 CVE-2025-14009 (Zip Slip 漏洞)
RUN pip install --no-cache-dir --upgrade "nltk>=3.9.3"

COPY --from=builder /src/komari-agent /app/komari-agent
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
