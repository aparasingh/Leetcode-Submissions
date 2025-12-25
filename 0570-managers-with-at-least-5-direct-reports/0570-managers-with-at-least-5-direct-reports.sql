# Write your MySQL query statement below
select M.name as name FROM Employee M JOIN Employee E ON (E.managerId = M.id) GROUP BY M.id having COUNT(E.id) >= 5; 