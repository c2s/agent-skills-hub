# UseSkill 运行指南

## 1. 统一启动 (推荐)

现在可以使用一个脚本同时启动 API 服务和后台定时同步任务：

```bash
python3 run.py
```

启动后：
- Web 界面: [http://localhost:8000](http://localhost:8000)
- 后台同步: 自动启动，默认每 1 小时执行一次全量/增量同步。

---

## 2. 独立启动 (可选)

如果你需要分别控制，可以使用以下旧方式。

### 启动 Web 服务 (API + Frontend)
```bash
export PYTHONPATH=$PYTHONPATH:$(pwd)/src
python3 src/api/main.py
```

---

## 2. 使用 CLI 工具

同样需要设置 `PYTHONPATH`。

### 搜索技能:
```bash
export PYTHONPATH=$PYTHONPATH:$(pwd)/src
python3 skill-cli.py search "data"
```

### 安装/挂载技能:
```bash
export PYTHONPATH=$PYTHONPATH:$(pwd)/src
python3 skill-cli.py install "skill://github/langchain-ai/finance-tools@main"
```

---

## 3. 开发建议

建议在 IDE (如 VSCode) 中将 `src` 目录标记为 **Sources Root**，或在 `.env` 文件中设置：
```text
PYTHONPATH=./src
```
这样在终端运行或调试时会自动识别模块路径。
