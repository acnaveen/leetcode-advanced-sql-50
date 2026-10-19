SELECT MIN(d.diff) AS shortest
FROM
(
    SELECT x - LAG(x) OVER (ORDER BY x) AS diff
    FROM Point
) AS d;