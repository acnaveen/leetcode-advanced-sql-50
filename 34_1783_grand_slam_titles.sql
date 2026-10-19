SELECT
    p.player_id,
    p.player_name,
    COUNT(*) AS grand_slams_count
FROM
(
    SELECT Wimbledon AS player_id
    FROM Championships

    UNION ALL

    SELECT Fr_open AS player_id
    FROM Championships

    UNION ALL

    SELECT US_open AS player_id
    FROM Championships

    UNION ALL

    SELECT Au_open AS player_id
    FROM Championships
) AS c
INNER JOIN Players AS p
    ON p.player_id = c.player_id
GROUP BY
    p.player_id,
    p.player_name;