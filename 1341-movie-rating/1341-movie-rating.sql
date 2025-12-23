# Write your MySQL query statement below
(SELECT 
U.name as results
FROM
MovieRating MR JOIN Users U ON (MR.user_id = U.user_id) GROUP BY U.user_id ORDER BY COUNT(MR.rating) DESC, U.name ASC LIMIT 1)
UNION ALL
(SELECT
M.title as results
FROM
MovieRating MR JOIN Movies M ON (MR.movie_id = M.movie_id) where YEAR(MR.created_at) = '2020' and MONTH(MR.created_at) = '2' GROUP BY M.movie_id ORDER BY AVG(MR.rating) DESC, M.title ASC LIMIT 1);