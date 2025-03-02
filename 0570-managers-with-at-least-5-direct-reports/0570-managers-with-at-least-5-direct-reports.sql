# Write your MySQL query statement below
SELECT m.name
FROM
(SELECT m.name, COUNT(e.managerId) as count
FROM Employee m
JOIN Employee e
ON (m.id = e.managerId)
GROUP BY e.managerId) m
WHERE m.count >= 5;