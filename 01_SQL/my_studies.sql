-- --------------- SELECT STATEMENT ----------------

SELECT * 
FROM customers;

SELECT 
    first_name, last_name, points
FROM
    customers;

-- --------ORDER BY CLAUSE ---------
SELECT 
    first_name, last_name, points
FROM
    customers
ORDER BY points DESC

-- -------WHERE CLAUSE -----------

SELECT 
    first_name, last_name, points, birth_date
FROM
    customers
WHERE
    birth_date > '1990-01-01'
ORDER BY points DESC

-- ----- OPERATIONS WITH SELECT STATEMENT --------
SELECT 
    first_name, last_name, points, points + 10
FROM
    customers
    
-- -------------- ALIAS ----------------

SELECT 
    first_name,
    last_name,
    points,
    points + 10 AS operations
FROM
    customers
    
SELECT 
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS price,
    ROUND((quantity * unit_price) - (quantity * unit_price)*0.05, 2) AS discount
FROM
    order_items

-- ----- EXERCISE 1:
-- Write an SQL query to return:
-- 1. all the products in the database
-- 2. name
-- 3. unit price
-- 2. discounted price of 5%

SELECT 
    product_id,
    name AS  product_name,
    unit_price,
    ROUND(((unit_price) - (unit_price) * 0.05), 2) AS discount_price
FROM
    sql_store.products
    
-- ----- the DISTINCT keyword ------

SELECT 
	DISTINCT state
FROM
    sql_store.customers
    
-- ------- WHERE clause in details -------
SELECT 
    *
FROM
    sql_store.customers
WHERE
	birth_date > '1990-01-01'
    
-- EXERCISE 2:

-- Write an SQL query to return the orders that were made before 2019

SELECT 
    *
FROM
    sql_store.orders
WHERE
    order_date < '2019-01-01'
    
    
-- ------------- AND, OR, and NOT operators --------------------

SELECT 
    *
FROM
    customers
WHERE
	birth_date < '1990-01-01' AND
    city = 'Chicago'
    
SELECT 
    *
FROM
    customers
WHERE
    points > 1000 AND
	birth_date < '1990-01-01' OR
    city = 'Chicago' 
 
SELECT 
    *
FROM
    customers
WHERE
	birth_date <= '1990-01-01' AND
    points < 500
 
SELECT 
    *
FROM
    customers
WHERE NOT
	(birth_date <= '1990-01-01' AND
    points < 500)

-- Exercise 3

-- From the order_items table, get the items:
-- for order number 6
-- where the total price is greater than $20
-- and display the unit price

SELECT 
    *
FROM
    sql_store.order_items
WHERE
    order_id = 6 AND
    (quantity * unit_price) > 20

-- ----------the BETWEEN operator-------------------

SELECT 
    *
FROM
    customers
WHERE
    points >= 1000 AND points <= 3000

-- or

SELECT 
    *
FROM
    customers
WHERE
    points BETWEEN 1000 AND 3000
    
-- Exercise 5:
-- Return customers born between 1/1/1990 and 1/1/2000

SELECT
	*
FROM
	sql_store.customers
WHERE
	birth_date BETWEEN '1990-01-01' AND '2000-01-01'	
    
-- ------------the LIKE operator-------------

SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE 'B%' -- starts with b
    
SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE 'Brush%' -- starts with Brush
    

SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '%y' -- ends with B
    
SELECT 
    *
FROM
    customers
WHERE
    phone LIKE '7%' -- starts with 7
    
SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '%b%' -- contains b either the start or at the end


SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '%b_______' -- starts with b and there are only 8 characters
    

 SELECT 
    *
FROM
    customers
WHERE
    last_name LIKE '%b______y'  -- starts with b and ends with y containing 8 characters 
    
-- Exercise 6

-- Get the customers whose:

-- 1. addresses contain TRAIL or AVENUE
SELECT 
	*
FROM 
	customers
WHERE
	address LIKE '%Trail%' OR
    address LIKE '%Avenue%' 

-- 2. phone numbers end with 9
SELECT 
	*
FROM 
	customers
WHERE
    phone LIKE '%9' 
    
-- REGEXP: Regular Expression

SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'b'

SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP '^b'  -- starts with b
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'y$' -- have y in their last name
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'y|s' -- contains either y or s in their last names
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'brus|mac|se'-- contains either brus or mac or se in their last names
    
-- e in their last name, before 'e' ge, se, ie

SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP '[gsi]e'
    
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'e[gsi]'
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP '[g-m]e' -- any letter between g or m
    
-- ^ to indicatebegining of string 
-- $ to indicate the end of a string
-- | to indicate the logical 'or'
-- [a, d, b] to indicate combination of characters/strings before or after a letter
-- [a-i] to indicate the combination of characters/strings before or after a letter

