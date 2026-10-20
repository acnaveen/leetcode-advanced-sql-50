SELECT
    MIN(g.log_id) AS start_id,
    MAX(g.log_id) AS end_id
FROM
(
    SELECT
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS diff
    FROM Logs
) AS g
GROUP BY g.diff
ORDER BY start_id;