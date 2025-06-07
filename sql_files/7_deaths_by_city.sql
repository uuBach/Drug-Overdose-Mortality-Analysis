-- Description:
-- This query identifies the cities with the highest number of overdose deaths.
-- It helps detect geographic hotspots where intervention and resources may be most urgently needed.

SELECT
death_city,
COUNT(*) AS deaths
FROM victim_profiles
GROUP BY
death_city
ORDER BY
deaths DESC

-- Insights:
-- 1. Hartford reports the highest number of overdose deaths among all cities, indicating a critical hotspot.
-- 2. New Haven and Bridgeport also appear in the top results, suggesting a regional concentration in Connecticut.
-- 3. These clusters may point to systemic issues in access to care, socioeconomic stress, or trafficking routes.