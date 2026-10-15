SELECT
    r.student_id,
    r.course_id,
    r.grade
FROM
(
    SELECT
        student_id,
        course_id,
        grade,
        ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rn
    FROM Enrollments
) AS r
WHERE r.rn = 1
ORDER BY r.student_id;