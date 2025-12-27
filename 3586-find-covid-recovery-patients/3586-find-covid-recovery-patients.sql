# Write your MySQL query statement below
select pa.patient_id, pa.patient_name, pa.age, datediff(min(n.test_date) , min(po.test_date)) as recovery_time
from covid_tests po
join covid_tests n 
on po.patient_id = n.patient_id 
and po.test_date < n.test_date 
and po.result = 'Positive'
and n.result = 'Negative'
join patients pa 
on po.patient_id = pa.patient_id
group by pa.patient_id, pa.patient_id, pa.age
order by recovery_time asc, pa.patient_name asc;