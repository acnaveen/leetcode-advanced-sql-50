SELECT DISTINCT c.title
FROM TVProgram AS t
INNER JOIN Content AS c
    ON c.content_id = t.content_id
WHERE t.program_date >= '2020-06-01'
    AND t.program_date <= '2020-06-30'
    AND c.Kids_content = 'Y'
    AND c.content_type = 'Movies';