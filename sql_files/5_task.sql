WITH race_and_id AS
(
    SELECT 
    row_id,
    race
    FROM victim_profiles
    WHERE 
    race IS NOT NULL
),
total_deaths_cte AS
(
    SELECT 
    race,
    COUNT(*) AS total_deaths 
    from race_and_id
    GROUP BY
    race
),
fentanyl_deaths_cte AS
(
    SELECT
    race_and_id.race,
    COUNT(*) AS fentanyl_deaths
    FROM race_and_id
    JOIN toxicology_results
    ON toxicology_results.row_id = race_and_id.row_id
    WHERE
    toxicology_results.fentanyl = TRUE
    GROUP BY
    race_and_id.race
)
SELECT 
fentanyl_deaths_cte.race,
total_deaths_cte.total_deaths,
fentanyl_deaths_cte.fentanyl_deaths,
ROUND(fentanyl_deaths_cte.fentanyl_deaths * 100.0 / total_deaths_cte.total_deaths, 2) AS fentanyl_deaths_percentage
FROM fentanyl_deaths_cte
JOIN total_deaths_cte
ON total_deaths_cte.race = fentanyl_deaths_cte.race
ORDER BY
fentanyl_deaths_percentage DESC 