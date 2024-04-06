SELECT
    s.fullname,
    g.grade,
    g.date_received
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects subj ON g.subject_id = subj.id
WHERE s.group_id = 1
    AND subj.id = 1;