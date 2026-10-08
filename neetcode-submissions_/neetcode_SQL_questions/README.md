# SQL Practice Questions Collection

---
---
---

# Question 1. Calculate Special Bonus
**Difficulty:** Easy

You are given an `employees` table containing employee information.

### Table Schema: `employees`
| Column Name | Type |
| :--- | :--- |
| `employee_id` | int |
| `name` | varchar |
| `salary` | int |

`employee_id` is the primary key (column with unique values) for this table. Each row contains the employee's ID, name, and salary.

### Problem Description
Write a query to calculate the bonus for each employee. An employee receives a bonus equal to 100% of their salary if:
1. Their `employee_id` is an odd number, **AND**
2. Their `name` does not start with the letter `'M'`.

Otherwise, the bonus is `0`.

Return the `employee_id` and `bonus` for each employee, ordered by `employee_id`.

### Example 1
**Input:**

`employees` table:
| employee_id | name | salary |
| :--- | :--- | :--- |
| 1 | John | 5000 |
| 2 | Sarah | 4000 |
| 3 | Mark | 6000 |
| 4 | Emily | 4500 |
| 5 | David | 5500 |

**Output:**
| employee_id | bonus |
| :--- | :--- |
| 1 | 5000 |
| 2 | 0 |
| 3 | 0 |
| 4 | 0 |
| 5 | 5500 |

**Explanation:**
* **Employee 1 (John):** ID is odd and name doesn't start with 'M' $\rightarrow$ bonus = 5000
* **Employee 2 (Sarah):** ID is even $\rightarrow$ bonus = 0
* **Employee 3 (Mark):** ID is odd but name starts with 'M' $\rightarrow$ bonus = 0
* **Employee 4 (Emily):** ID is even $\rightarrow$ bonus = 0
* **Employee 5 (David):** ID is odd and name doesn't start with 'M' $\rightarrow$ bonus = 5500

### Constraints
* Each employee has a unique ID.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 2. Combine Two Tables
**Difficulty:** Easy

Given two tables, `person` and `address`, write a query that combines information from both.

### Table Schema: `person`
| Column Name | Type |
| :--- | :--- |
| `person_id` | int |
| `last_name` | varchar |
| `first_name` | varchar |

`person_id` is the primary key. This table stores each person's ID along with their first and last name.

### Table Schema: `address`
| Column Name | Type |
| :--- | :--- |
| `address_id` | int |
| `person_id` | int |
| `city` | varchar |
| `state` | varchar |

`address_id` is the primary key. Each row links a person (via `person_id`) to their city and state.

### Problem Description
Write a SQL query that returns the `first_name`, `last_name`, `city`, and `state` for every person. If a person has no matching address record, return `NULL` for both `city` and `state`.

The result can be returned in any order.

### Example 1
**Input:**

`person` table:
| person_id | last_name | first_name |
| :--- | :--- | :--- |
| 1 | Smith | John |
| 2 | Johnson | Emma |

`address` table:
| address_id | person_id | city | state |
| :--- | :--- | :--- | :--- |
| 1 | 2 | Los Angeles | California |
| 2 | 3 | Chicago | Illinois |

**Output:**
| first_name | last_name | city | state |
| :--- | :--- | :--- | :--- |
| John | Smith | NULL | NULL |
| Emma | Johnson | Los Angeles | California |

**Explanation:**
* John Smith (`person_id = 1`) has no address on file, so `city` and `state` are `NULL`.
* Emma Johnson (`person_id = 2`) lives in Los Angeles, California.
* The address record for `person_id = 3` has no matching person, so it does not appear in the output.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 3. Customers Who Bought A and B but Not C
**Difficulty:** Medium

You are given two tables: `customers` and `orders`.

### Table Schema: `customers`
| Column Name | Type |
| :--- | :--- |
| `customer_id` | int |
| `customer_name` | varchar |

`customer_id` is the primary key for this table. Each row contains a customer's ID and name.

### Table Schema: `orders`
| Column Name | Type |
| :--- | :--- |
| `order_id` | int |
| `customer_id` | int |
| `product_name` | varchar |

