-- -- Write your query below
-- if i use full join and if i encounter a case where there is extra user in rides table , but that user is not present in users(1st table), then it will show "null : (distance traveled)",  so i have to use left join  , take only those users present in users table and only use them to refer to table rides

select u.name, COALESCE(sum(r.distance),0) as travelled_distance from users as u
left join rides as r
on u.id=r.user_id
group by u.name
order by travelled_distance DESC,u.name

