-- Write your PostgreSQL query statement below
select u.unique_id,e.name from employees e
left join employeeuni u
on u.id=e.id
order by u.unique_id
