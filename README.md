# Data Engineering Roadmap

A structured 12-module learning journey covering Python, SQL, PySpark, GCP, Azure, Kafka, and dbt — with platform practice problems and end-to-end build projects at every stage.

---

## Module Progress

| Module | Focus | Status | Build |
|--------|-------|--------|-------|
| [01-02](./modules/01-02_python-de/README.md) | Python for DE | ⬜ Not Started | API ingestion tool |
| [03-04](./modules/03-04_sql-data-modeling/README.md) | SQL & Data Modeling | ⬜ Not Started | Star schema + 10 queries |
| [05-06](./modules/05-06_pyspark-delta/README.md) | PySpark & Delta Lake | ⬜ Not Started | NYC Taxi batch + streaming |
| [07-08](./modules/07-08_gcp-de/README.md) | GCP Data Engineering | ⬜ Not Started | Pub/Sub → Dataflow → BQ |
| [09-10](./modules/09-10_azure-de/README.md) | Azure Data Engineering | ⬜ Not Started | Medallion: ADLS → Databricks → Synapse |
| [11](./modules/11_streaming-kafka-dbt/README.md) | Streaming, Kafka, dbt | ⬜ Not Started | dbt project + Kafka pipe |
| [12](./modules/12_interview-prep/README.md) | Interview Prep & Polish | ⬜ Not Started | Portfolio + mock interviews |

---

## Platform Practice Progress

| Platform | Track | Solved | Target |
|----------|-------|--------|--------|
| StrataScratch | SQL Easy | 1 | 15 |
| StrataScratch | SQL Medium | 0 | 20 |
| StrataScratch | SQL Hard | 0 | 10 |
| StrataScratch | Python | 0 | 30 |
| LeetCode | SQL Top 50 | 1 | 50 |

---

## Repo Structure

```
de-roadmap/
├── modules/                    ← structured curriculum (open a module to see checklist)
│   ├── 01-02_python-de/
│   │   ├── README.md           ← full checklist with concepts + build tasks
│   │   ├── notes/              ← your concept notes while studying
│   │   └── builds/             ← deliverable code / notebooks / diagrams
│   ├── 03-04_sql-data-modeling/
│   ├── 05-06_pyspark-delta/
│   ├── 07-08_gcp-de/
│   ├── 09-10_azure-de/
│   ├── 11_streaming-kafka-dbt/
│   └── 12_interview-prep/
├── sql/                        ← platform practice problems
│   ├── stratascratch/easy|medium|hard/
│   ├── leetcode/
│   └── concepts/
├── pyspark/                    ← platform practice + spark-playground notebooks
├── python/                     ← platform practice + concept notebooks
├── progress/
│   └── log.md                  ← session-by-session log
└── resources.md                ← curated reading list
```

---

## How to Progress

1. Pick the current module → open its `README.md`
2. Work through concepts in order, dropping notes in `notes/`
3. Solve platform problems daily (SQL every day, even during non-SQL modules)
4. Build the deliverable → commit to `builds/`
5. Log every session in `progress/log.md`
6. Tick off checklist items as you complete them
7. Update the Module Progress table above when a module is done

---

## Resources

See [resources.md](./resources.md) for the full curated reading list.
