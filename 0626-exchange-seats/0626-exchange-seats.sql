# Write your MySQL query statement below
SELECT id, student
FROM (SELECT o.id, IF(ISNULL(e.student), o.student, e.student) as student
FROM Seat o
LEFT JOIN Seat e ON (o.id = e.id-1 and e.id % 2 = 0)
WHERE  o.id % 2 <>0
UNION
SELECT e.id, o.student
FROM Seat e
JOIN Seat o ON (e.id = o.id+1)
WHERE e.id % 2 = 0 and o.id % 2 <> 0) a
ORDER BY a.id
