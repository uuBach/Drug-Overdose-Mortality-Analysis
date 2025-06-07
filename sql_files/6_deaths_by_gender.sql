-- Description:
-- This query analyzes the distribution of overdose deaths by gender.
-- It calculates both the absolute number of deaths and the percentage 
-- each gender represents out of the total recorded cases.

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

-- Insights:
-- 1. Males account for nearly 3 out of every 4 overdose deaths (74.18%), suggesting a strong gender disparity.
-- 2. Female overdose deaths are significantly lower at 25.72%, highlighting potential differences in substance use patterns or access to treatment.
-- 3. Public health efforts may need to prioritize targeted interventions for men, who are at substantially higher risk.
