SELECT
    r.customer_id,
    p.product_id,
    p.product_name
FROM
(
    SELECT
        customer_id,
        product_id,
        RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY
        customer_id,
        product_id
) AS r
INNER JOIN Products AS p
    ON p.product_id = r.product_id
WHERE r.rnk = 1;