-- Exercise 7

-- Get the customer whose
	-- first name are ELKA or AMBUR
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'ELKA|AMBUR'
    
    -- last names ends with EY or ON
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'EY$|ON$'
    
    -- last names starts with MY or contains SE
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP '^MY|SE'
    
    -- last names contain B followed by R or U
    
SELECT 
    *
FROM
    customers
WHERE
    last_name REGEXP 'B[R, U]'
    
-- IS NULL & IS NOT NULL operators

-- IS NULL

SELECT 
    *
FROM
    customers
WHERE
    phone IS NULL
    
-- IS NOT NULL

SELECT 
    *
FROM
    customers
WHERE
    phone IS NOT NULL
    
-- Exercise 8
	-- get all the orders that are not shipped

SELECT 
    *
FROM
    sql_store.orders
WHERE
    shipped_date IS NULL
    
-- ORDER BY Clause

SELECT 
    *
FROM
    customers
ORDER BY first_name DESC

-- 

SELECT 
    *
FROM
    customers
ORDER BY points DESC

-- 

SELECT 
    *
FROM
    customers
ORDER BY state , first_name

--

SELECT 
    first_name, state, last_name
FROM
    customers
ORDER BY 1, 2

-- the LIMIT clause

SELECT 
    *
FROM
    customers
ORDER BY points DESC
LIMIT 5

-- skipp the first 5 items and select the first 3

SELECT *
FROM customers
LIMIT 5, 5

-- Exercise 9
	-- get the top 3 loyal customers

SELECT 
    *
FROM
    customers
ORDER BY points DESC
LIMIT 3

-- ---------JOINS------------

SELECT 
    *
FROM
    orders
INNER JOIN customers
 ON orders.customer_id = customers.customer_id
 
 -- selecting columns from these two tables
 
SELECT 
	orders.customer_id,
    order_id,
    first_name,
    last_name
FROM
    orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id

-- simplifying the code giving alias from the tables

SELECT 
	o.customer_id,
    order_id,
    first_name,
    last_name
FROM
    orders AS o
INNER JOIN customers AS c
ON o.customer_id = c.customer_id

-- Exercise 10:
-- write a query to join the order_items table with the products table and return
	-- product ID
    -- product name
    -- quantity
    -- unit price
-- NB: use alias to simplify the code

SELECT 
    oi.product_id,
    prod.name AS product_name,
    oi.quantity,
    prod.unit_price
FROM
    sql_store.order_items AS oi
JOIN
    sql_store.products AS prod ON oi.product_id = prod.product_id
    
-- ----------------- JOINING ACROSS DATABASES ------------

SELECT 
    p.name AS name,
    oi.unit_price AS unit_price,
    p.product_id AS product_id
FROM
    order_items AS oi
        JOIN
    sql_inventory.products AS p ON oi.product_id = p.product_id
    
-- Exercise

-- Write a query and join the payments table with the payment_methods table as well as the clients 
-- Produce a report that shows the payment with more details such as the name of the clients and the payment method
-- NB: the tables are found in the sql_invoicing database

SELECT
	PY.client_id AS id_cliente,
	CL.name as nome_cliente,
    PY.invoice_id AS id_invoice,
    PY.amount AS quantidade,
    PM.name AS tipo_pagamento,
    CL.city AS cidade
FROM 
	sql_invoicing.payments AS PY
		JOIN sql_invoicing.clients AS CL ON PY.client_id = CL.client_id
        JOIN sql_invoicing.payment_methods AS PM ON PY.payment_method = PM.payment_method_id
ORDER BY
	id_cliente ASC
    
-- ----------------- JOINING TABLE BY ITSELF ------------

USE sql_hr;

SELECT 
    E.employee_id,
    E.first_name,
    M.first_name AS manager_name
FROM
    employees AS E
        JOIN
    employees AS M ON E.reports_to = M.employee_id
    
-- ----------------- JOINING ACROSS MULTIPLE TABLES ------------

-- join orders with customers and order status table

USE sql_store;

SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.status AS status,
    os.name AS status_meaning
FROM
    orders AS o
        JOIN
    customers AS c ON o.customer_id = c.customer_id
        JOIN
    order_statuses AS os ON o.status = os.order_status_id
    
-- ----------------- OUTER JOIN ------------

-- LEFT JOIN
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM 
	customers AS c
LEFT JOIN 
	orders AS o ON c.customer_id = o.customer_id
    
-- 

SELECT 
	cus.customer_id,
    cus.first_name,
    ord.order_id
FROM 
	customers AS cus
