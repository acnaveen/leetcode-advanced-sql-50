SELECT
    a.player_id,
    a.device_id
FROM
(
    SELECT
        player_id,
        device_id,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) AS a
WHERE a.rn = 1;