WITH deaths_by_sex_cte AS
(
SELECT
sex,
COUNT(*) deaths
FROM victim_profiles
GROUP BY
sex
HAVING
COUNT(*) > 10
)

SELECT
dbs.sex,
dbs.deaths,
ROUND(dbs.deaths * 100.0 / 
(
    SELECT 
    COUNT(*) total_deaths
    FROM victim_profiles
), 2) AS deaths_percentage
FROM deaths_by_sex_cte AS dbs