# Write your MySQL query statement below
WITH high_hours AS (
    select 
employee_id,
SUM(duration_hours) as total_hours
from meetings group by employee_id, yearweek(meeting_date,1) having total_hours > 20
)
select e.employee_id, e.employee_name, e.department, COUNT(h.total_hours) as meeting_heavy_weeks FROM high_hours h JOIN employees e ON (h.employee_id = e.employee_id) group by e.employee_id having meeting_heavy_weeks >= 2 ORDER BY meeting_heavy_weeks DESC, e.employee_name ASC;