--@block
SELECT * 
FROM customers;

--@block
SELECT *
FROM orders;

--@block
USE db_sql_tutorial

--@block
SELECT * 
FROM CUSTOMERS;

--@block
SELECT * 
FROM orders;

--@block
SELECT
    first_name,
    country
FROM customers;

--@block
SELECT country
FROM customers;

--@block
SELECT DISTINCT
    country
FROM customers;

--@block
SELECT *
FROM customers
ORDER BY score ASC;

--@block
SELECT *
FROM customers
ORDER BY score DESC;

--@block
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

--@block
SELECT *
FROM customers
WHERE country = 'Germany';

--@block
SELECT *
FROM customers
WHERE score > 500;

--@block
SELECT *
FROM customers
WHERE score < 500;

--@block
SELECT *
FROM customers
WHERE score <= 500;

--@block
SELECT *
FROM customers
WHERE score >= 500;

--@block
SELECT *
FROM customers
WHERE country != 'Germany';

--@block
SELECT *
FROM customers
WHERE country <> 'Germany';

--@block
SELECT *
FROM customers
WHERE country = 'Germany' AND score < 400;

--@block
SELECT *
FROM customers
WHERE country = 'Germany' OR score < 400;

--@block
SELECT *
FROM customers
WHERE NOT score < 400;

--@block
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

--@block
SELECT *
FROM customers
WHERE score >= 100 AND score <=500;

--@block
SELECT *
FROM customers
WHERE customer_id in (1,2,5);

--@block
SELECT *
FROM customers
WHERE customer_id =1
OR customer_id = 2
OR customer_id = 5;

--@block
SELECT *
FROM customers
WHERE customer_id =1
OR customer_id = 2
OR customer_id = 5;

--@block
SELECT *
FROM customers
WHERE first_name LIKE 'M%'

--@block
SELECT *
FROM customers
WHERE first_name LIKE '%n'

--@block
SELECT *
FROM customers
WHERE first_name LIKE '%r%'

--@block
SELECT *
FROM customers
WHERE first_name LIKE '__r%'

--@block
SELECT 
    customers.customer_id
FROM customers;

--@block
SELECT 
    c.customer_id
FROM customers AS c;

--@block
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block
select * from customers;

--@block
select * from orders;

--@block
--FULL JOIN Workaround
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON  c.customer_id = o.customer_id
UNION
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block UNION ALL
SELECT
    first_name,
    last_name,
    country
FROM customers
UNION ALL
SELECT
    first_name,
    last_name,
    emp_country
FROM employees;

--@block UNION DISTINCT
SELECT
    first_name,
    last_name,
    country
FROM customers
UNION DISTINCT
SELECT
    first_name,
    last_name,
    emp_country
FROM employees;

--@block UNION DISTINCT
SELECT
    first_name,
    last_name,
    country
FROM customers
UNION
SELECT
    first_name,
    last_name,
    emp_country
FROM employees;

--@block UNION DISTINCT
SELECT
    first_name AS per_first_name,
    last_name AS per_last_name,
    country AS per_country
FROM customers
UNION
SELECT
    first_name,
    last_name,
    emp_country
FROM employees;

--@block check
SELECT 
    last_name,
    first_name,
    country
FROM(
    SELECT
        last_name,
        first_name,
        country
    FROM customers
UNION DISTINCT
    SELECT
        last_name,
        first_name, 
        emp_country
FROM employees
) results
ORDER BY last_name;

--@block COUNT
SELECT COUNT(score) AS total_customers
FROM customers

--@block SUM
SELECT SUM(quantity) 
FROM orders

--@block AVG
SELECT AVG(score) AS avg_score 
FROM customers;

--@block MAX
SELECT MAX(score) AS max_score 
FROM customers;

--@block MIN
SELECT MIN(score) AS min_score 
FROM customers;

--@block MIN Date
SELECT MIN(order_date) AS min_order_date
FROM orders;

--@block MAX Date
SELECT MAX(order_date) AS max_order_date
FROM orders;

--@block
SELECT
    CONCAT(first_name, ' ', last_name)
FROM customers;

--@block
SELECT
UPPER(first_name) AS upper_first_name,
LOWER(first_name) AS lower_first_name
FROM customers;

--@block TRIM
SELECT
TRIM(last_name) AS clean_last_name,
LENGTH(last_name) AS len_last_name,
LENGTH(TRIM(last_name)) AS clean_len_last_name
FROM customers;

--@block TRIM
SELECT
TRIM(last_name) AS clean_last_name,
LENGTH(last_name) AS len_last_name,
LENGTH(TRIM(last_name)) AS clean_len_last_name
FROM customers;

--@block
SELECT
last_name,
SUBSTRING(last_name, 2,3) AS sub_last_name
FROM customers;

--@block
SELECT 
    COUNT (*) AS total_customers,
    country
FROM customers
GROUP BY country;
