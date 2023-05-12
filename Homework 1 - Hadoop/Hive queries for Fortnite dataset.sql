-- example_queries.sql

-- Query 1
SELECT fn_timeofday AS time_of_day, COUNT(*) AS popularity
FROM fn_statistics
GROUP BY fn_timeofday
ORDER BY popularity DESC
LIMIT 3;

-- Query 2
SELECT fn_accuracy AS accuracy, SUM(fn_damagetoplayers) AS total_damage
FROM fn_statistics
WHERE CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) >= 20 
AND CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) <= 40
GROUP BY fn_accuracy
ORDER BY CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) DESC, total_damage DESC;

-- Query 3
SELECT fn_mentalstate AS mental_state, ROUND(SUM(fn_distancetraveled)) AS total_distance
FROM fn_statistics
GROUP BY fn_mentalstate;