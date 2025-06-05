WITH opiod_deaths AS
(
SELECT 
COUNT(*) AS opiod_count
FROM toxicology_results
WHERE
any_opioid = TRUE
), total_deaths AS (
SELECT
COUNT(*) total_count
FROM toxicology_results
)

SELECT 
    ROUND(100.0 * opiod_deaths.opiod_count / total_deaths.total_count, 2) AS opiod_percent
FROM opiod_deaths, total_deaths


