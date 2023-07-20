--@block show table
SELECT * 
FROM customers;

--@block show table
SELECT *
FROM orders;

--@block use database
USE db_sql_tutorial

--@block show table
SELECT * 
FROM CUSTOMERS;

--@block show table
SELECT * 
FROM orders;

--@block show particular columns in a table
SELECT
    first_name,
    country
FROM customers;

--@block show one column in a table
SELECT country
FROM customers;

--@block show one column in a table wo duplicates
SELECT DISTINCT
    country
FROM customers;

--@block show one table and sort it ascending
SELECT *
FROM customers
ORDER BY score ASC;

--@block show one table and sort it descenden
SELECT *
FROM customers
ORDER BY score DESC;

--@block sort by two columns
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

--@block filter one value, op =
SELECT *
FROM customers
WHERE country = 'Germany';

--@block filter one value, op >
SELECT *
FROM customers
WHERE score > 500;

--@block filter one value, op <
SELECT *
FROM customers
WHERE score < 500;

--@block filter one value, op <=
SELECT *
FROM customers
WHERE score <= 500;

--@block filter one value, op >=
SELECT *
FROM customers
WHERE score >= 500;

--@block filter one value, op !=
SELECT *
FROM customers
WHERE country != 'Germany';

--@block filter one value, op <>
SELECT *
FROM customers
WHERE country <> 'Germany';

--@block filter two values, op AND
SELECT *
FROM customers
WHERE country = 'Germany' AND score < 400;

--@block filter two values, op OR
SELECT *
FROM customers
WHERE country = 'Germany' OR score < 400;

--@block filter one value, op wher not
SELECT *
FROM customers
WHERE NOT score < 400;

--@block op between
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

--@block alternative between
SELECT *
FROM customers
WHERE score >= 100 AND score <=500;

--@block op in
SELECT *
FROM customers
WHERE customer_id in (1,2,5);

--@block filter by conditions
SELECT *
FROM customers
WHERE customer_id =1
OR customer_id = 2
OR customer_id = 5;

--@block op LIKE beginning with
SELECT *
FROM customers
WHERE first_name LIKE 'M%'

--@block op LIKE ending with
SELECT *
FROM customers
WHERE first_name LIKE '%n'

--@block op LIKE containint
SELECT *
FROM customers
WHERE first_name LIKE '%r%'

--@block op LIKE containing in specific place
SELECT *
FROM customers
WHERE first_name LIKE '__r%'

--@block show table appending database name
SELECT 
    customers.customer_id
FROM customers;

--@block show table using aliases
SELECT 
    c.customer_id
FROM customers AS c;

--@block inner join with aliases
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block left joint with aliases
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block right join with aliases
SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON  c.customer_id = o.customer_id;

--@block show table
select * from customers;

--@block show table
select * from orders;

--@block
--FULL JOIN Workaround for mysql with union
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

--@block check this one, same problem as with excel
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

--@block CONCAT function
SELECT
    CONCAT(first_name, ' ', last_name)
FROM customers;

--@block UPPer and LOWER functions
SELECT
UPPER(first_name) AS upper_first_name,
LOWER(first_name) AS lower_first_name
FROM customers;

--@block TRIM function
SELECT
TRIM(last_name) AS clean_last_name,
LENGTH(last_name) AS len_last_name,
LENGTH(TRIM(last_name)) AS clean_len_last_name
FROM customers;

--@block TRIM function
SELECT
TRIM(last_name) AS clean_last_name,
LENGTH(last_name) AS len_last_name,
LENGTH(TRIM(last_name)) AS clean_len_last_name
FROM customers;

--@block SUBSTRING function
SELECT
last_name,
SUBSTRING(last_name, 2,3) AS sub_last_name
FROM customers;

--@block COUNT function
SELECT 
    COUNT (*) AS total_customers,
    country
FROM customers
GROUP BY country;
