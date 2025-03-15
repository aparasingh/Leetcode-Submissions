# Write your MySQL query statement below
SELECT m.employee_id as employee_id, m.name, COUNT(r.employee_id) as reports_count, ROUND(AVG(r.age),0) as average_age
FROM Employees m
JOIN Employees r ON (m.employee_id = r.reports_to)
group by m.employee_id
ORDER BY m.employee_id asc;