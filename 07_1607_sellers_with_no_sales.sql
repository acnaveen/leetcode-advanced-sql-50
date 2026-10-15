SELECT s.seller_name
FROM Sellers AS s
LEFT JOIN Orders AS o
    ON o.seller_id = s.seller_id
    AND o.sale_date >= '2020-01-01'
    AND o.sale_date <= '2020-12-31'
WHERE o.order_id IS NULL
ORDER BY s.seller_name;