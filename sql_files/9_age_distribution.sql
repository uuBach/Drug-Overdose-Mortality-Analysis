-- Description:
-- This query categorizes all deaths into age groups (teen, adult, elderly) based on the victim's age. 
-- It calculates the total number of deaths and their percentage share from the entire dataset.

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

-- Insights:
-- 1. Adults (ages 21–50) account for ~64.18% of all recorded overdose deaths — the most affected group.
-- 2. Elderly individuals (ages 51+) make up ~34.59%, showing a surprisingly high vulnerability.
-- 3. Teens (10–20) contribute only ~1.23%, suggesting lower prevalence in younger populations, possibly due to access or detection.