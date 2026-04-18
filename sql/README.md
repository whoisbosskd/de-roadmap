# SQL Track

## Roadmap

Work through concepts in order. Do platform problems alongside each concept.

### Phase 1 — Foundations
- [ ] SELECT, WHERE, ORDER BY, LIMIT
- [ ] GROUP BY, HAVING, aggregate functions
- [ ] JOINs (INNER, LEFT, RIGHT, FULL, SELF)
- [ ] Subqueries and correlated subqueries

### Phase 2 — Intermediate
- [ ] CTEs (WITH clause)
- [ ] Window functions: ROW_NUMBER, RANK, DENSE_RANK
- [ ] Window functions: LAG, LEAD, FIRST_VALUE, LAST_VALUE
- [ ] Window functions: SUM/AVG OVER (PARTITION BY ... ORDER BY ...)

### Phase 3 — Advanced
- [ ] Query optimization and EXPLAIN plans
- [ ] Indexes — when and why they help
- [ ] Date/time manipulation
- [ ] String manipulation and REGEX basics

## Platform Progress

### StrataScratch

| Difficulty | Solved | Target |
|------------|--------|--------|
| Easy | 1 | 15 |
| Medium | 0 | 20 |
| Hard | 0 | 10 |

Problems go in:
- `stratascratch/easy/` — name files `<problem-id>_<slug>.sql`
- `stratascratch/medium/`
- `stratascratch/hard/`

### LeetCode (Top SQL 50)

Problems go in `leetcode/`. Target: complete the Top SQL 50 study plan.

| Completed | Total |
|-----------|-------|
| 1 | 50 |

## Concepts Notes

Drop `.md` or `.sql` files in `concepts/` as you study each topic.

Suggested files:
- `window_functions.sql` — worked examples
- `ctes.sql`
- `joins_cheatsheet.sql`
- `optimization_notes.md`