`order_id` is the primary key for this table. `customer_id` references the `customers` table. Each row represents an order placed by a customer for a specific product.

### Problem Description
Write a query to find customers who purchased both products `'A'` and `'B'` but have never purchased product `'C'`. These are potential customers to target for product C recommendations.

Return the `customer_id` and `customer_name` of these customers, ordered by `customer_name`.

### Example 1
**Input:**

`customers` table:
| customer_id | customer_name |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |
| 3 | Carol |
| 4 | Dave |

`orders` table:
| order_id | customer_id | product_name |
| :--- | :--- | :--- |
| 101 | 1 | A |
| 102 | 1 | B |
| 103 | 1 | D |
| 104 | 1 | C |
| 105 | 2 | A |
| 106 | 3 | A |
| 107 | 3 | B |
| 108 | 3 | D |
| 109 | 4 | C |

**Output:**
| customer_id | customer_name |
| :--- | :--- |
| 3 | Carol |

**Explanation:**
* **Alice (ID 1):** Bought A and B, but also bought C $\rightarrow$ excluded
* **Bob (ID 2):** Only bought A (missing B) $\rightarrow$ excluded
* **Carol (ID 3):** Bought A and B, never bought C $\rightarrow$ included
* **Dave (ID 4):** Only bought C (missing A and B) $\rightarrow$ excluded

### Constraints
* Each customer has a unique ID.
* A customer can purchase the same product multiple times.

### Test Case
**Input:**

`customers` table:
| customer_id | customer_name |
| :--- | :--- |
| 100 | Zara |
| 25 | Leo |
| 75 | Mia |
| 50 | Nate |

`orders` table:
| order_id | customer_id | product_name |
| :--- | :--- | :--- |
| 1 | 100 | A |
| 2 | 100 | A |
| 3 | 100 | A |
| 4 | 100 | B |
| 5 | 100 | B |
| 6 | 100 | D |
| 7 | 100 | E |
| 8 | 25 | A |
| 9 | 25 | B |
| 10 | 25 | C |
| 11 | 75 | B |
| 12 | 75 | B |
| 13 | 75 | B |
| 14 | 75 | A |
| 15 | 50 | A |
| 16 | 50 | D |

**Output:**
| customer_id | customer_name |
| :--- | :--- |
| 75 | Mia |
| 100 | Zara |

**Explanation:**
* **Zara (ID 100):** Bought A and B, never bought C $\rightarrow$ included
* **Leo (ID 25):** Bought A and B, but also bought C $\rightarrow$ excluded
* **Mia (ID 75):** Bought A and B, never bought C $\rightarrow$ included
* **Nate (ID 50):** Bought A and D, missing B $\rightarrow$ excluded

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 4. Customers Without Orders
**Difficulty:** Easy

You are given two tables: `customers` and `orders`.

### Table Schema: `customers`
| Column Name | Type |
| :--- | :--- |
| `id` | int |
| `name` | varchar |

`id` is the primary key for this table. Each row contains the ID and name of a customer.

### Table Schema: `orders`
| Column Name | Type |
| :--- | :--- |
| `id` | int |
| `customer_id` | int |

`id` is the primary key for this table. `customer_id` references the `id` from the `customers` table. Each row contains the ID of an order and the ID of the customer who placed it.

### Problem Description
Write a query to find all customers who have never placed an order. Return the customer names. The result can be returned in any order.

### Example 1
**Input:**

`customers` table:
| id | name |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |
| 4 | Diana |

`orders` table:
| id | customer_id |
| :--- | :--- |
| 101 | 3 |
| 102 | 1 |

**Output:**
| name |
| :--- |
| Bob |
| Diana |

**Explanation:**
Bob and Diana have never placed an order. Alice and Charlie have orders in the `orders` table.

### Constraints
* Each customer has a unique ID.
* Each order references a valid customer.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 5. Customers With Positive Revenue
**Difficulty:** Easy

You are given a table `customers` which tracks customer revenue across different years.

### Table Schema: `customers`
| Column Name | Type |
| :--- | :--- |
| `customer_id` | int |
| `year` | int |
| `revenue` | int |

