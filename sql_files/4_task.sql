WITH age_groups_cte AS (
SELECT 
row_id,
age,
CASE
WHEN age BETWEEN 10 AND 20 THEN 'teen'
WHEN age BETWEEN 20 AND 50 THEN 'adult'
ELSE 'elderly'
END AS age_groups 
FROM victim_profiles
), total_deaths_cte AS(
SELECT
ag.age_groups,
COUNT(ag.age_groups) AS total_deaths
FROM age_groups_cte AS ag
INNER JOIN toxicology_results AS tr
ON tr.row_id = ag.row_id
GROUP BY
ag.age_groups
), opiod_deaths_cte AS(
SELECT
ag.age_groups,
COUNT(ag.age_groups) AS opiod_deaths
FROM age_groups_cte AS ag
INNER JOIN toxicology_results AS tr
ON tr.row_id = ag.row_id
WHERE
tr.any_opioid = TRUE
GROUP BY
ag.age_groups
)

SELECT total_deaths_cte.*,
opiod_deaths_cte.opiod_deaths
FROM total_deaths_cte, opiod_deaths_cte, age_groups_cte
GROUP BY
age_groups_cte.age_groups
