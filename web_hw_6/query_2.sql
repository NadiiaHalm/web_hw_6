SELECT
    s.id,
    s.fullname ,
    AVG(g.grade) AS overall_average_grade
FROM grades g
JOIN students s  ON s.id = g.student_id
WHERE g.subject_id = 1
GROUP BY
    s.id,
    s.fullname
ORDER BY overall_average_grade DESC
LIMIT 1;