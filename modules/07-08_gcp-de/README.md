# Module 07-08 — GCP Data Engineering

> Goal: Google Professional Data Engineer (PDE) interview-level depth. Sitting the exam is optional; the prep IS the curriculum.

**Status:** ⬜ Not Started
**Build deliverable:** Pub/Sub → Dataflow → BigQuery streaming pipeline + Composer DAG

---

## Module 7 — BigQuery + Orchestration

### BigQuery Deep (Day 1-2)
- [ ] Partitioning: time-unit (daily/hourly), ingestion-time, integer range
- [ ] Clustering: up to 4 columns, order matters, when it helps
- [ ] Slot model: on-demand vs reservations; flex slots; cost control
- [ ] Cost optimization: `SELECT *` bans, partition filters required, materialized views
- [ ] `MERGE` statement for UPSERTs and SCD2 in BigQuery
- [ ] UDFs (SQL and JavaScript); persistent vs temporary
- [ ] Federated queries over Google Sheets, Cloud SQL, external Parquet in GCS
- [ ] BigQuery ML basics: `CREATE MODEL`, built-in algorithms (awareness only)
- [ ] Authorized views and row-level security

### Pub/Sub (Day 3)
- [ ] Topics, subscriptions (pull vs push), ack deadlines
- [ ] Dead-letter topics, retry policies
- [ ] Ordering keys (regional constraint)
- [ ] Exactly-once delivery semantics and caveats
- [ ] Pub/Sub Lite vs Pub/Sub — when each is right

### Cloud Storage + IAM (Day 4)
- [ ] Storage classes (Standard, Nearline, Coldline, Archive); lifecycle rules
- [ ] Signed URLs, uniform bucket-level access, object versioning
- [ ] IAM for DE: roles for BQ (dataViewer / dataEditor / user / admin), least privilege
- [ ] VPC Service Controls (awareness; why enterprises demand it)

### Composer (Airflow) (Day 5-6)
- [ ] DAG anatomy; `schedule_interval`; `catchup` flag; idempotency
- [ ] Operators: `BigQueryInsertJobOperator`, `GCSToBigQueryOperator`, `PythonOperator`
- [ ] Sensors: `ExternalTaskSensor`, `GCSObjectExistenceSensor`; poke vs reschedule mode
- [ ] XComs for cross-task data; when to avoid them (large payloads)
- [ ] TaskFlow API (`@task` decorator) — modern style
- [ ] Dynamic task mapping (Airflow 2.3+)
- [ ] Deferrable operators and triggerer process
- [ ] SLA, retries, `on_failure_callback`, alerting

---

## Module 8 — Dataflow (Beam) + Build

### Apache Beam / Dataflow (Day 1-3)
- [ ] PCollections, PTransforms, pipelines, runners
- [ ] Core transforms: `ParDo`, `Map`, `FlatMap`, `GroupByKey`, `CoGroupByKey`, `Combine`
- [ ] Windowing: fixed, sliding, session, global
- [ ] Watermarks and late-data handling
- [ ] Triggers: event-time, processing-time, data-driven, composite
- [ ] Side inputs and side outputs
- [ ] Flex Templates and Classic Templates
- [ ] Streaming autoscaling; enabling Streaming Engine
- [ ] Dataflow vs Dataproc vs BigQuery Data Transfer — the decision matrix

### Supporting Services (Day 4)
- [ ] Cloud Functions: lightweight event triggers (Finalize on GCS)
- [ ] Cloud Run / Cloud Run Jobs: containerized batch jobs
- [ ] Dataproc: managed Spark/Hadoop; ephemeral clusters, autoscaling
- [ ] Cloud Logging and Monitoring basics for pipelines

### BUILD: GCP End-to-End Streaming Pipeline (Day 5-6)
- [ ] Publisher: Cloud Function or Python script pushing synthetic events to Pub/Sub at ~100 msg/s
- [ ] Dataflow streaming job: parse JSON, window 1-min fixed, aggregate, write to BigQuery partitioned table
- [ ] Dead-letter handling for malformed messages (side output → GCS)
- [ ] Composer DAG: nightly batch job that enriches streaming table with a dimension load
- [ ] Data quality check task in the DAG (row counts, freshness)
- [ ] Monitoring: at least one Cloud Monitoring alert (job failure or freshness breach)
- [ ] README with architecture diagram (GCP icons), cost estimate, and retry semantics

### Cert Prep (ongoing)
- [ ] Complete the official PDE exam guide checklist
- [ ] Take one full-length PDE practice exam by end of Module 8

---

## Notes
Suggested files in `notes/`:
- `bigquery_partitioning_clustering.md`
- `pubsub_patterns.md`
- `airflow_operators_cheatsheet.md`
- `dataflow_beam_concepts.md`

## Build Output
Put pipeline code, DAGs, and architecture diagrams in `builds/`.
