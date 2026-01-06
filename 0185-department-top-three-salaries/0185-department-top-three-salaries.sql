# Write your MySQL query statement below
WITH salary_ranked as (
    select DISTINCT departmentId, salary, DENSE_RANK() OVER (PARTITION BY departmentid order by salary DESC) as rnk FROM Employee
)
select d.name as Department, e.name as Employee, e.salary as Salary from Employee e join salary_ranked r on (e.departmentId = r.departmentId and r.salary = e.salary) JOIN Department d on (d.id=e.departmentId) where r.rnk <= 3;