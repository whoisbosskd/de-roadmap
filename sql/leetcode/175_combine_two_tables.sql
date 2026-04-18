-- Problem: 175. Combine Two Tables
-- URL: https://leetcode.com/problems/combine-two-tables
-- Difficulty: Easy
-- Date: 2026-04-17

-- Index on Address.personId before joining.
-- Why Address and not Person?
--   Person is the driving (left) table — every row in it is visited once regardless.
--   Address is the probed (right) table — for each Person row the engine looks up
--   matching rows in Address. An index on Address(personId) makes each lookup
--   O(log N) via B-tree traversal instead of O(N) full scan.
--   Total cost with index:  O(M log N)   where M = |Person|, N = |Address|
--   Total cost without:     O(M * N)     nested-loop full scan
--
-- Why B-tree gives O(log N) and not O(N):
--   A B-tree index is a balanced tree with branching factor ~100-1000.
--   Finding one key means walking from root to leaf — height = log_b(N) levels.
--   For 1 million rows that's ~3-4 node reads, not 1 000 000.

CREATE INDEX idx_address_personId ON Address(personId);

SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;

-- LEFT JOIN is required (not INNER JOIN) because the problem asks to return
-- all persons even when no matching address exists — those get NULL for city/state.
