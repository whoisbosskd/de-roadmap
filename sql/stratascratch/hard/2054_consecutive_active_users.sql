-- #2054 | Hard | Find all users active for 3 consecutive days or more
-- Table: sf_events (user_id, record_date)

/* Ensure index:
CREATE INDEX idx_sf_events_user_date
ON sf_events(user_id, record_date);
Without this, the window sort becomes expensive. */

WITH cte AS (
    SELECT
        user_id,
        record_date - (ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY record_date
        )::int) AS group_key
        -- date - integer ✅  |  date - bigint ❌ (needs explicit cast)
        -- alt: row_num * INTERVAL '1 day' also works but is less idiomatic
    FROM sf_events
),
streak AS (
    SELECT user_id
    FROM cte
    GROUP BY user_id, group_key
    HAVING COUNT(*) >= 3
)
SELECT DISTINCT user_id
FROM streak;

-- Pattern: gaps-and-islands
-- Subtracting a sequential row_number from the date collapses consecutive
-- dates into the same group_key. Any island with 3+ rows = 3 consecutive days.
