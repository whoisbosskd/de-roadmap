-- Problem: Heart Reacted Posts
-- URL: https://platform.stratascratch.com/coding/10087
-- Difficulty: Easy
-- Date: 2026-04-17

SELECT fp.*
FROM facebook_posts AS fp
WHERE EXISTS (
    SELECT 1
    FROM facebook_reactions AS fr
    WHERE fr.post_id = fp.post_id
      AND fr.reaction = 'heart'
);

-- EXISTS vs IN (subquery):
-- EXISTS stops scanning as soon as it finds the first matching row (short-circuits).
-- IN evaluates the full subquery and builds a result set before comparing.
-- For large tables, EXISTS is faster when the inner match is found early.
-- EXISTS also handles NULLs safely — IN with NULLs in the subquery can silently return no rows.
