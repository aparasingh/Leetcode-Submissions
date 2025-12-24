# Write your MySQL query statement below
select
*,
if(dna_sequence LIKE 'ATG%', 1, 0) as has_start,
if(dna_sequence REGEXP '(^|)TAA$|TAG$|TGA$', 1, 0) as has_stop, 
if(dna_sequence LIKE '%ATAT%', 1, 0) as has_atat,
if(dna_sequence LIKE '%GGG%', 1, 0) as has_ggg
FROM Samples order by sample_id ASC;
