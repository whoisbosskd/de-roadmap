# Module 03-04 — SQL & Data Modeling

> SQL is the #1 tested skill in DE interviews. Modeling is the #2 — and the one most self-taught engineers skip. Don't.

**Status:** ⬜ Not Started
**Build deliverable:** Mini warehouse — star schema + 10 analytical queries on BigQuery + Azure SQL

---

## Module 3 — Advanced SQL

### Window Functions (Day 1-2)
- [ ] `ROW_NUMBER`, `RANK`, `DENSE_RANK` — understand tie behavior for each
- [ ] `LAG`, `LEAD` with offset and default; compute day-over-day change
- [ ] Framing clauses: `ROWS` vs `RANGE`, `UNBOUNDED PRECEDING`, current row
- [ ] `FIRST_VALUE`, `LAST_VALUE`, `NTH_VALUE` — when framing matters
- [ ] `NTILE` for percentile bucketing
- [ ] `QUALIFY` clause (BigQuery / Snowflake / Databricks)

### CTEs and Recursion (Day 3)
- [ ] Non-recursive CTEs for readability; when CTEs hurt performance
- [ ] Recursive CTE: generate a date series; traverse org hierarchy
- [ ] Lateral joins (`CROSS APPLY` in SQL Server, `LATERAL` in Postgres/BQ)

### Joins Deep Dive (Day 4)
- [ ] Anti-joins (`NOT EXISTS` / `LEFT JOIN IS NULL`) and why `NOT IN` is dangerous with NULLs
- [ ] Semi-joins (`EXISTS`) and their optimizer benefits
- [ ] Self-joins for comparing rows in the same table
- [ ] Nested-loop vs hash vs sort-merge joins: when each is chosen, how to read an EXPLAIN plan

### Performance (Day 5)
- [ ] Read execution plans in BigQuery (query plan stages) and Azure SQL (SSMS plans)
- [ ] Partitioning strategies (date-partitioned fact tables); partition pruning verification
- [ ] Clustering in BigQuery; Z-ordering in Delta; indexes in OLTP
- [ ] Materialized views: refresh strategies, when to use

### Daily Practice (throughout)
- [ ] StrataScratch: at least 25 Hard problems this module
- [ ] DataLemur: complete the Window Functions track

---

## Module 4 — Data Modeling + Build

### Dimensional Modeling (Day 1-2)
- [ ] Read chapters 1-3 of Kimball's "Data Warehouse Toolkit" (or equivalent summary)
- [ ] Fact tables: grain, additive / semi-additive / non-additive measures, factless facts
- [ ] Dimension tables: conformed dimensions, junk dimensions, role-playing dimensions
- [ ] SCDs: Type 1 (overwrite), Type 2 (history row), Type 3 (prev column), Type 6 (hybrid)
- [ ] Star vs snowflake — why star wins in columnar warehouses

### Modern Modeling (Day 3)
- [ ] Data Vault 2.0: hubs, links, satellites — one-page summary is enough
- [ ] One Big Table (OBT) vs normalized; why BigQuery/Snowflake denormalize
- [ ] Medallion architecture (bronze / silver / gold) — what lives where

### Loading Patterns (Day 4)
- [ ] Idempotent incremental loads with `MERGE` / `UPSERT`
- [ ] Late-arriving facts and late-arriving dimensions — handling strategies
- [ ] CDC basics: log-based (Debezium) vs query-based (last-modified column)
- [ ] Backfills without duplicates: deterministic keys, watermarks, replay-safety

### BUILD: Mini Warehouse (Day 5-6)
- [ ] Design star schema for fictional e-commerce: orders, customers, products, returns, promotions
- [ ] Draw ERD (dbdiagram.io or drawio) — commit PNG to repo
- [ ] Generate synthetic data (Faker, ~1M order rows)
- [ ] Load into BigQuery (partitioned + clustered) AND Azure SQL
- [ ] Implement SCD Type 2 on customers dimension
- [ ] Write 10 analytical queries: cohort retention, funnel, LTV, top-N with ties, MoM growth
- [ ] Document query performance: before/after partition pruning, with EXPLAIN snippets

---

## Notes
Drop concept notes in `notes/`. Suggested files:
- `window_functions_deep.sql`
- `cte_vs_subquery.md`
- `dimensional_modeling_cheatsheet.md`
- `scd_patterns.sql`

## Build Output
Put ERD PNGs, synthetic data scripts, and queries in `builds/`.