RIGHT JOIN 
	orders AS ord ON cus.customer_id = ord.customer_id
    
-- EXERCISE 12
-- Write a query that produces a table with the following results:
	-- product_id, name(i.e, name of product), quantity (you can get that from the order items)
    -- return the product even if it has never been ordered
    
SELECT
	p.product_id,
    p.name,
    oi.quantity
    
FROM 
	sql_store.products AS p
LEFT JOIN 
	sql_store.order_items AS oi 
		ON p.product_id = oi.product_id 
        
-- EXERCISE 13
	-- using the sql_invoicing database, write a query that returns:
    -- date
    -- amount
    -- client
    -- name (i.e name of payment method)

SELECT 
    P.date,
	P.amount,
    C.name AS client,
    PM.name AS payment_method
FROM
    sql_invoicing.payments AS P
        JOIN
    sql_invoicing.clients AS C USING (client_id)
        JOIN
    sql_invoicing.payment_methods AS PM ON P.payment_method = PM.payment_method_id;
    
-- INSERTING into a single row

SELECT *
FROM customers

LIMIT 12;

INSERT INTO sql_store.customers (customer_id, first_name, last_name, birth_date, phone, address, city, state, points)

VALUES (DEFAULT, 'Jhon', 'smith', '1990-01-01', NULL, 'address', 'city', 'CA', DEFAULT);


-- Inserting into multiple rows

INSERT INTO sql_store.shippers

VALUES (DEFAULT, 'shippers1'),
		(DEFAULT, 'shippers2'),
        (DEFAULT, 'shippers3'),
        (DEFAULT, 'shippers4');

SELECT * FROM sql_store.shippers;

-- Creating a copy of a table

CREATE TABLE new_orders AS
SELECT * FROM orders;

SELECT * FROM new_orders;

INSERT INTO new_orders

SELECT * FROM orders
WHERE order_date < '2019-01-01';

-- Updating an existing table

SELECT * FROM sql_invoicing.payments;

UPDATE sql_invoicing.payments
SET date = '2018-08-01', amount = 40.02, payment_method = 1
WHERE payment_id = 2;

UPDATE sql_invoicing.invoices
SET payment_total = 10, payment_date = due_date
WHERE invoice_id = 5;

-- UPDATE multiple records in existing table

SELECT * FROM sql_invoicing.invoices;

UPDATE sql_invoicing.invoices
SET payment_total = 100
WHERE client_id IN (5,3);

-- ------------------------------------- VIEW ------------------------------------

SELECT * FROM sql_hr.employees;


-- In order to create a new view, it's necessary to indicate where it'll be done

CREATE VIEW new_employees AS
    SELECT 
        *
    FROM
        sql_hr.employees
    WHERE
        job_title NOT LIKE '%VP%'
            AND reports_to IS NOT NULL;
            
-- USING views

SELECT 
    first_name,
    last_name,
    salary,
    FORMAT((salary * 0.05 + salary), 1) AS salary_increase
FROM
    new_employees;

-- Alter SQL view

ALTER VIEW new_employees AS
    SELECT 
        *
    FROM
        sql_hr.employees
    WHERE
        job_title NOT LIKE '%VP%' AND reports_to IS NOT NULL AND salary > 70000;

SELECT * FROM new_employees;

-- DROP SQL View

DROP VIEW new_employees;

-- Functions

USE sql_hr;


-- Creating new employee table

CREATE TABLE new_employee(
name VARCHAR(45) NOT NULL,
occupation VARCHAR(35) NOT NULL,
working_date DATE,
working_hours VARCHAR(10)
);

INSERT INTO new_employee
VALUES
		('Robin', 'Scientist', '2020-10-04', 6),
        ('Warner', 'Engineer', '2020-10-04', 7),
        ('Peter', 'Actor', '2020-10-04', 13),
        ('Marco', 'Engineer', '2020-10-04', 11),
        ('Brayden', 'Teacher', '2020-10-04', 9),
        ('Antonio', 'Business', '2020-10-04', 11);
        
SELECT * FROM new_employee;

-- COUNT() Function

SELECT 
    COUNT(name)
FROM
    sql_hr.new_employee;
    
-- SUM() Function

SELECT 
    SUM(working_hours)
FROM
    sql_hr.new_employee;

-- AVG() Function

SELECT 
    AVG(working_hours)
FROM
    sql_hr.new_employee;

-- Combined functions

SELECT 
    COUNT(name) AS count,
    MIN(working_hours) AS minimum_hours,
    MAX(working_hours) AS maximum_hours,
    AVG(working_hours) AS average_hours
FROM
    sql_hr.new_employee;

-- Count function in details

-- Count with where

SELECT 
    COUNT(*)
FROM
    sql_hr.new_employee