`(customer_id, year)` is the primary key for this table. The revenue can be positive, negative, or zero.

### Problem Description
Write a query to find all customers who had positive revenue in the year 2020. Return only the `customer_id` column. The result can be returned in any order.

### Example 1
**Input:**

`customers` table:
| customer_id | year | revenue |
| :--- | :--- | :--- |
| 1 | 2019 | 100 |
| 1 | 2020 | 50 |
| 2 | 2020 | -30 |
| 3 | 2019 | 80 |
| 3 | 2020 | 25 |
| 4 | 2020 | 0 |

**Output:**
| customer_id |
| :--- |
| 1 |
| 3 |

**Explanation:**
Customers 1 and 3 had positive revenue in 2020. Customer 2 had negative revenue, and customer 4 had zero revenue.

### Constraints
* Each customer has at most one revenue entry per year.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 6. Highest Grade For Each Student
**Difficulty:** Medium

You are given an `exam_results` table containing student exam scores.

### Table Schema: `exam_results`
| Column Name | Type |
| :--- | :--- |
| `student_id` | int |
| `exam_id` | int |
| `score` | int |

`(student_id, exam_id)` is the primary key (combination of columns with unique values) for this table. Each row represents a student's score on a particular exam. The `score` column is never `NULL`.

### Problem Description
Write a query to find each student's highest score along with the corresponding `exam_id`. If a student has the same highest score on multiple exams, return the one with the smallest `exam_id`.

Return the `student_id`, `exam_id`, and `score`, ordered by `student_id` in ascending order.

### Example 1
**Input:**

`exam_results` table:
| student_id | exam_id | score |
| :--- | :--- | :--- |
| 1 | 101 | 85 |
| 1 | 102 | 92 |
| 2 | 101 | 88 |
| 2 | 102 | 88 |
| 3 | 101 | 70 |
| 3 | 102 | 65 |
| 3 | 103 | 78 |

**Output:**
| student_id | exam_id | score |
| :--- | :--- | :--- |
| 1 | 102 | 92 |
| 2 | 101 | 88 |
| 3 | 103 | 78 |

**Explanation:**
* **Student 1:** Highest score is 92 on exam 102.
* **Student 2:** Both exams have score 88, so we pick exam 101 (smallest `exam_id`).
* **Student 3:** Highest score is 78 on exam 103.

### Constraints
* Each `(student_id, exam_id)` combination is unique.
* `score` is always a non-null integer.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 7. Sales Person
**Difficulty:** Easy

Given three tables containing information about sales representatives, companies, and orders, write a query to find salespeople who have never made sales to a specific company.

### Table Schema: `sales_person`
| Column Name | Type |
| :--- | :--- |
| `sales_id` | int |
| `name` | varchar |
| `salary` | int |
| `commission_rate` | int |
| `hire_date` | date |

`sales_id` is the primary key. Each row contains information about a salesperson including their name, salary, commission rate, and when they were hired.

### Table Schema: `company`
| Column Name | Type |
| :--- | :--- |
| `com_id` | int |
| `name` | varchar |
| `city` | varchar |

`com_id` is the primary key. Each row contains the company's ID, name, and the city where it is located.

### Table Schema: `orders`
| Column Name | Type |
| :--- | :--- |
| `order_id` | int |
| `order_date` | date |
| `com_id` | int |
| `sales_id` | int |
| `amount` | int |

`order_id` is the primary key. The `com_id` column references the `company` table, and `sales_id` references the `sales_person` table. Each row represents an order with the company, salesperson, date, and amount.

### Problem Description
Write a SQL query to find the names of all salespeople who have not made any orders with the company named **"CRIMSON"**.

Return the result in any order.

### Example 1
**Input:**

`sales_person` table:
| sales_id | name | salary | commission_rate | hire_date |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Alice | 95000 | 8 | 2018-03-15 |
| 2 | Bob | 45000 | 12 | 2019-07-22 |
| 3 | Carol | 72000 | 10 | 2017-11-01 |
| 4 | Dave | 38000 | 15 | 2020-02-14 |
| 5 | Eve | 52000 | 6 | 2016-09-30 |

