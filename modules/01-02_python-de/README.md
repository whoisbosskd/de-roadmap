# Module 01-02 — Python for Data Engineering

> You already write Python. This module is about moving from scripting-grade to production-grade: performance, testing, and data-library fluency.

**Status:** 🟡 In Progress
**Build deliverable:** API ingestion tool with tests → GitHub

---

## Module 1 — Core Python Depth + Data Libraries

### Core Language (Day 1-2)
- [x] Generators and iterators: `yield`, generator expressions, memory vs list comprehension tradeoffs
- [ ] Decorators: `functools.wraps`, parameterized decorators, stacking, real-world use (retry, timing)
- [ ] Context managers: `__enter__`/`__exit__`, `contextlib.contextmanager`, nested resources
- [ ] Typing: `Optional`, `Union`, `Literal`, `TypedDict`, `Protocol`; run mypy against your own old code
- [ ] `dataclasses` vs `pydantic v2`: when to use each for data records
- [ ] Async basics: `asyncio`, `aiohttp` for parallel API calls; write one script that does 100 parallel GET requests

### Pandas Advanced (Day 3)
- [ ] `groupby` mechanics: split-apply-combine, `agg` with multiple functions, `transform` vs `apply` vs `aggregate`
- [ ] Memory optimization: category dtype, downcasting ints, `chunksize` on `read_csv` for >1GB files
- [ ] MultiIndex: creation, slicing (`loc` with tuples), `stack`/`unstack`, `swaplevel`
- [ ] Merge/join internals: `indicator=True` to debug joins; `validate='one_to_many'` safety checks

### Polars (Day 4)
- [ ] Install Polars; rewrite one existing Pandas script in Polars (expressions API, lazy frames)
- [ ] Understand why Polars is faster: Arrow backing, query optimizer, parallelism
- [ ] Read/write Parquet in Polars; `scan_parquet()` predicate pushdown demo

### File Formats & Serialization (Day 5)
- [ ] Parquet: row groups, column pruning, predicate pushdown, Snappy vs ZSTD vs GZIP
- [ ] Avro vs Parquet vs ORC: when each is correct (messaging vs analytics vs Hive)
- [ ] JSON Lines (NDJSON) and why it's the standard for streaming ingestion
- [ ] PyArrow: read/write Parquet, convert between Pandas/Polars/Arrow
- [ ] Schema evolution: what breaks when a column is added/renamed/typed-changed

### Retro + SQL Daily (Day 6)
- [ ] Solve 7 StrataScratch Easy + 3 Medium SQL problems
- [ ] Write weekly retro in `progress/log.md`

---

## Module 2 — Production Patterns + Build

### Testing & Quality (Day 1-2)
- [ ] pytest fundamentals: fixtures, parametrize, `conftest.py`, markers
- [ ] Mocking: `pytest-mock` / `unittest.mock`, patching HTTP calls with `responses` or `httpx` MockTransport
- [ ] Data-quality libraries: Great Expectations OR Soda Core — install, add 5 expectations on a sample dataset
- [ ] Logging properly: structured logs with `structlog` or Python's `logging` + JSON formatter

### Packaging & Tooling (Day 3)
- [ ] `pyproject.toml`, `poetry` OR `uv` for dependency management
- [ ] pre-commit hooks: `ruff`, `black`, `mypy`
- [ ] Dockerfile for a Python data script (multi-stage build, non-root user, slim base)

### BUILD: Python API Ingestion Tool (Day 4-6)
- [ ] Pick a public API (GitHub, OpenWeather, CoinGecko, NYC Open Data)
- [ ] Fetch paginated data with retries (`tenacity`) and rate-limit handling
- [ ] Validate response records with Pydantic models
- [ ] Write partitioned Parquet (partitioned by date) to local disk AND cloud (GCS or ADLS)
- [ ] Add pytest suite covering: happy path, 429 rate limit, schema failure, empty response
- [ ] Add a Great Expectations suite with 5+ checks (row count, null %, value ranges)
- [ ] Write a README with: architecture diagram, how to run, tradeoffs, known limitations
- [ ] Push to GitHub with a clean commit history (pin this repo on your profile)

---

## Notes
Drop concept notes in `notes/`. Suggested files:
- `generators_decorators.md`
- `pandas_memory_tricks.md`
- `file_formats_cheatsheet.md`
- `testing_patterns.md`

## Build Output
Put code and notebooks in `builds/`.
