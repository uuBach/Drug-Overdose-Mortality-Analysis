-- Query: Opioid-Related Deaths by Age Group
-- Description: Categorizes victims into age groups (teen, adult, elderly),
-- and calculates the percentage of deaths involving any opioid in each group.

WITH age_groups_cte AS
(
    SELECT 
    row_id,
    age,
        CASE
        WHEN age BETWEEN 10 AND 20 THEN 'teen'
        WHEN age BETWEEN 20 AND 50 THEN 'adult'
        ELSE 'elderly'
        END AS age_groups
    FROM victim_profiles
), 

total_deaths_cte AS
(
    SELECT
    age_groups,
    COUNT(*) AS total_deaths
    FROM age_groups_cte
    GROUP BY
    age_groups
),

opioid_deaths_cte AS
(
    SELECT
    age_groups_cte.age_groups,
    COUNT(*) AS opioid_deaths
    FROM age_groups_cte
    JOIN toxicology_results 
    ON toxicology_results.row_id = age_groups_cte.row_id
    WHERE 
    toxicology_results.any_opioid = TRUE
    GROUP BY
    age_groups_cte.age_groups
)

SELECT 
opioid_deaths_cte.age_groups,
opioid_deaths_cte.opioid_deaths,
total_deaths_cte.total_deaths,
ROUND(opioid_deaths_cte.opioid_deaths * 100.0 / total_deaths_cte.total_deaths, 2) AS opioid_deaths_percentage
FROM opioid_deaths_cte
JOIN total_deaths_cte 
ON opioid_deaths_cte.age_groups = total_deaths_cte.age_groups

-- Insights:
-- 1. The elderly group has the highest opioid-involvement rate (75.27%).
-- 2. Adults are the most affected group in total count (5613 deaths).
-- 3. Teens show a lower proportion but still significant opioid involvement (65.31%).