`company` table:
| com_id | name | city |
| :--- | :--- | :--- |
| 1 | CRIMSON | Seattle |
| 2 | AZURE | Portland |
| 3 | GOLDEN | Denver |
| 4 | EMERALD | Chicago |

`orders` table:
| order_id | order_date | com_id | sales_id | amount |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 2021-01-10 | 3 | 4 | 15000 |
| 2 | 2021-02-20 | 4 | 5 | 8000 |
| 3 | 2021-03-05 | 1 | 1 | 62000 |
| 4 | 2021-04-18 | 1 | 4 | 31000 |

**Output:**
| name |
| :--- |
| Bob |
| Carol |
| Eve |

**Explanation:**
* Alice (`sales_id = 1`) has an order with CRIMSON (order 3), so she is excluded.
* Dave (`sales_id = 4`) has an order with CRIMSON (order 4), so he is excluded.
* Bob, Carol, and Eve have no orders with CRIMSON, so they appear in the result.

### Test Case
**Input:**

`sales_person` table:
| sales_id | name | salary | commission_rate | hire_date |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Alice | 50000 | 10 | 2020-01-01 |
| 2 | Bob | 50000 | 10 | 2020-01-01 |

`company` table:
| com_id | name | city |
| :--- | :--- | :--- |
| 1 | AZURE | Seattle |
| 7 | CRIMSON | Portland |

`orders` table:
| order_id | order_date | com_id | sales_id | amount |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 2021-01-01 | 1 | 1 | 1000 |
| 2 | 2021-01-02 | 7 | 2 | 1000 |

**Output:**
| name |
| :--- |
| Alice |

**Explanation:**
* Alice's only order is with AZURE, not CRIMSON, so she is included.
* Bob has an order with CRIMSON (`com_id = 7`), so he is excluded.
* CRIMSON's `com_id` is 7 here, not 1, so make sure your query looks up the company by name rather than hardcoding an ID.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 8. Sellers With No Sales
**Difficulty:** Easy

You are given three tables: `customer`, `orders`, and `seller`.

### Table Schema: `customer`
| Column Name | Type |
| :--- | :--- |
| `customer_id` | int |
| `customer_name` | varchar |

`customer_id` is the primary key. Each row contains information about a customer in the store.

### Table Schema: `orders`
| Column Name | Type |
| :--- | :--- |
| `order_id` | int |
| `sale_date` | date |
| `order_cost` | int |
| `customer_id` | int |
| `seller_id` | int |

`order_id` is the primary key. Each row represents a transaction between a customer and a seller on a given date.

### Table Schema: `seller`
| Column Name | Type |
| :--- | :--- |
| `seller_id` | int |
| `seller_name` | varchar |

`seller_id` is the primary key. Each row contains information about a seller.

### Problem Description
Write a query to find the names of all sellers who did not make any sales in the year **2020**.

Return the result ordered by `seller_name` in ascending order.

### Example 1
**Input:**

`customer` table:
| customer_id | customer_name |
| :--- | :--- |
| 101 | Sarah |
| 102 | Michael |
| 103 | David |

`orders` table:
| order_id | sale_date | order_cost | customer_id | seller_id |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 2020-03-15 | 1200 | 101 | 1 |
| 2 | 2020-06-20 | 1800 | 102 | 2 |
| 3 | 2019-04-10 | 950 | 101 | 3 |
| 4 | 2020-11-05 | 750 | 103 | 2 |
| 5 | 2019-01-22 | 600 | 101 | 2 |

`seller` table:
| seller_id | seller_name |
| :--- | :--- |
| 1 | James |
| 2 | Maria |
| 3 | Robert |

**Output:**
| seller_name |
| :--- |
| Robert |

**Explanation:**
* James made 1 sale in March 2020.
* Maria made 2 sales in 2020 and 1 sale in 2019.
* Robert made 1 sale in 2019 but no sales in 2020.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 9. Top Travellers
**Difficulty:** Easy

Given two tables, `users` and `rides`, write a query to calculate the total distance traveled by each user.

### Table Schema: `users`
| Column Name | Type |
| :--- | :--- |
| `id` | int |
| `name` | varchar |

