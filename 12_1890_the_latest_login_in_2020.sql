SELECT
    l.user_id,
    l.last_stamp
FROM
(
    SELECT
        user_id,
        time_stamp AS last_stamp,
        RANK() OVER (PARTITION BY user_id ORDER BY time_stamp DESC) AS rnk
    FROM Logins
    WHERE time_stamp >= '2020-01-01'
        AND time_stamp < '2021-01-01'
) AS l
WHERE l.rnk = 1;