SELECT
    c.customer_id,
    c.name
FROM Orders AS o
INNER JOIN Product AS p
    ON o.product_id = p.product_id
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.name
HAVING
    SUM(CASE WHEN o.order_date >= '2020-06-01' AND o.order_date <= '2020-06-30' THEN o.quantity * p.price ELSE 0 END) >= 100
    AND SUM(CASE WHEN o.order_date >= '2020-07-01' AND o.order_date <= '2020-07-31' THEN o.quantity * p.price ELSE 0 END) >= 100;