# Write your MySQL query statement below
SELECT x, y, z, IF(x+y>z and x+z>y and y+z>x, 'Yes','No') as triangle
FROM Triangle;
