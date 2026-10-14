-- -- Write your PostgreSQL query statement below
select a.id from weather a
join weather b
on a.recordDate = b.recordDate+1
where a.temperature > b.temperature 
