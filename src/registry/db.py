import os
import re
import pymysql
import pymysql.cursors
import json
import yaml
from pathlib import Path
from typing import List, Optional, Sequence, Union
from src.core.schema import SkillMetadata, SkillSource, SourceType, ExecutionMode, SkillMetrics


def _load_dotenv() -> None:
    """加载 .env 到环境变量"""
    try:
        from dotenv import load_dotenv
        load_dotenv()
    except ImportError:
        pass


def _load_config() -> dict:
    """从项目根目录加载 config.yaml"""
    root = Path(__file__).resolve().parent.parent.parent
    config_path = root / "config.yaml"
    if not config_path.exists():
        raise FileNotFoundError(
            f"配置文件不存在: {config_path}\n"
            "请复制 config.example.yaml 为 config.yaml 并填入数据库配置"
        )
    with open(config_path, "r", encoding="utf-8") as f:
        return yaml.safe_load(f) or {}


def _get_mysql_dsn() -> str:
    """获取 MySQL DSN：优先从环境变量 MYSQL_DSN 获取，没有则从 config.yaml 读取"""
    _load_dotenv()
    dsn = os.environ.get("MYSQL_DSN")
    if dsn:
        return dsn
    config = _load_config()
    db_config = config.get("database", {})
    dsn = db_config.get("mysql_dsn")
    if not dsn:
        raise ValueError(
            "未找到数据库配置。请在 config.yaml 的 database.mysql_dsn 中配置，"
            "或设置环境变量 MYSQL_DSN"
        )
    return dsn


def _parse_mysql_url(url: str) -> dict:
    """解析 mysql:// 或 mysql+pymysql:// 格式的 URL（Railway 等平台常用）"""
    from urllib.parse import urlparse, unquote
    parsed = urlparse(url)
    if parsed.scheme and "mysql" not in parsed.scheme.lower():
        raise ValueError(f"不支持的数据库 URL 格式: {url}")
    return {
        "host": parsed.hostname or "localhost",
        "port": parsed.port or 3306,
        "user": unquote(parsed.username) if parsed.username else "root",
        "password": unquote(parsed.password) if parsed.password else "",
        "database": (parsed.path or "/").lstrip("/").split("?")[0] or "mysql",
        "charset": "utf8mb4",
        "cursorclass": pymysql.cursors.DictCursor,
        "autocommit": False,
        "connect_timeout": 30,
        "read_timeout": 60,
        "write_timeout": 60,
    }


def _parse_dsn(dsn: str) -> dict:
    """将 Go 风格的 MySQL DSN 解析为 pymysql 连接参数"""
    # 格式: user:password@tcp(host:port)/dbname?params
    m = re.match(r"^(.+?):(.+?)@tcp\((.+?):(\d+)\)/(.+?)(\?.*)?$", dsn)
    if not m:
        raise ValueError(f"无法解析 DSN: {dsn}")
    return {
        "host": m.group(3),
        "port": int(m.group(4)),
        "user": m.group(1),
        "password": m.group(2),
        "database": m.group(5),
        "charset": "utf8mb4",
        "cursorclass": pymysql.cursors.DictCursor,
        "autocommit": False,
        "connect_timeout": 30,
        "read_timeout": 60,
        "write_timeout": 60,
    }

def _get_conn_params() -> dict:
    """获取连接参数（延迟加载，支持配置热更新）"""
    _load_dotenv()
    # Railway 等平台使用 DATABASE_URL 或 MYSQL_URL
    url = os.environ.get("DATABASE_URL") or os.environ.get("MYSQL_URL")
    if url and ("mysql://" in url or "mysql+pymysql://" in url):
        return _parse_mysql_url(url)
    return _parse_dsn(_get_mysql_dsn())


def _get_conn() -> pymysql.connections.Connection:
    """创建并返回一个新的 MySQL 连接，带重试机制"""
    import time
    params = {k: v for k, v in _get_conn_params().items()}
    max_retries = 3
    for attempt in range(max_retries):
        try:
            return pymysql.connect(**params)
        except pymysql.err.OperationalError as e:
            if attempt < max_retries - 1:
                print(f"Database connection failed, retrying ({attempt+1}/{max_retries})...")
                time.sleep(1)
            else:
                raise e


