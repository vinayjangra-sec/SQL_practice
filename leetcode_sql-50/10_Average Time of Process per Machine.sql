-- Write your PostgreSQL query statement below
select A.machine_id, round((A.end - A.start)::numeric, 3) as processing_time from 
(select machine_id, avg(timestamp) filter (where activity_type = 'start') as start,avg(timestamp) filter (where activity_type = 'end')as end from activity
group by machine_id
) as A
