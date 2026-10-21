WITH AllSubtasks AS
(
    SELECT
        task_id,
        subtasks_count AS subtask_id
    FROM Tasks

    UNION ALL

    SELECT
        a.task_id,
        a.subtask_id - 1
    FROM AllSubtasks AS a
    WHERE a.subtask_id > 1
)
SELECT
    a.task_id,
    a.subtask_id
FROM AllSubtasks AS a
LEFT JOIN Executed AS e
    ON e.task_id = a.task_id
    AND e.subtask_id = a.subtask_id
WHERE e.task_id IS NULL;