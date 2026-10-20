SELECT
    r.project_id,
    r.employee_id
FROM
(
    SELECT
        p.project_id,
        p.employee_id,
        RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS rnk
    FROM Project AS p
    INNER JOIN Employee AS e
        ON e.employee_id = p.employee_id
) AS r
WHERE r.rnk = 1;