WITH FreeSeats AS
(
	SELECT
        seat_id,
	    seat_id - ROW_NUMBER() OVER (ORDER BY seat_id) AS grp
	FROM Cinema
	WHERE FREE = 1
)
SELECT seat_id
FROM FreeSeats
WHERE grp IN
    (
        SELECT grp
        FROM FreeSeats
        GROUP BY grp
        HAVING COUNT(*) > 1
    )
ORDER BY seat_id;