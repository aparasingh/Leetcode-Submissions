# Write your MySQL query statement below
SELECT DISTINCT COALESCE(max(salary), NULL) as SecondHighestSalary FROM Employee WHERE salary < (SELECT MAX(salary) from Employee);