-- #10548 | Hard | Top actors ranked by avg rating in their most-frequent genre
-- Table: top_actors_rating (actor_name, genre, movie_rating)
-- Tie-breaks: 1) most appearances per genre, 2) highest avg rating, 3) keep all tied genres
-- Output: actor + genre pairs whose DENSE_RANK by avg_rating is in top 3

WITH agg AS (
    SELECT actor_name, genre,
           COUNT(*) AS genre_count,
           AVG(movie_rating) AS avg_rating
    FROM top_actors_rating
    GROUP BY actor_name, genre
),
max_count AS (
    SELECT *,
           MAX(genre_count) OVER (PARTITION BY actor_name) AS max_genre_count
    FROM agg
),
filtered_count AS (
    SELECT *
    FROM max_count
    WHERE genre_count = max_genre_count
),
max_rating AS (
    SELECT *,
           MAX(avg_rating) OVER (PARTITION BY actor_name) AS max_avg_rating
    FROM filtered_count
),
final_actor_genre AS (
    SELECT actor_name, genre, avg_rating
    FROM max_rating
    WHERE avg_rating = max_avg_rating
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY avg_rating DESC) AS rnk
    FROM final_actor_genre
)
SELECT actor_name, genre
FROM ranked
WHERE rnk <= 3;

-- Pattern: chained tie-break filters via window MAX, then DENSE_RANK for top-N-with-ties
-- Step 1 (max_count → filtered_count): keep only each actor's most-frequent genre(s)
-- Step 2 (max_rating → final_actor_genre): among those, keep only the highest avg rating
--   Surviving rows = ties in BOTH count AND rating, so all are emitted per spec
-- Step 3 (ranked): DENSE_RANK so ties share a rank and the next rank is +1 (no gaps);
--   WHERE rnk <= 3 returns the top-3 ranks (rows count may exceed 3 when ties exist)
