# UseSkill — AI Agent Skill Meta-Registry

> Global leading AI Agent skill aggregation protocol. Break skill silos and achieve **discover & integrate** for Agent capabilities.

[English](./README.md) | [中文](./README.zh-CN.md)

[![Python](https://img.shields.io/badge/Python-3.12+-blue)](https://www.python.org) [![FastAPI](https://img.shields.io/badge/FastAPI-0.111+-green)](https://fastapi.tiangolo.com) [![MySQL](https://img.shields.io/badge/MySQL-FTS-orange)](https://www.mysql.com) [![License](https://img.shields.io/badge/license-MIT-purple)]()

---

## Overview

**UseSkill** is a locally-deployable AI Agent skill meta-registry that:

- 🔍 **Aggregates multi-source data**: Automatically crawls and indexes **100,000+** Agent skills from ClawHub, Skills.sh, Smithery, MCP Market, GitHub, and more.
- ⚡ **Full-text search**: Millisecond-level full-text search via MySQL FULLTEXT, with fuzzy fallback.
- 📊 **Popularity ranking**: Real-time Top 20 most popular skills by downloads.
- 🌐 **i18n**: Web UI supports Chinese / English switching (with language preference persistence).
- 🔄 **Auto sync**: Background scheduled tasks (hourly) incrementally sync latest skill data from upstream sources.

---

## Screenshots

<p align="center">
  <img src="images/use-skill-01.png" alt="UseSkill Home" width="800">
</p>
<p align="center">
  <img src="images/use-skill-02.png" alt="UseSkill Skill Detail" width="800">
</p>

---

## Architecture

```
UseSkill
├── run.py                   # Unified entry (API + scheduled sync)
├── skill-cli.py             # CLI tool
├── static/index.html       # Web frontend (single file, i18n)
├── config.yaml             # Config (DB DSN, etc.)
├── src/
│   ├── api/main.py         # FastAPI routes
│   ├── core/schema.py      # Core models (SkillMetadata, etc.)
│   ├── registry/
│   │   ├── db.py           # DB ops (search / ranking / categories)
│   │   ├── engine.py       # Retrieval engine
│   │   ├── sync_manager.py # Sync logic (incremental/full)
│   │   └── sync_service.py # Scheduler
│   └── adapters/           # Platform adapters
│       ├── clawhub_adapter.py
│       ├── skills_sh_adapter.py
│       ├── smithery_adapter.py
│       ├── mcp_market_adapter.py
│       ├── github_adapter.py
│       └── awesome_claude_adapter.py
└── requirements.txt
```

---

## Quick Start

### 1. Install dependencies

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### 2. Configure database

Copy `config.example.yaml` to `config.yaml` and set `database.mysql_dsn`, or set env var `MYSQL_DSN`.

### 3. Start service

```bash
python3 run.py
```

Then:

- 🌐 **Web UI**: http://localhost:8000
- ⚙️ **API docs**: http://localhost:8000/docs
- 🔄 **Background sync**: Hourly incremental sync

---

## API Reference

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `GET` | `/api/v1/skills/search` | Search skills (pagination, category filter) |
| `GET` | `/api/v1/skills/top100` | Top 100 by popularity |
| `GET` | `/api/v1/skills/categories` | Categories and skill counts |
| `POST` | `/api/v1/skills/mount` | Mount/install skill to Agent context |

**Example:**

```bash
curl "http://localhost:8000/api/v1/skills/search?query=finance&limit=10&category=clawhub"
```

---

## CLI Usage

```bash
# Search skills
python3 skill-cli.py search "data"

# Search by source
python3 skill-cli.py search "finance" --limit 3

# Install skill
python3 skill-cli.py install "skill://github/langchain-ai/finance-tools@main"
```

---

## Data Sources

| Source | Description | Skills |
| :--- | :--- | :--- |
| 🦞 ClawHub | Claude community curated skills | ~24,000+ |
| 🚀 Skills.sh | Community automation skill aggregation | ~65,000+ |
| 🛠️ Smithery | MCP Server ecosystem | ~14,000+ |
| 🛒 MCP Market | Multi-source MCP tools | ~200+ |
| GitHub | Awesome Agent skill repos | ~2,700+ |

---

## Tech Stack

- **Backend**: Python 3.12 + FastAPI + Uvicorn
- **Database**: MySQL (FULLTEXT)
- **Frontend**: Vanilla HTML / CSS / JavaScript
- **Scheduler**: APScheduler
- **Data Models**: Pydantic v2

---

## Development

Mark `src` as **Sources Root** in your IDE, or:

```bash
export PYTHONPATH=$PYTHONPATH:$(pwd)/src
```

Manual full sync:

```python
from src.registry.sync_manager import SyncManager
import asyncio
asyncio.run(SyncManager().full_sync())
```

---

## License

MIT © 2026 UseSkill Community
