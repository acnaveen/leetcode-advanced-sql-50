SELECT r.transaction_id
FROM
(
    SELECT
        transaction_id,
        RANK() OVER (PARTITION BY CAST(day AS date) ORDER BY amount DESC) AS rnk
    FROM Transactions
) AS r
WHERE r.rnk = 1
ORDER BY r.transaction_id;