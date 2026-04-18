# Module 05-06 — PySpark & Delta Lake

> Your resume currently says PySpark "learning". After this module it should say "production-grade" — and you should have a project that proves it.

**Status:** ⬜ Not Started
**Build deliverable:** NYC Taxi end-to-end — batch + streaming pipeline, performance writeup

---

## Module 5 — Spark Fundamentals

### Architecture (Day 1)
- [ ] Driver / executor / cluster manager roles
- [ ] RDD → DataFrame → Dataset lineage
- [ ] Lazy evaluation: transformations vs actions; why `collect()` is dangerous
- [ ] Catalyst optimizer: logical plan → optimized logical plan → physical plan
- [ ] Tungsten: off-heap memory, whole-stage codegen
- [ ] Adaptive Query Execution (AQE): coalesce partitions, skew join, dynamic join strategy

### DataFrame API (Day 2-3)
- [ ] Reading data: Parquet, Delta, JSON, CSV; `inferSchema` pitfalls; schema-on-read
- [ ] Column operations: `withColumn`, `select`, `drop`, `cast`, `when`/`otherwise`
- [ ] Aggregations: `groupBy`, `agg`, `pivot`, `rollup`, `cube`
- [ ] Window functions in PySpark (`Window.partitionBy` / `orderBy` / `rowsBetween`)
- [ ] UDFs: Python UDF vs Pandas UDF vs native Spark — performance gap
- [ ] Handling nulls: `na.fill`, `na.drop`, `coalesce`

### Joins in Spark (Day 4)
- [ ] Broadcast join: hint, threshold (10MB default), when to use
- [ ] Sort-merge join: when it's picked, shuffle cost
- [ ] Shuffle hash join: rarer, when it wins
- [ ] Skewed joins: salting technique (add random key suffix)
- [ ] Bucketing pre-shuffled data to avoid re-shuffling in joins

### Databricks Community Edition Setup (Day 5)
- [ ] Sign up for Databricks Community Edition (free)
- [ ] Upload NYC Taxi dataset OR GitHub Archive sample (~5-10 GB)
- [ ] Run a baseline ETL notebook without tuning; record wall time

### SQL Daily
- [ ] Keep solving 3-5 problems/day (don't drop the habit)

---

## Module 6 — Performance, Delta, Streaming + Build

### Performance Tuning (Day 1-2)
- [ ] Partitioning: `repartition` vs `coalesce`; when shuffle is needed
- [ ] Reading execution plans with `df.explain(True)` — understand each stage
- [ ] Cache/persist: `MEMORY_ONLY` vs `MEMORY_AND_DISK`, when to uncache
- [ ] Spark UI: read the Stages, SQL, and Storage tabs on a live job
- [ ] Skew detection: stage duration distribution; salting fix
- [ ] Small files problem: compact to optimal 128MB-1GB Parquet/Delta files

### Delta Lake (Day 3)
- [ ] ACID transactions on a data lake — why it matters
- [ ] Time travel: `VERSION AS OF`, `TIMESTAMP AS OF`
- [ ] `MERGE INTO` for upserts and SCD2
- [ ] Schema evolution with `mergeSchema`, schema enforcement
- [ ] `OPTIMIZE` and `Z-ORDER`; `VACUUM` with retention
- [ ] Delta Live Tables (conceptually — hands-on in Azure module)

### Structured Streaming (Day 4)
- [ ] Micro-batch vs continuous; trigger modes (`ProcessingTime`, `Once`, `Available-now`)
- [ ] Watermarks for late data; event time vs processing time
- [ ] Output modes: append, update, complete
- [ ] Stateful aggregations: windowed counts, sessionization
- [ ] Checkpointing: location, failure recovery, exactly-once

### BUILD: NYC Taxi End-to-End (Day 5-6)
- [ ] Batch pipeline: raw CSV → cleaned Delta (Silver) → aggregated Delta (Gold)
- [ ] Add SCD2 on a zones lookup table using `MERGE`
- [ ] Streaming pipeline: simulate stream (`readStream` from directory); aggregate trips per hour per zone
- [ ] Performance writeup: baseline time, tuned time, what you changed and why
- [ ] At least one skew-mitigated join demonstrating salting
- [ ] Push notebooks + README + perf writeup to GitHub

---

## Notes
Suggested files in `notes/`:
- `spark_architecture.md`
- `joins_in_spark.md`
- `delta_lake_cheatsheet.md`
- `streaming_patterns.md`

## Build Output
Put notebooks and writeups in `builds/`.
