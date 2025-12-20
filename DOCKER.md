# MiSub Docker 部署指南

> 🐳 使用 Docker 部署 MiSub - 简单、快速、自主可控

## 🚀 快速开始

### 方式一: 使用预构建镜像 (推荐)

**1. 创建 docker-compose.yml**

```yaml
version: '3.8'

services:
  misub:
    image: ghcr.io/imzyb/misub:latest
    container_name: misub
    ports:
      - "3200:3200"
    volumes:
      - ./data:/app/.wrangler/state
    environment:
      - ADMIN_PASSWORD=your_password_here  # 修改为您的密码
    restart: unless-stopped
```

**2. 启动服务**

```bash
docker-compose up -d
```

**3. 访问应用**

打开浏览器访问: `http://localhost:3200`

---

### 方式二: 从源码构建

```bash
# 克隆项目
git clone https://github.com/imzyb/MiSub.git
cd MiSub

# 构建并启动
docker-compose up -d --build
```

---

## 📝 配置说明

### 环境变量

- `ADMIN_PASSWORD`: 管理员登录密码 (必需)

### 数据持久化

数据存储在 `./data` 目录,包含:
- KV 存储数据
- 订阅配置
- 节点信息

---

## 🔧 常用命令

```bash
# 查看日志
docker-compose logs -f

# 重启服务
docker-compose restart

# 停止服务
docker-compose down

# 更新镜像
docker-compose pull
docker-compose up -d

# 备份数据
cp -r ./data ./data-backup-$(date +%Y%m%d)
```

---

## 💡 技术说明

本 Docker 方案使用 **Wrangler Pages Dev** 模式运行:
- ✅ 零代码改动 - 直接使用 Cloudflare Pages 代码
- ✅ 完美兼容 - Wrangler 模拟 Cloudflare 环境
- ✅ 数据持久化 - KV 数据存储在本地文件
- ✅ 简单部署 - 只需一个 docker-compose.yml

---

## ⚠️ 注意事项

- 适合个人和小团队使用
- KV 存储使用本地文件模拟
- 单实例运行,不支持分布式
- 建议定期备份 `./data` 目录

---

## 🔗 相关资源

- GitHub 仓库: https://github.com/imzyb/MiSub
- Docker 镜像: ghcr.io/imzyb/misub:latest
- 问题反馈: https://github.com/imzyb/MiSub/issues
