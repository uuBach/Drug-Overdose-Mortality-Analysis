-- Query: Most Common Drug Combinations in Overdose Cases
-- Description: This query identifies and ranks the most frequent combinations of substances
-- found together in a single overdose case (i.e., when 2 or more substances tested positive).

WITH combinations AS(
SELECT
(
CASE WHEN heroin = TRUE THEN 1 ELSE 0 END +
CASE WHEN cocaine = TRUE THEN 1 ELSE 0 END +
CASE WHEN fentanyl = TRUE THEN 1 ELSE 0 END +
CASE WHEN fentanyl_analogue = TRUE THEN 1 ELSE 0 END +
CASE WHEN oxycodone = TRUE THEN 1 ELSE 0 END +
CASE WHEN oxymorphone = TRUE THEN 1 ELSE 0 END +
CASE WHEN ethanol = TRUE THEN 1 ELSE 0 END +
CASE WHEN hydrocodone = TRUE THEN 1 ELSE 0 END +
CASE WHEN benzodiazepine = TRUE THEN 1 ELSE 0 END +
CASE WHEN methadone = TRUE THEN 1 ELSE 0 END +
CASE WHEN meth_amphetamine = TRUE THEN 1 ELSE 0 END +
CASE WHEN amphetamine = TRUE THEN 1 ELSE 0 END +
CASE WHEN tramadol = TRUE THEN 1 ELSE 0 END +
CASE WHEN hydromorphone = TRUE THEN 1 ELSE 0 END +
CASE WHEN morphine_not_heroin = TRUE THEN 1 ELSE 0 END +
CASE WHEN xylazine = TRUE THEN 1 ELSE 0 END +
CASE WHEN gabapentin = TRUE THEN 1 ELSE 0 END +
CASE WHEN opiate_nos = TRUE THEN 1 ELSE 0 END +
CASE WHEN heroin_morph_codeine = TRUE THEN 1 ELSE 0 END +
CASE WHEN other_opioid IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN any_opioid = TRUE THEN 1 ELSE 0 END +
CASE WHEN other IS NOT NULL THEN 1 ELSE 0 END 
) AS count,
CONCAT_WS
(', ',
CASE WHEN heroin = TRUE THEN 'heroin' END,
CASE WHEN cocaine = TRUE THEN 'cocaine' END,
CASE WHEN fentanyl = TRUE THEN 'fentanyl' END,
CASE WHEN fentanyl_analogue = TRUE THEN 'fentanyl analogue' END,
CASE WHEN oxycodone = TRUE THEN 'oxycodone' END,
CASE WHEN oxymorphone = TRUE THEN 'oxymorphone' END,
CASE WHEN ethanol = TRUE THEN 'ethanol' END,
CASE WHEN hydrocodone = TRUE THEN 'hydrocodone' END,
CASE WHEN benzodiazepine = TRUE THEN 'benzodiazepine' END,
CASE WHEN methadone = TRUE THEN 'methadone' END,
CASE WHEN meth_amphetamine = TRUE THEN 'meth amphetamine' END,
CASE WHEN amphetamine = TRUE THEN 'amphetamine' END,
CASE WHEN tramadol = TRUE THEN 'tramadol' END,
CASE WHEN hydromorphone = TRUE THEN 'hydromorphone' END,
CASE WHEN morphine_not_heroin = TRUE THEN 'morphine not heroin' END,
CASE WHEN xylazine = TRUE THEN 'xylazine' END,
CASE WHEN gabapentin = TRUE THEN 'gabapentin' END,
CASE WHEN opiate_nos = TRUE THEN 'opiate nos' END,
CASE WHEN heroin_morph_codeine = TRUE THEN 'heroin morph codeine' END,
CASE WHEN other_opioid IS NOT NULL THEN 'other opioid' END,
CASE WHEN any_opioid = TRUE THEN 'any opioid' END,
CASE WHEN other IS NOT NULL THEN 'other' END
) AS drug_names
FROM toxicology_results
WHERE
(
CASE WHEN heroin = TRUE THEN 1 ELSE 0 END +
CASE WHEN cocaine = TRUE THEN 1 ELSE 0 END +
CASE WHEN fentanyl = TRUE THEN 1 ELSE 0 END +
CASE WHEN fentanyl_analogue = TRUE THEN 1 ELSE 0 END +
CASE WHEN oxycodone = TRUE THEN 1 ELSE 0 END +
CASE WHEN oxymorphone = TRUE THEN 1 ELSE 0 END +
CASE WHEN ethanol = TRUE THEN 1 ELSE 0 END +
CASE WHEN hydrocodone = TRUE THEN 1 ELSE 0 END +
CASE WHEN benzodiazepine = TRUE THEN 1 ELSE 0 END +
CASE WHEN methadone = TRUE THEN 1 ELSE 0 END +
CASE WHEN meth_amphetamine = TRUE THEN 1 ELSE 0 END +
CASE WHEN amphetamine = TRUE THEN 1 ELSE 0 END +
CASE WHEN tramadol = TRUE THEN 1 ELSE 0 END +
CASE WHEN hydromorphone = TRUE THEN 1 ELSE 0 END +
CASE WHEN morphine_not_heroin = TRUE THEN 1 ELSE 0 END +
CASE WHEN xylazine = TRUE THEN 1 ELSE 0 END +
CASE WHEN gabapentin = TRUE THEN 1 ELSE 0 END +
CASE WHEN opiate_nos = TRUE THEN 1 ELSE 0 END +
CASE WHEN heroin_morph_codeine = TRUE THEN 1 ELSE 0 END +
CASE WHEN other_opioid IS NOT NULL THEN 1 ELSE 0 END +
CASE WHEN any_opioid = TRUE THEN 1 ELSE 0 END +
CASE WHEN other IS NOT NULL THEN 1 ELSE 0 END 
) >= 2
)

SELECT 
drug_names,
COUNT(drug_names) AS deaths
FROM combinations
GROUP BY drug_names
ORDER BY
deaths DESC

-- Insights:
-- 1. Fentanyl is commonly found alongside heroin and other opioids.
-- 2. Polydrug use is frequent—many deaths involve multiple substances.
-- 3. The combinations involving both legal and illegal drugs (e.g., fentanyl + ethanol) are notable.
