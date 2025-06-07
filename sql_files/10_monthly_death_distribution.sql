-- Description:
-- This query extracts the month from the recorded date of death 
-- and counts the number of overdose deaths per month. 

SELECT
    EXTRACT(MONTH FROM date) AS month,
    COUNT(*) AS deaths
FROM victim_profiles
GROUP BY
    EXTRACT(MONTH FROM date)
ORDER BY
    deaths DESC

-- Insights:
-- 1. The summer months (June–August) and November–July tend to have slightly higher overdose death counts.
-- 2. July is the most deadly month with 1,074 cases.
-- 3. January and February show the lowest counts, which may relate to reduced outdoor activity or reporting lag.