WITH age_groups_cte AS
(
SELECT
CASE 
WHEN age BETWEEN 10 AND 20 THEN 'teen'
WHEN age BETWEEN 20 AND 50 THEN 'adult'
ELSE 'elderly'
END AS age_groups,
COUNT(*) total
FROM victim_profiles
GROUP BY
CASE 
  WHEN age BETWEEN 10 AND 20 THEN 'teen'
  WHEN age BETWEEN 20 AND 50 THEN 'adult'
  ELSE 'elderly'
END
)

SELECT
age_groups,
total,
ROUND( total * 100.0 / (SELECT COUNT(*) FROM victim_profiles) , 2) AS deaths_percentage
FROM age_groups_cte