-- #10314 | Hard | 3-month rolling average of monthly revenue (excluding returns)
-- Table: amazon_purchases (user_id, created_at, purchase_amt)

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', created_at) AS month_start,
        SUM(purchase_amt) AS total_revenue
    FROM amazon_purchases
    WHERE purchase_amt > 0
    GROUP BY DATE_TRUNC('month', created_at)
)
SELECT
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    ROUND(
        AVG(total_revenue) OVER (
            ORDER BY month_start
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg
FROM monthly_revenue
ORDER BY month_start;

-- Pattern: window function with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
-- Returns excluded via `purchase_amt > 0` filter before aggregation
--
-- Why ORDER BY month_start (not the TO_CHAR string):
-- DATE_TRUNC returns a timestamp/date — ordering is numeric, always chronological.
-- TO_CHAR returns text; ordering becomes lexicographic.
-- 'YYYY-MM' with zero-padded months (e.g. '2020-01') happens to sort correctly
-- because text compare walks left-to-right and each position has fixed width.
-- But ANY format without zero-padding breaks chronology under text sort:
--   'YYYY-M'     → '2020-10' < '2020-2'   (text compares '1' < '2')
--   'Mon YYYY'   → 'Apr 2020' < 'Feb 2020' (alphabetical, not month order)
--   'MM/DD/YYYY' → '01/01/2021' < '02/01/2020' (year is last, so year gets ignored first)
-- Rule: sort on the underlying date, format to text only in the SELECT.
