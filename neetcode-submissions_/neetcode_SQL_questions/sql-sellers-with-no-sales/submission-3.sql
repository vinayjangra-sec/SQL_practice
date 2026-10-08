-- MIN of a set of 0s-and-1s is 0 if any value is 0, and 1 only if every value is 1
-- i placed 0, if in the year 2020, otherwise 1.
-- i also have to think of this test case :"zero sales in 2020" is trivially true for someone who has zero sales, period.
SELECT s.seller_name from seller as s
full join orders as o
on o.seller_id = s.seller_id
group by s.seller_id
HAVING
min(CASE WHEN o.sale_date between '2020-01-01' and '2020-12-31' THEN 0 ELSE 1 END) = 1 
order by s.seller_name