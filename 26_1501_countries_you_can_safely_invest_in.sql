WITH FullCalls AS
(
    SELECT caller_id AS id, duration FROM Calls
    UNION ALL
    SELECT callee_id AS id, duration FROM Calls
)
SELECT ct.name AS country
FROM FullCalls AS cl
INNER JOIN Person AS p
    ON cl.id = p.id
INNER JOIN Country AS ct
    ON ct.country_code = SUBSTRING(p.phone_number, 1, 3)
GROUP BY ct.name
HAVING AVG(1.0 * cl.duration) > (SELECT AVG(1.0 * duration) FROM FullCalls);