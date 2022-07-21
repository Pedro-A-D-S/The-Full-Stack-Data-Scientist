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

