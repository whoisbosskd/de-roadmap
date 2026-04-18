# Module 09-10 — Azure Data Engineering

> Mirror of the GCP module. Target depth: Azure DP-203 interview-level. Lean harder on ADF, Databricks, and Synapse.

**Status:** ⬜ Not Started
**Build deliverable:** Medallion architecture — ADLS → Databricks → Synapse

---

## Module 9 — ADF + Databricks + ADLS

### ADLS Gen2 (Day 1)
- [ ] Hierarchical namespace vs flat blob; performance implications
- [ ] ACLs vs RBAC — when you need both
- [ ] Lifecycle management policies (move to Cool/Archive)
- [ ] Private endpoints and storage firewall basics
- [ ] Medallion layout (bronze/silver/gold) conventions

### Azure Data Factory (Day 2-3)
- [ ] Linked services, datasets, pipelines, activities
- [ ] Copy Activity: self-hosted IR vs Azure IR, parallel copies, staging
- [ ] Mapping Data Flows: transformations, debug mode, cluster sizing
- [ ] Triggers: schedule, tumbling window, event-based (blob created)
- [ ] Parameterization: pipeline parameters, variables, expressions
- [ ] Metadata-driven pipelines: one pipeline loads N tables from a config table
- [ ] Integration with Git (Azure Repos / GitHub) for CI/CD

### Azure Databricks (Day 4-5)
- [ ] Workspace, repos, cluster types (all-purpose vs job), cluster policies
- [ ] Unity Catalog: catalog → schema → table hierarchy; grants
- [ ] Delta Live Tables: declarative pipelines, expectations, SCD2 `APPLY CHANGES`
- [ ] Workflows (Jobs): multi-task DAGs, retries, alerts
- [ ] Photon engine: when it helps, when it doesn't
- [ ] Connecting Databricks to ADLS (passthrough, service principal, Unity Catalog external locations)

### Event Hubs + Stream Analytics (Day 6)
- [ ] Event Hubs: partitions, throughput units, Kafka-compatible endpoint
- [ ] Capture feature (auto-write to ADLS)
- [ ] Stream Analytics basics: query language, windowing, output sinks
- [ ] When to use Stream Analytics vs Databricks Structured Streaming

---

## Module 10 — Synapse + Security + Build

### Synapse Analytics (Day 1-2)
- [ ] Serverless SQL pool: query Parquet/CSV in ADLS directly with T-SQL
- [ ] Dedicated SQL pool: DWU sizing, distributions (hash / round-robin / replicated)
- [ ] PolyBase / `COPY` statement for bulk loading
- [ ] External tables vs views over ADLS files
- [ ] Synapse Pipelines (essentially ADF inside Synapse)
- [ ] Spark pools in Synapse (awareness; most shops pick Databricks instead)

### Security & Governance (Day 3)
- [ ] Azure AD / Entra ID: service principals, managed identities (system vs user-assigned)
- [ ] Key Vault for secrets; referencing from ADF / Databricks
- [ ] Row-level security and dynamic data masking in Synapse
- [ ] Purview basics: lineage, classification, data catalog (awareness-level)

### BUILD: Medallion Architecture on Azure (Day 4-6)
- [ ] Bronze: ADF ingests 3+ source systems (REST API, on-prem CSV via self-hosted IR, event stream) to ADLS
- [ ] Silver: Databricks notebook (or DLT pipeline) cleans, deduplicates, writes Delta to ADLS with Unity Catalog
- [ ] Gold: aggregated business tables in Delta; exposed via Synapse serverless external tables
- [ ] SCD2 on a customer dimension using DLT `APPLY CHANGES` or `MERGE`
- [ ] Orchestration: ADF pipeline triggers Databricks job; end-of-pipeline data quality check
- [ ] Secrets via Key Vault; service principal or managed identity auth throughout
- [ ] Monitoring: at least one Azure Monitor alert
- [ ] README with architecture diagram (Azure icons), lineage, and cost notes

### Cert Prep
- [ ] Complete Microsoft Learn DP-203 path
- [ ] Take one DP-203 practice exam by end of Module 10

---

## Notes
Suggested files in `notes/`:
- `adf_patterns.md`
- `databricks_unity_catalog.md`
- `synapse_vs_databricks.md`
- `azure_security_cheatsheet.md`

## Build Output
Put pipeline JSON exports, notebooks, and architecture diagrams in `builds/`.
