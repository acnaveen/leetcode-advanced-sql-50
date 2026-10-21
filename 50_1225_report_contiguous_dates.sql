WITH AllDates AS
(
    SELECT
        'failed' AS status,
        fail_date AS event_date
    FROM Failed

    UNION ALL

    SELECT
        'succeeded' AS status,
        success_date AS event_date
    FROM Succeeded
),
AllDatesGrp AS
(
    SELECT
        status,
        event_date,
        ROW_NUMBER() OVER (ORDER BY event_date)
            - ROW_NUMBER() OVER (PARTITION BY status ORDER BY event_date) AS grp
    FROM AllDates
    WHERE event_date >= '2019-01-01'
        AND event_date <= '2019-12-31'
)
SELECT
    status AS period_state,
    MIN(event_date) AS start_date,
    MAX(event_date) AS end_date
FROM AllDatesGrp
GROUP BY
    status,
    grp
ORDER BY start_date;