WHERE
    working_hours > 10;
    
-- COUNT with DISTINCT

SELECT COUNT(DISTINCT occupation) AS number_of_occupations
FROM sql_hr.new_employee;

-- HAVING() function

SELECT * FROM sql_store.customers;

SELECT first_name, last_name, points, phone
FROM sql_store.customers
HAVING points > 1000;

-- LENGTH Function

-- CHAR_LENGTH(), CHARACTER_LENGTH()

SELECT 
    first_name, LENGTH(first_name) AS length_of_name
FROM
    sql_hr.employees;
            
SELECT 
    first_name, LENGTH(first_name) AS length_of_name, CHAR_LENGTH(first_name), CHARACTER_LENGTH(first_name)
FROM
    sql_hr.employees;
    
-- CONCAT() Function

SELECT CONCAT(first_name,' ', last_name, ' ', salary)
FROM
    sql_hr.employees;
    
-- FORMAT() Function

SELECT salary, FORMAT(salary, 0) AS formated
FROM sql_hr.employees;

-- INSERT() Function

SELECT INSERT('abcEGF', 4, 3, 'def');

SELECT * FROM sql_hr.employees;

SELECT job_title, INSERT(job_title, 8, 10, ' General')
FROM sql_hr.employees
WHERE employee_id = 33391;

-- LOCATE() Function

SELECT employee_id, job_title, LOCATE('executive', job_title)
FROM sql_hr.employees;

SELECT employee_id, job_title, INSERT(job_title, 8, 9, 'Manager')
FROM sql_hr.employees
WHERE employee_id = 80529;

-- UCASE(): UPPER CASE
-- LCASE(): lower case

SELECT 
    job_title,
    first_name,
    last_name,
    LCASE(job_title),
    UCASE(first_name)
FROM
    sql_hr.employees;
    
-- ----------------------- STORED PROCEDURE -------------------------

SELECT
	first_name
FROM 
	sql_hr.employees
WHERE
	employee_id = 3;

CREATE PROCEDURE test()

SELECT 
    *
FROM
    sql_store.orders
WHERE
    order_date > '2018-01-01';

CALL test();

-- Stored Procedure with a single parameter

USE sql_hr;

CREATE PROCEDURE test1(office_id INT)

SELECT
	office_id,
    first_name,
    last_name,
    job_title,
    salary
FROM employees;

CALL test1(3);

-- Stored procedure with multi parameter

USE sql_hr;

CREATE PROCEDURE test3(id INT, sal DECIMAL)

SELECT
	office_id,
    first_name,
    last_name,
    job_title,
    salary
FROM 
	employees
WHERE
	office_id = id AND
    salary > sal;
    
CALL test3(1, 63000);

-- Alter Stored Procedure

-- DROP Stored Procedure

DROP PROCEDURE test1;

-- --------------------------- Triggers ---------------------

-- BEFORE insert triggers

USE sql_store;

CREATE TRIGGER new_price

BEFORE INSERT
ON products
FOR EACH ROW

SET NEW.unit_price = NEW.unit_price - NEW.unit_price * 0.1;

--

INSERT INTO products
VALUES(DEFAULT, 'BOOKS', 30, 50.0);

SELECT * FROM sql_store.products

LIMIT 100;

-- Alter Insert Trigger

USE sql_store;

CREATE TRIGGER status_trigger

AFTER INSERT
ON orders
FOR EACH ROW

INSERT order_statuses(order_status_id, name)
VALUES(order_status_id, 'order unsuccessful');

INSERT INTO orders(order_id, customer_id, order_date, comments, shipped_date, shipper_id)
VALUES(DEFAULT, 2, '2019-04-07', 'order was not successful', '2019-04-07', 3);

-- DROP triggers

DROP TRIGGER new_price;

-- -------------------------------- Transactions -----------------------------

USE sql_hr;

CREATE TABLE Accounts(
id INT,
AccountName VARCHAR(10),
AccountBalace DECIMAL(6, 3)
);

INSERT INTO Accounts
VALUES 
	(1, 'John', 300),
    (2, 'Nancy', 800);
    
SELECT * FROM Accounts;

START TRANSACTION;
		UPDATE Accounts
			SET AccountBalace = AccountBalace - 100
            WHERE id = 1;
		UPDATE Accounts
			SET AccountBalace = AccountBalace + 100
            WHERE id = 2
            COMMIT;
            
-- 


START TRANSACTION;
		UPDATE Accounts
			SET AccountBalace = AccountBalace - 100
            WHERE id = 1;
		UPDATE Accounts
			SET AccountBalace = AccountBalace + 100
            WHERE id = 2
            COMMIT;









	


    

    

 