`id` is the primary key. This table contains user information including their unique ID and name.

### Table Schema: `rides`
| Column Name | Type |
| :--- | :--- |
| `id` | int |
| `user_id` | int |
| `distance` | int |

`id` is the primary key. Each row represents a trip where `user_id` indicates who took the trip and `distance` is how far they traveled.

### Problem Description
Write a SQL query that reports the total distance each user has traveled. Return the results sorted by `travelled_distance` in descending order. If multiple users have the same total distance, sort them by `name` in ascending order.

### Example 1
**Input:**

`users` table:
| id | name |
| :--- | :--- |
| 1 | Maria |
| 2 | Carlos |
| 3 | Priya |
| 4 | James |

`rides` table:
| id | user_id | distance |
| :--- | :--- | :--- |
| 1 | 1 | 150 |
| 2 | 2 | 280 |
| 3 | 3 | 195 |
| 4 | 1 | 130 |
| 5 | 2 | 95 |

**Output:**
| name | travelled_distance |
| :--- | :--- |
| Carlos | 375 |
| Maria | 280 |
| Priya | 195 |
| James | 0 |

**Explanation:**
* Carlos has two trips totaling 375 miles (280 + 95).
* Maria has two trips totaling 280 miles (150 + 130).
* Priya has one trip of 195 miles.
* James has no rides recorded, so their traveled distance is 0.

### Test Case
**Input:**

`users` table:
| id | name |
| :--- | :--- |
| 10 | Ryan |
| 20 | Chloe |
| 30 | Max |

`rides` table:
| id | user_id | distance |
| :--- | :--- | :--- |
| 1 | 10 | 400 |
| 2 | 20 | 600 |
| 3 | 99 | 1000 |

**Output:**
| name | travelled_distance |
| :--- | :--- |
| Chloe | 600 |
| Ryan | 400 |
| Max | 0 |

**Explanation:**
* Chloe has one trip of 600.
* Ryan has one trip of 400.
* Max has no rides, so the distance is 0.
* The ride for `user_id = 99` has no matching user, so it does not appear in the output.

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ NEXT QUESTION ❖
════════════════════════════════════════════════════════════════════════════════

<br/>

# Question 10. Evaluate Boolean Expression
**Difficulty:** Medium

You are given two tables: `variables`, which stores variable names and their integer values, and `expressions`, which contains boolean expressions to evaluate.

### Table Schema: `variables`
| Column Name | Type |
| :--- | :--- |
| `name` | varchar |
| `value` | int |

`name` is the primary key. Each row contains a variable name and its corresponding integer value.

### Table Schema: `expressions`
| Column Name | Type |
| :--- | :--- |
| `left_operand` | varchar |
| `operator` | enum |
| `right_operand` | varchar |

The combination of `(left_operand, operator, right_operand)` forms the primary key. The `operator` column can be one of: `<`, `>`, or `=`. Both `left_operand` and `right_operand` reference variable names from the `variables` table.

### Problem Description
Write a query to evaluate each boolean expression and return the result as `'true'` or `'false'`.

The result can be returned in any order.

### Example 1
**Input:**

`variables` table:
| name | value |
| :--- | :--- |
| a | 10 |
| b | 25 |

`expressions` table:
| left_operand | operator | right_operand |
| :--- | :---: | :--- |
| a | > | b |
| a | < | b |
| a | = | b |
| b | > | a |
| a | = | a |

**Output:**
| left_operand | operator | right_operand | value |
| :--- | :---: | :--- | :--- |
| a | > | b | false |
| a | < | b | true |
| a | = | b | false |
| b | > | a | true |
| a | = | a | true |

**Explanation:**
* $a > b \implies 10 > 25$ is `false`
* $a < b \implies 10 < 25$ is `true`
* $a = b \implies 10 = 25$ is `false`
* $b > a \implies 25 > 10$ is `true`
* $a = a \implies 10 = 10$ is `true`

<br/>

════════════════════════════════════════════════════════════════════════════════
# ❖ END OF QUESTIONS ❖
════════════════════════════════════════════════════════════════════════════════