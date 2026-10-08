-- Write your query below

-- For each row in expressions, the join looks for the row in variables whose name matches that row's left_operand (or right_operand), and attaches the matching value — done independently, per row.
-- for example i join on variables.name =expressions.leftoperand,  so all the common value, it will get connected to the value of variables, i.e. for all a, they will connect to 10 and same for all b 25.
-- as there are two variables (a and b) so we have to use join two times with different alias. 

select e.left_operand,e.operator,e.right_operand,
case 
when operator ='>' and v1.value>v2.value then 'true'
when operator ='<' and v1.value<v2.value then 'true'
when operator ='=' and v1.value=v2.value then 'true' 
else 'false'
end as value
from expressions as e
join variables as v1 on v1.name = e.left_operand
join variables as v2 on v2.name = e.right_operand
