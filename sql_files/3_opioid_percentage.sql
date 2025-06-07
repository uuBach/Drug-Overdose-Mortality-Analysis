-- Query: Percentage of Overdose Deaths Involving Any Opioid
-- Description: Calculates the proportion of total overdose deaths where any opioid
-- (as indicated by `any_opioid = TRUE`) was present in toxicology results.

WITH opiod_deaths AS
(
    SELECT 
        COUNT(*) AS opiod_count
    FROM toxicology_results
    WHERE
        any_opioid = TRUE
), 
total_deaths AS (
    SELECT
        COUNT(*) total_count
    FROM toxicology_results
)
SELECT 
    ROUND(100.0 * opiod_deaths.opiod_count / total_deaths.total_count, 2) AS opiod_percent
FROM opiod_deaths, total_deaths

-- Insights:
-- 1. Approximately 73.68% of all recorded overdose cases involve at least one opioid.
-- 2. This highlights the central role opioids play in the overdose mortality crisis.
