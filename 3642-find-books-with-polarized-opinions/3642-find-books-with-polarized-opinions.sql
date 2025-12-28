# Write your MySQL query statement below
select b.*, 
MAX(r.session_rating) - MIN(r.session_rating) as rating_spread, 
ROUND(SUM(case when r.session_rating <= 2 OR r.session_rating >= 4 THEN 1 ELSE 0 END)/COUNT(r.session_id),2) as polarization_score from reading_sessions r JOIN books b ON (b.book_id = r.book_id) group by r.book_id having COUNT(r.session_id) >=5 and polarization_score >= 0.6 and MIN(r.session_rating) <= 2 and MAX(r.session_rating) >= 4 ORDER BY polarization_score DESC, b.title DESC