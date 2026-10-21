SELECT
    g.user_id,
    MAX(g.gap) AS biggest_window
FROM
(
    SELECT
        user_id,
        DATEDIFF(
            day,
            visit_date,
            LEAD(visit_date, 1, CAST('2021-01-01' AS date))
                OVER (PARTITION BY user_id ORDER BY visit_date)
        ) AS gap
    FROM UserVisits
) AS g
GROUP BY g.user_id
ORDER BY g.user_id;