WITH ExamWindow AS
(
    SELECT
        student_id,
        CASE
            WHEN score IN (
                MIN(score) OVER (PARTITION BY exam_id),
                MAX(score) OVER (PARTITION BY exam_id)
            ) THEN 0 ELSE 1
        END AS quiet
    FROM Exam
)
SELECT
    s.student_id,
    s.student_name
FROM ExamWindow AS e
INNER JOIN Student AS s
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.student_name
HAVING MIN(e.quiet) = 1
ORDER BY s.student_id;