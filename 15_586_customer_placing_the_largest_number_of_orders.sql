SELECT o.customer_number
FROM
(
    SELECT
        customer_number,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY customer_number
) AS o
WHERE o.rnk = 1;