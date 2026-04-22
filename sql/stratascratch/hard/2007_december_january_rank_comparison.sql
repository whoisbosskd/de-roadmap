-- #2007 | Hard | Countries whose comment-volume rank improved from Dec 2019 to Jan 2020
-- Tables: fb_comments_count (user_id, created_at, number_of_comments)
--         fb_active_users (user_id, country)

WITH cte AS (
    SELECT
        c.user_id,
        EXTRACT(MONTH FROM c.created_at) AS month,
        c.number_of_comments,
        u.country
    FROM fb_comments_count c
    JOIN fb_active_users u
      ON c.user_id = u.user_id
    WHERE c.created_at BETWEEN '2019-11-30' AND '2020-01-31'
),
ranked AS (
    SELECT country, month, SUM(number_of_comments) AS no
    FROM cte
    GROUP BY country, month
),
final AS (
    SELECT
        country,
        month,
        no,
        DENSE_RANK() OVER (PARTITION BY month ORDER BY no DESC) AS rnk
    FROM ranked
)
SELECT j.country
FROM final j
JOIN final d
  ON j.country = d.country
WHERE j.month = 1
  AND d.month = 12
  AND j.rnk < d.rnk;

-- Pattern: rank comparison via self-join on same CTE
-- DENSE_RANK (not RANK) per spec: ties share rank, next rank = prev + 1 (no gaps)
-- Self-join on country aligns Jan row (j) with Dec row (d); smaller rnk = improved position
