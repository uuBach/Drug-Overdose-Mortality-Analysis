-- Query: Top Substances Detected in Overdose Deaths
-- Description: This query counts the number of deaths where each specific substance was detected.

SELECT 'heroin' AS drug,
COUNT(*) AS death_count
FROM toxicology_results
WHERE heroin = TRUE
UNION ALL
SELECT 'cocaine',
COUNT(*)
FROM toxicology_results
WHERE cocaine = TRUE
UNION ALL
SELECT 'fentanyl',
COUNT(*)
FROM toxicology_results
WHERE fentanyl = TRUE
UNION ALL
SELECT 'fentanyl_analogue',
COUNT(*)
FROM toxicology_results
WHERE fentanyl_analogue = TRUE
UNION ALL
SELECT 'oxycodone',
COUNT(*)
FROM toxicology_results
WHERE oxycodone = TRUE
UNION ALL
SELECT 'oxymorphone',
COUNT(*)
FROM toxicology_results
WHERE oxymorphone = TRUE
UNION ALL
SELECT 'ethanol',
COUNT(*)
FROM toxicology_results
WHERE ethanol = TRUE
UNION ALL
SELECT 'hydrocodone',
COUNT(*)
FROM toxicology_results
WHERE hydrocodone = TRUE
UNION ALL
SELECT 'benzodiazepine',
COUNT(*)
FROM toxicology_results
WHERE benzodiazepine = TRUE
UNION ALL
SELECT 'methadone',
COUNT(*)
FROM toxicology_results
WHERE methadone = TRUE
UNION ALL
SELECT 'meth_amphetamine',
COUNT(*)
FROM toxicology_results
WHERE meth_amphetamine = TRUE
UNION ALL
SELECT 'tramadol',
COUNT(*)
FROM toxicology_results
WHERE tramadol = TRUE
UNION ALL
SELECT 'hydromorphone',
COUNT(*)
FROM toxicology_results
WHERE hydromorphone = TRUE
UNION ALL
SELECT 'morphine_not_heroin',
COUNT(*)
FROM toxicology_results
WHERE morphine_not_heroin = TRUE
UNION ALL
SELECT 'xylazine',
COUNT(*)
FROM toxicology_results
WHERE xylazine = TRUE
UNION ALL
SELECT 'gabapentin',
COUNT(*)
FROM toxicology_results
WHERE gabapentin = TRUE
UNION ALL
SELECT 'opiate_nos',
COUNT(*)
FROM toxicology_results
WHERE opiate_nos = TRUE
UNION ALL
SELECT 'heroin_morph_codeine',
COUNT(*)
FROM toxicology_results
WHERE heroin_morph_codeine = TRUE
UNION ALL
SELECT 'other_opioid',
COUNT(*)
FROM toxicology_results
WHERE other_opioid IS NOT NULL
UNION ALL
SELECT 'any_opioid',
COUNT(*)
FROM toxicology_results
WHERE any_opioid = TRUE
UNION ALL
SELECT 'other',
COUNT(*)
FROM toxicology_results
WHERE other IS NOT NULL
ORDER BY
death_count DESC

-- Insights:
-- 1. Fentanyl appears most frequently in fatal cases.
-- 2. Heroin and cocaine are also among the top substances.
-- 3. Poly-drug presence is common in overdoses, highlighting the complexity of substance abuse.