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
