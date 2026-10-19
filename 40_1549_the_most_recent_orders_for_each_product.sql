SELECT
    p.product_name,
    r.product_id,
    r.order_id,
    r.order_date
FROM
(
    SELECT
        product_id,
        order_id,
        order_date,
        RANK() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rnk
    FROM Orders
) AS r
INNER JOIN Products AS p
    ON p.product_id = r.product_id
WHERE r.rnk = 1
ORDER BY
    p.product_name,
    r.product_id,
    r.order_id;