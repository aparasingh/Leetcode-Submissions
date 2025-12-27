# Write your MySQL query statement below
with first_half AS (
    select driver_id, AVG(distance_km/fuel_consumed) as avg_efficiency FROM trips where MONTH(trip_date) BETWEEN 1 and 6 group by driver_id),
second_half AS (
    select driver_id, AVG(distance_km/fuel_consumed) as avg_efficiency FROM trips where MONTH(trip_date) BETWEEN 7 and 12 group by driver_id
)
select fh.driver_id, d.driver_name, ROUND(fh.avg_efficiency,2) as first_half_avg, ROUND(sh.avg_efficiency,2) as second_half_avg, ROUND(sh.avg_efficiency - fh.avg_efficiency, 2) as efficiency_improvement from first_half fh JOIN second_half sh ON (fh.driver_id = sh.driver_id and fh.avg_efficiency < sh.avg_efficiency) JOIN drivers d on (fh.driver_id = d.driver_id) order by efficiency_improvement DESC, d.driver_name ASC;