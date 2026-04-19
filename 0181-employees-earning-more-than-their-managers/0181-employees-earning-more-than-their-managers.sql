# Write your MySQL query statement below
select e.name as Employee from Employee e JOIN Employee m ON (m.id=e.managerId) where e.managerId is not null and e.salary > m.salary;