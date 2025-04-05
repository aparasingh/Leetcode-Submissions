# Write your MySQL query statement below
SELECT *
FROM Users 
WHERE mail LIKE '%leetcode.com' and (mail REGEXP '^[A-Za-z][A-Za-z0-9_./-]+@leetcode\.com' OR mail REGEXP '^[A-Za-z]+@leetcode\.com');