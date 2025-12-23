# Write your MySQL query statement below
(SELECT 
U.name as results
FROM
MovieRating MR JOIN Users U ON (MR.user_id = U.user_id) GROUP BY U.user_id ORDER BY COUNT(MR.rating) DESC, U.name ASC LIMIT 1)
UNION ALL
(SELECT
M.title as results
FROM
MovieRating MR JOIN Movies M ON (MR.movie_id = M.movie_id) where MR.created_at BETWEEN '2020-02-01' and '2020-02-29' GROUP BY M.movie_id ORDER BY AVG(MR.rating) DESC, M.title ASC LIMIT 1);