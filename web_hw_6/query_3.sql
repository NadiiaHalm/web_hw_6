SELECT
    g.id,
    g.name,
    ROUND(AVG(grade), 2) AS average_grade
FROM students s
JOIN groups g ON s.group_id = g.id
JOIN grades gr ON s.id = gr.student_id
WHERE gr.subject_id = 1
GROUP BY
    g.id,
    g.name;