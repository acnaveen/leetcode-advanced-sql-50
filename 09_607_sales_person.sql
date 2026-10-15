SELECT s.name
FROM SalesPerson AS s
WHERE NOT EXISTS
(
    SELECT NULL
    FROM Orders AS o
    INNER JOIN Company AS c
        ON c.com_id = o.com_id
    WHERE c.name = 'RED'
        AND o.sales_id = s.sales_id
);