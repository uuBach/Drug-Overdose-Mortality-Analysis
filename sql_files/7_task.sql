SELECT
death_city,
COUNT(*) AS deaths
FROM victim_profiles
GROUP BY
death_city
ORDER BY
deaths DESC