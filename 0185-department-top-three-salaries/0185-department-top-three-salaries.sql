# Write your MySQL query statement below
WITH salary_by_department as (
    select departmentId, salary FROM Employee group by departmentId,salary ORDER by departmentId asc,salary DESC
),
salary_ranked as (
    select *,
    ROW_NUMBER() OVER (PARTITION BY departmentid order by salary DESC) as rnk from salary_by_department
)
select d.name as Department, e.name as Employee, e.salary as Salary from Employee e join salary_ranked r on (e.departmentId = r.departmentId and r.salary = e.salary) JOIN Department d on (d.id=e.departmentId) where r.rnk IN (1,2,3)