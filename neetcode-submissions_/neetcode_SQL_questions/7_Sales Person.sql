-- Write your query below
-- for not even one 'specific value', but i want all other, i can just make a list of that specific value and put it in my main query with "not in" or in simple words "except" these values.
select name from sales_person 
where sales_id not in 
(
select sales_id from orders where com_id = (select com_id from company where name like 'CRIMSON')
)
order by name