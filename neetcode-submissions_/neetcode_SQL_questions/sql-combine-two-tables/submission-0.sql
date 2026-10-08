-- Write your query below
select p.first_name,p.Last_name,a.city,a.state from person as p
full join address as a
on a.person_id=p.person_id
where p.first_name is not NULL or p.Last_name is not NULL