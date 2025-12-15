CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set N = N-1;
  RETURN (
      # Write your MySQL query statement below.
    select DISTINCT salary from Employee order by salary DESC limit 1 OFFSET N
  );
END