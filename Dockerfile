FROM node:20-slim

WORKDIR /app

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 复制依赖文件
COPY package*.json ./

# 安装依赖
RUN npm ci

# 复制项目文件
COPY . .

# 构建前端
RUN npm run build

# 暴露端口
EXPOSE 3200

# 使用 Wrangler 运行
CMD ["npx", "wrangler", "pages", "dev", "dist", \
    "--port=3200", \
    "--persist-to=.wrangler/state", \
    "--compatibility-date=2025-12-20"]
