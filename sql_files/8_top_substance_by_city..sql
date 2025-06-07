-- Description:
-- This query identifies the most common substance detected in fatal overdoses for each city.
-- It aggregates toxicology results by city and substance, then selects the highest-occurrence substance per city.

WITH city_and_drugs_cte AS
(
SELECT vp.death_city AS city, 'heroin' AS drug, COUNT(*) AS death_count
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.heroin = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'cocaine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.cocaine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'fentanyl', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.fentanyl = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'fentanyl_analogue', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.fentanyl_analogue = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'oxycodone', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.oxycodone = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'oxymorphone', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.oxymorphone = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'ethanol', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.ethanol = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'hydrocodone', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.hydrocodone = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'benzodiazepine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.benzodiazepine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'methadone', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.methadone = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'meth_amphetamine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.meth_amphetamine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'amphetamine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.amphetamine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'tramadol', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.tramadol = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'hydromorphone', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.hydromorphone = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'morphine_not_heroin', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.morphine_not_heroin = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'xylazine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.xylazine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'gabapentin', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.gabapentin = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'opiate_nos', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.opiate_nos = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'heroin_morph_codeine', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.heroin_morph_codeine = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'other_opioid', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.other_opioid IS NOT NULL
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'any_opioid', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.any_opioid = TRUE
GROUP BY vp.death_city

UNION ALL

SELECT vp.death_city, 'other', COUNT(*)
FROM toxicology_results tr
JOIN victim_profiles vp ON vp.row_id = tr.row_id
WHERE tr.other IS NOT NULL
GROUP BY vp.death_city
),
rn_cte AS
(
SELECT
city,
drug,
death_count,
ROW_NUMBER() OVER(
    PARTITION BY city
    ORDER BY death_count DESC
    ) AS rn
FROM city_and_drugs_cte
)
SELECT 
city,
drug,
death_count
FROM rn_cte
WHERE rn = 1

-- Insights:
-- 1. Fentanyl is the most common substance involved in fatal overdoses across most cities, often by a wide margin.
-- 2. Cities like Hartford, New Haven, and Bridgeport show high counts not only for fentanyl but also for any_opioid and heroin, suggesting frequent multi-drug overdoses.

