# Progress Log

Log each session here. Be brief — what you did, what clicked, what to revisit.

---

## Template

```
### YYYY-MM-DD
**Track:** SQL / PySpark / Python / Project
**Time spent:** Xh
**What I did:**
- 

**What clicked:**
- 

**To revisit:**
- 
```

---

## 2026-04

### 2026-04-17
**Track:** Setup
**Time spent:** —
**What I did:**
- Created repo structure for SQL, PySpark, Python, and Projects tracks

**What clicked:**
- Roadmap is in place, ready to start

**To revisit:**
- Pick first SQL concept from Phase 1 to begin

---

### 2026-04-17
**Track:** SQL — StrataScratch Easy
**Time spent:** —
**What I did:**
- Solved #10087 Heart Reacted Posts (facebook_posts + facebook_reactions)

**What clicked:**
- EXISTS short-circuits on first match — faster than IN for large tables
- EXISTS handles NULLs safely; IN with NULLs in subquery can silently return no rows

**To revisit:**
- correlated subqueries pattern (Phase 1 roadmap item)

---

### 2026-04-17
**Track:** SQL — LeetCode Easy
**Time spent:** —
**What I did:**
- Solved #175 Combine Two Tables (Person LEFT JOIN Address)

**What clicked:**
- Index goes on the probed (right) table, not the driving (left) table
- B-tree index = O(log N) lookup because it's a balanced tree — height grows logarithmically, not linearly
- LEFT JOIN vs INNER JOIN — must use LEFT to preserve persons with no address (return NULL)

**To revisit:**
- EXPLAIN plan to see index usage in action (Phase 3 roadmap item)

---

### 2026-04-17 (continued)
**Track:** Python — Core Language
**Time spent:** —
**What I did:**
- Practiced generators and iterators: `yield`, generator expressions, memory vs list comprehension tradeoffs

**What clicked:**
- (add what clicked)

**To revisit:**
- (add anything to revisit)

---

### 2026-04-18
**Track:** SQL — StrataScratch Hard
**Time spent:** —
**What I did:**
- Solved #2054 Consecutive Active Users (sf_events)

**What clicked:**
- Gaps-and-islands: `date - ROW_NUMBER()` collapses consecutive dates into the same group_key — same island = same streak
- `date - integer ✅` but `date - bigint ❌` — ROW_NUMBER() returns bigint, so `::int` cast is required
- Window sort is O(N log N); index on `(user_id, record_date)` avoids a full sort by giving the planner a pre-ordered scan
- `HAVING COUNT(*) >= 3` on the island groups directly gives streaks of 3+ days

**To revisit:**
- Gaps-and-islands with NULLs or non-date sequences
- Compare performance: `date - row_num` vs LAG-based gap detection

---

### 2026-04-19
**Track:** SQL — StrataScratch Hard
**Time spent:** —
**What I did:**
- Solved #10172 Best-Selling Item Per Month (online_retail)

**What clicked:**
- Top-N-per-group: aggregate first, then `ROW_NUMBER() OVER (PARTITION BY month ORDER BY total_paid DESC)`, filter `rn = 1`
- Returns filter needs both `InvoiceNo NOT LIKE 'C%'` AND `quantity > 0` — cancellations have C-prefix, negative quantities are returns
- `DISTINCT ON` works in vanilla Postgres but some graders reject it — `ROW_NUMBER()` is the portable fallback
- ROW_NUMBER vs RANK: ROW_NUMBER picks one on ties arbitrarily; RANK surfaces all tied rows

**To revisit:**
- When to use RANK/DENSE_RANK instead of ROW_NUMBER for top-N
- Partial indexes with WHERE clauses for filtered aggregations

---

### 2026-04-20
**Track:** SQL — StrataScratch Hard
**Time spent:** —
**What I did:**
- Solved #2007 Comparing December and January Ranks (fb_comments_count + fb_active_users)

**What clicked:**
- DENSE_RANK vs RANK: spec said "next rank +1 without skipping" → DENSE_RANK, not RANK
- Self-join the ranked CTE on country to align Jan row with Dec row — then filter `j.rnk < d.rnk` for improvement
- Smaller rank number = better position, so "improved" means Jan rnk < Dec rnk

**To revisit:**
- LAG over month partition as an alternative to self-join for period-over-period comparison

---

### 2026-04-24
**Track:** SQL — StrataScratch Hard
**Time spent:** —
**What I did:**
- Solved #10314 3-month rolling average of monthly revenue (amazon_purchases)

**What clicked:**
- Window frame `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` gives a true trailing 3-month window; first two rows auto-average fewer rows (as spec allows)
- Filter returns (`purchase_amt > 0`) BEFORE aggregation — otherwise negative returns silently cancel revenue
- DATE_TRUNC vs TO_CHAR for ordering: DATE_TRUNC returns timestamp (numeric compare → always chronological); TO_CHAR returns text (lexicographic compare)
  - 'YYYY-MM' with zero-padded months happens to sort correctly because every position has fixed width
  - But 'YYYY-M' breaks: '2020-10' < '2020-2' because text compares char-by-char and '1' < '2'
  - 'Mon YYYY' breaks alphabetically: 'Apr' < 'Feb'
  - Rule: `ORDER BY` the underlying date column; TO_CHAR only in SELECT

**To revisit:**
- RANGE BETWEEN INTERVAL '2 months' PRECEDING — true calendar-based window vs row-based
