# Module 11 — Streaming, Kafka, dbt & Modern Stack

> Fills the remaining resume gaps: upgrades Kafka "exposure" to working knowledge, adds dbt (now near-universal), and gives infra-as-code exposure.

**Status:** ⬜ Not Started
**Build deliverable:** dbt project on Week 4 warehouse + Kafka streaming mini-pipe

---

## Kafka (Day 1-2)
- [ ] Topics, partitions, replication factor, leader/follower
- [ ] Producers: `acks` (0/1/all), idempotence, batching
- [ ] Consumer groups, offset management, rebalancing
- [ ] Exactly-once semantics: transactions, `read_committed` isolation
- [ ] Kafka Connect: source/sink connectors (Debezium, JDBC, S3)
- [ ] Schema Registry: Avro schemas, compatibility modes
- [ ] Set up local Kafka via Docker Compose; produce + consume with Python (`confluent-kafka`)

## CDC and Streaming Patterns (Day 3)
- [ ] Debezium: how log-based CDC works; why it beats polling
- [ ] Lambda vs Kappa architecture — tradeoffs and current consensus
- [ ] Event-driven architecture basics; idempotent consumers

## dbt (Day 4-5)
- [ ] Install `dbt-core` + adapter (`dbt-bigquery` or `dbt-databricks`)
- [ ] Project structure: models, sources, seeds, snapshots, tests, macros, analyses
- [ ] Materializations: view, table, incremental, ephemeral — when to use each
- [ ] Incremental models: `unique_key`, `is_incremental()`, merge vs delete+insert
- [ ] Snapshots for SCD2
- [ ] Tests: built-in (`not_null`, `unique`, `relationships`, `accepted_values`) + custom singular tests
- [ ] Sources with freshness checks
- [ ] Jinja and macros for DRY SQL
- [ ] `docs generate` / `docs serve` — auto-generated lineage graph
- [ ] Build a dbt project on top of the Module 4 warehouse: sources → staging → marts

## Data Quality + Observability (Day 6)
- [ ] Great Expectations vs Soda vs dbt tests — what each does best
- [ ] Data contracts: what they are, why they're trending
- [ ] Monte Carlo / data observability concepts (freshness, volume, schema, distribution)

## Infra-as-Code (squeeze in)
- [ ] Terraform basics: providers, resources, state, plan/apply
- [ ] Provision a BigQuery dataset + table with Terraform
- [ ] Provision an ADLS container + Databricks workspace resource with Terraform
- [ ] Add Terraform usage to resume and project READMEs

---

## Notes
Suggested files in `notes/`:
- `kafka_fundamentals.md`
- `cdc_patterns.md`
- `dbt_cheatsheet.md`
- `terraform_basics.md`

## Build Output
Put dbt project, Kafka Docker Compose, and Terraform configs in `builds/`.
