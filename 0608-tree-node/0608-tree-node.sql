# Write your MySQL query statement belowE
 SELECT T.id, IF(T.p_id is null, 'Root', if(N.p_id is null, 'Leaf', 'Inner')) as type FROM Tree T LEFT JOIN Tree N ON (T.id = N.p_id) GROUP BY T.id;