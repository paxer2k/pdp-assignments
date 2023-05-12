-- Hive queries used for the assignment

-- Hive query #1 - What time of day is most popular? Make top 3
SELECT fn_timeofday AS time_of_day, COUNT(*) AS popularity
FROM fn_statistics
GROUP BY fn_timeofday
ORDER BY popularity DESC
LIMIT 3;

-- Hive query #2 - What is the total damage done by players who have an accuracy between 20 and 40%?
SELECT fn_accuracy AS accuracy, SUM(fn_damagetoplayers) AS total_damage
FROM fn_statistics
WHERE CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) >= 20 
AND CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) <= 40
GROUP BY fn_accuracy
ORDER BY CAST(REGEXP_REPLACE(fn_accuracy, '%', '') AS FLOAT) DESC, total_damage DESC;

-- Hive query 3 - What is the distance travelled per "Mental state" group?
SELECT fn_mentalstate AS mental_state, ROUND(SUM(fn_distancetraveled)) AS total_distance
FROM fn_statistics
GROUP BY fn_mentalstate;