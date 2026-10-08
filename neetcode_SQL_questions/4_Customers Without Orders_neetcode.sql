-- Write your query below
-- neetcode answer
SELECT name
FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);
