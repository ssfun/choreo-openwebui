# 1. 改用 main 镜像（包含嵌入模型，启动更快，不用现场下载）
FROM ghcr.io/open-webui/open-webui:main

# 2. 设置 Choreo 要求的用户 ID
ARG CHOREO_UID=10014
ARG CHOREO_GID=10014

# 3. 关键：重置 HOME 环境变量
# Open WebUI 默认会尝试往 /root 写东西，必须改到我们有权限的目录下
ENV HOME=/app/backend/data

# 4. 关键：修正文件权限
# 切换回 root 执行权限变更
USER root

# 确保数据目录存在，并把所有权给 Choreo 用户
# /app/backend/data 是存放数据库(webui.db)和缓存的关键目录
RUN mkdir -p /app/backend/data && \
    chown -R $CHOREO_UID:$CHOREO_GID /app/backend/data && \
    chmod -R 775 /app/backend/data

# 5. 切换到 Choreo 的非 root 用户
USER $CHOREO_UID
