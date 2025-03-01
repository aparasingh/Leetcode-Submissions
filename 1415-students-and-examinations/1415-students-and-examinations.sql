# Write your MySQL query statement below
SELECT s.student_id, s.student_name, b.subject_name, COUNT(e.student_id) as attended_exams
FROM Students s
JOIN Subjects b 
LEFT JOIN Examinations e ON (s.student_id = e.student_id and b.subject_name = e.subject_name)
GROUP BY s.student_id, b.subject_name
ORDER BY s.student_id, b.subject_name ASC;