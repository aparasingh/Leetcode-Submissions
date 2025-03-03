# Write your MySQL query statement below
SELECT *
FROM Cinema
WHERE description NOT LIKE 'boring' and id % 2 <> 0
ORDER BY rating DESC;