class DBManager:
    def __init__(self):
        self._init_db()

    def _init_db(self):
        with _get_conn() as conn:
            with conn.cursor() as cursor:
                # 基础信息表
                cursor.execute("""
                    CREATE TABLE IF NOT EXISTS `skills` (
                        `skill_id`           VARCHAR(255)  NOT NULL COMMENT '技能唯一标识',
                        `name`               VARCHAR(512)  DEFAULT NULL COMMENT '技能名称',
                        `author`             VARCHAR(255)  DEFAULT NULL COMMENT '作者',
                        `description`        TEXT          DEFAULT NULL COMMENT '技能描述',
                        `source_type`        VARCHAR(64)   DEFAULT NULL COMMENT '来源类型',
                        `source_url`         VARCHAR(2048) DEFAULT NULL COMMENT '来源URL',
                        `install_uri`        VARCHAR(2048) DEFAULT NULL COMMENT '安装URI',
                        `execution_mode`     VARCHAR(64)   DEFAULT NULL COMMENT '执行模式',
                        `stars`              INT           DEFAULT 0    COMMENT '星标数',
                        `downloads`          INT           DEFAULT 0    COMMENT '下载数',
                        `required_envs`      TEXT          DEFAULT NULL COMMENT '必需环境变量(JSON)',
                        `agent_tools_schema` MEDIUMTEXT    DEFAULT NULL COMMENT 'Agent工具Schema(JSON)',
                        `last_updated`       DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        `remote_updated_at`  BIGINT        DEFAULT NULL COMMENT '远端更新时间戳',
                        PRIMARY KEY (`skill_id`),
                        INDEX `idx_source_type` (`source_type`),
                        INDEX `idx_stars`       (`stars`),
                        INDEX `idx_downloads`   (`downloads`),
                        INDEX `idx_author`      (`author`(64)),
                        FULLTEXT INDEX `ft_name_desc` (`name`, `description`)
                    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
                """)
            conn.commit()

    def save_skill(self, skill: SkillMetadata):
        with _get_conn() as conn:
            with conn.cursor() as cursor:
                cursor.execute("""
                    INSERT INTO `skills`
                        (skill_id, name, author, description, source_type, source_url,
                         install_uri, execution_mode, stars, downloads,
                         required_envs, agent_tools_schema, remote_updated_at)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    ON DUPLICATE KEY UPDATE
                        name               = VALUES(name),
                        author             = VALUES(author),
                        description        = VALUES(description),
                        source_type        = VALUES(source_type),
                        source_url         = VALUES(source_url),
                        install_uri        = VALUES(install_uri),
                        execution_mode     = VALUES(execution_mode),
                        stars              = VALUES(stars),
                        downloads          = VALUES(downloads),
                        required_envs      = VALUES(required_envs),
                        agent_tools_schema = VALUES(agent_tools_schema),
                        remote_updated_at  = VALUES(remote_updated_at),
                        last_updated       = CURRENT_TIMESTAMP
                """, (
                    skill.skill_id, skill.name, skill.author, skill.description,
                    skill.source.type.value, skill.source.url, skill.install_uri,
                    skill.execution_mode.value, skill.metrics.stars, skill.metrics.downloads,
                    json.dumps(skill.required_envs),
                    json.dumps([t.model_dump() for t in skill.agent_tools_schema]),
                    getattr(skill, 'remote_updated_at', 0)
                ))
            conn.commit()

    @staticmethod
    def _normalize_search_terms(queries: Sequence[str]) -> List[str]:
        """Flatten comma-separated tokens and strip empties."""
        out: List[str] = []
        for q in queries:
            if q is None:
                continue
            for part in str(q).split(","):
                p = part.strip()
                if p:
                    out.append(p)
        return out

    @staticmethod
    def _fts_boolean_prefix_string(terms: List[str]) -> Optional[str]:
        """Build a single BOOLEAN MODE string: term1* term2* … (optional OR-style match)."""
        parts: List[str] = []
        for t in terms:
            safe = re.sub(r'[+\-><()~*:"\']', "", t)
            if not safe:
                continue
            parts.append(f"{safe}*")
        return " ".join(parts) if parts else None

    @staticmethod
    def _like_or_where_multi(terms: List[str]) -> tuple[str, List]:
        """(name LIKE … OR description LIKE …) OR … across terms."""
        or_chunks: List[str] = []
        params: List = []
        for t in terms:
            pat = f"%{t}%"
            or_chunks.append("(name LIKE %s OR description LIKE %s)")
            params.extend([pat, pat])
        return "(" + " OR ".join(or_chunks) + ")", params

    def search_skills(
        self,
        query: Union[str, Sequence[str]],
        limit: int = 20,
        offset: int = 0,
        source_type: Optional[str] = None,
    ) -> tuple[List[SkillMetadata], int]:
        if isinstance(query, str):
            raw: List[str] = [query] if query.strip() else []
        else:
            raw = list(query)
        terms = self._normalize_search_terms(raw)
        if not terms:
            return self.get_top_skills(limit, offset, source_type)

        query_fts = self._fts_boolean_prefix_string(terms)
        if not query_fts:
            return self.get_top_skills(limit, offset, source_type)

        with _get_conn() as conn:
            with conn.cursor() as cursor:
                # 优先使用 MySQL FULLTEXT MATCH AGAINST
                fts_cond = "MATCH(name, description) AGAINST (%s IN BOOLEAN MODE)"
                search_params_count: List = [query_fts]
                search_params: List = [query_fts]

                source_cond = ""
                if source_type:
                    source_cond = " AND source_type = %s"
                    search_params_count.append(source_type)
                    search_params.append(source_type)

                cursor.execute(
                    f"SELECT COUNT(*) as cnt FROM `skills` WHERE {fts_cond}{source_cond}",
                    search_params_count,
                )
                row = cursor.fetchone()
                total = row["cnt"] if row else 0

                search_params.extend([limit, offset])
                cursor.execute(
                    f"""SELECT * FROM `skills`
                        WHERE {fts_cond}{source_cond}
                        ORDER BY downloads DESC
                        LIMIT %s OFFSET %s""",
                    search_params,
                )
                rows = cursor.fetchall()

                # 兜底：LIKE 模糊匹配（多词 OR）
                if len(rows) < 5:
                    like_cond, like_base_params = self._like_or_where_multi(terms)
                    like_params_count = list(like_base_params)
                    like_params = list(like_base_params)
                    if source_type:
                        like_cond += " AND source_type = %s"
                        like_params_count.append(source_type)
                        like_params.append(source_type)

                    cursor.execute(
                        f"SELECT COUNT(*) as cnt FROM `skills` WHERE {like_cond}",
                        like_params_count,
                    )
                    row = cursor.fetchone()
                    total = row["cnt"] if row else 0

                    like_params.extend([limit, offset])
                    cursor.execute(
                        f"""SELECT * FROM `skills`
                            WHERE {like_cond}
                            ORDER BY downloads DESC
                            LIMIT %s OFFSET %s""",
                        like_params,
                    )
                    rows = cursor.fetchall()

                return [self._row_to_skill(row) for row in rows], total

    def get_category_counts_for_terms(self, query: Union[str, Sequence[str]]) -> dict[str, int]:
        """
        与 search_skills 相同的 FTS / LIKE 判定下，按 source_type 聚合条数（用于筛选后的分类 Tab 数字）。
        """
        if isinstance(query, str):
            raw: List[str] = [query] if query.strip() else []
        else:
            raw = list(query)
        terms = self._normalize_search_terms(raw)
        if not terms:
            return self.get_category_counts()

        query_fts = self._fts_boolean_prefix_string(terms)
        if not query_fts:
            return self.get_category_counts()

        with _get_conn() as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT COUNT(*) as cnt FROM `skills` WHERE MATCH(name, description) AGAINST (%s IN BOOLEAN MODE)",
                    (query_fts,),
                )
                ft_total = (cursor.fetchone() or {}).get("cnt") or 0
                use_like = ft_total < 5
                if use_like:
                    like_cond, like_params = self._like_or_where_multi(terms)
                    cursor.execute(
                        f"SELECT source_type, COUNT(*) as cnt FROM `skills` WHERE {like_cond} GROUP BY source_type",
                        like_params,
                    )
                else:
                    cursor.execute(
                        "SELECT source_type, COUNT(*) as cnt FROM `skills` WHERE MATCH(name, description) AGAINST (%s IN BOOLEAN MODE) GROUP BY source_type",
                        (query_fts,),
                    )
                rows = cursor.fetchall()

        counts = {row["source_type"]: row["cnt"] for row in rows}
        for cat in ["clawhub", "github", "skills.sh", "smithery", "mcp-market", "awesome-list", "skillsmp"]:
            if cat not in counts:
                counts[cat] = 0
        counts["all"] = sum(v for k, v in counts.items() if k != "all")
        return counts

    def get_top_skills(self, limit: int = 20, offset: int = 0, source_type: Optional[str] = None) -> tuple[List[SkillMetadata], int]:
        with _get_conn() as conn:
            with conn.cursor() as cursor:
                if source_type:
                    cursor.execute("SELECT COUNT(*) as cnt FROM `skills` WHERE source_type = %s", (source_type,))
                else:
                    cursor.execute("SELECT COUNT(*) as cnt FROM `skills`")
                total = cursor.fetchone()["cnt"]

                if source_type:
                    cursor.execute(
                        "SELECT * FROM `skills` WHERE source_type = %s ORDER BY downloads DESC LIMIT %s OFFSET %s",
                        (source_type, limit, offset)
                    )
                else:
                    cursor.execute(
                        "SELECT * FROM `skills` ORDER BY downloads DESC LIMIT %s OFFSET %s",
                        (limit, offset)
                    )
                return [self._row_to_skill(row) for row in cursor.fetchall()], total

    def get_category_counts(self) -> dict[str, int]:
        """获取各分类下的技能数量"""
        with _get_conn() as conn:
            with conn.cursor() as cursor:
                cursor.execute("SELECT source_type, COUNT(*) as cnt FROM `skills` GROUP BY source_type")
                rows = cursor.fetchall()
                counts = {row["source_type"]: row["cnt"] for row in rows}
                for cat in ["clawhub", "github", "skills.sh", "smithery", "mcp-market", "awesome-list", "skillsmp"]:
                    if cat not in counts:
                        counts[cat] = 0
                counts["all"] = sum(v for k, v in counts.items() if k != "all")
                return counts

    def get_all_categories(self) -> List[str]:
        return ["all", "clawhub", "github", "skills.sh", "smithery", "mcp-market", "awesome-list", "skillsmp"]

    def get_last_remote_updated(self, source_type: str) -> int:
        """获取特定源最后同步到的远程时间戳（用于增量同步）"""
        with _get_conn() as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT MAX(remote_updated_at) as max_ts FROM `skills` WHERE source_type = %s",
                    (source_type,)
                )
                row = cursor.fetchone()
                return row["max_ts"] if row and row["max_ts"] else 0

    def _row_to_skill(self, row: dict) -> SkillMetadata:
        skill = SkillMetadata(
            skill_id=row["skill_id"],
            name=row["name"],
            author=row["author"],
            description=row["description"] or "",
            source=SkillSource(type=SourceType(row["source_type"]), url=row["source_url"]),
            install_uri=row["install_uri"],
            execution_mode=ExecutionMode(row["execution_mode"]),
            metrics=SkillMetrics(stars=row["stars"] or 0, downloads=row["downloads"] or 0),
            required_envs=json.loads(row["required_envs"]) if row["required_envs"] else [],
            agent_tools_schema=json.loads(row["agent_tools_schema"]) if row["agent_tools_schema"] else [],
            remote_updated_at=row["remote_updated_at"] or 0
        )
        return skill
