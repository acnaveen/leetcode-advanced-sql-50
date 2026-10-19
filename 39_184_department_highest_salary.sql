SELECT
    r.Department,
    r.Employee,
    r.Salary
FROM
(
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM Employee AS e
    INNER JOIN Department AS d
        ON e.departmentId = d.id
) AS r
WHERE r.rnk = 1;