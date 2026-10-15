SELECT
    e.left_operand,
    e.operator,
    e.right_operand,
    CASE
        WHEN e.operator = '=' AND l.value = r.value THEN 'true'
        WHEN e.operator = '<' AND l.value < r.value THEN 'true'
        WHEN e.operator = '>' AND l.value > r.value THEN 'true'
        ELSE 'false'
    END AS value
FROM Expressions AS e
LEFT JOIN Variables AS l
    ON l.name = e.left_operand
LEFT JOIN Variables AS r
    ON r.name = e.right_operand;