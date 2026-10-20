SELECT
    r.customer_name,
    r.customer_id,
    r.order_id,
    r.order_date
FROM
(
    SELECT
        c.customer_name,
        c.customer_id,
        o.order_id,
        o.order_date,
        ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rn
    FROM Orders AS o
    INNER JOIN Customers AS c
        ON c.customer_id = o.customer_id
) AS r
WHERE r.rn <= 3
ORDER BY
    r.customer_name ASC,
    r.customer_id ASC,
    r.order_date DESC;