# Railway 部署指南

本文介绍如何将 UseSkill 部署到 [Railway](https://railway.app/)。

## 前置条件

- GitHub 账号
- Railway 账号（可用 GitHub 登录）
- 已推送代码到 GitHub 仓库

## 部署步骤

### 1. 创建 Railway 项目

1. 登录 [Railway](https://railway.app/)
2. 点击 **New Project**
3. 选择 **Deploy from GitHub repo**
4. 选择你的仓库（如 `CurvatureLab/agent-skills-hub`）
5. Railway 会自动检测为 Python 项目并开始构建

### 2. 添加 MySQL 数据库

1. 在项目页面点击 **+ New**
2. 选择 **Database** → **Add MySQL**
3. Railway 会自动创建 MySQL 实例，并注入 `DATABASE_URL` 环境变量

### 3. 配置环境变量

在 Service 的 **Variables** 中，Railway 会自动注入：

- `DATABASE_URL`：MySQL 连接 URL（添加 MySQL 插件后自动生成）
- `PORT`：服务端口（Railway 自动设置）

如需使用自己的 MySQL，可设置：

- `MYSQL_DSN`：Go 风格 DSN，格式 `user:password@tcp(host:port)/dbname?charset=utf8mb4`
- 或 `DATABASE_URL`：`mysql://user:password@host:port/dbname`

### 4. 生成域名

1. 进入 Service → **Settings** → **Networking**
2. 点击 **Generate Domain** 生成公网访问地址

### 5. 首次同步数据（可选）

部署成功后，后台会每小时自动同步。如需立即同步，可：

- 在 Railway 的 **Deployments** 中查看日志，确认同步任务已启动
- 或本地执行一次全量同步后，依赖定时任务增量更新

## 注意事项

1. **Playwright**：SkillsMP 适配器依赖 Playwright，Railway 默认环境可能未安装浏览器。若同步报错，可暂时忽略 SkillsMP 源，其他源（ClawHub、Skills.sh 等）可正常同步。

2. **config.yaml**：Railway 部署时无需 `config.yaml`，数据库配置通过环境变量 `DATABASE_URL` 或 `MYSQL_DSN` 提供。

3. **静态资源**：`static/` 和 `images/` 会随代码一起部署，无需额外配置。

## 项目结构说明

- `Procfile`：定义启动命令 `web: python run.py`
- `runtime.txt`：指定 Python 3.12
- `run.py`：自动读取 `PORT` 环境变量，适配 Railway 动态端口
