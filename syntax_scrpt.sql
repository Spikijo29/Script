-- SELECT ALL THE COLUMNS AND ALL THE ROWS IN OUR DATASET
-- USE SELECT*FROM shopping.sales.sales
-- YOU CAN SELECT SPECIFIC COLUMNS IN YOUR DATA BY SPECIFYING THE COLUMN NAMES IN THE SELECT STATEMENT
--You seperate the column names in the select statement by a comma

SELECT customer_id,
date, 
total_amount
FROM shopping_trends.sales.sales

----------------------------------------------------
-- The DISTINCT means different 
--When you SELECT DISTINCT, it gives you unique values in that specific column
--It does not include duplicates 

SELECT DISTINCT gender
FROM shopping_trends.sales.sales


SELECT DISTINCT product_category
FROM shopping_trends.sales.sales

SELECT customer_id, total_amount, date
FROM shopping_trends.sales.sales
------------------------------------------------------------------------------
--Filtering Statement
-- Inclused all the male in the gender column

SELECT*
FROM shopping_trends.sales.sales
WHERE gender='Males'


-------------------------------------------------------------------------------------
--AGGREGATE FUNCTION 
--An aggregate function performs a calculation on a specific , row , column and returns a single value
--
--
--
--
-- MAX()

SELECT SUM(column_name)
FROM shopping_trends.sales.sales
----------------------------------------------------------------------------------------------------------------------------

--Arethmetic operators - allows us to perform mathemetical calculations

-- + Plus sign = + addition
--- Minus Sign = - deduction
--- Division sign = / division
--- Multiplication sign = * multiplication

--We normally use the mathematical operators in the SELECT statement
--We can apply the mathematical operators betwen two or more columns
--We can also apply a constant on an entire column

-- Example : calculate the discount price if the discount is 50%

SELECT*FROM shopping_trends.sales.sales

SELECT price_per_unit,
(price_per_unit/2) AS discount_price
FROM SHOPPING_TRENDS.sales.sales;

SELECT price_per_unit,
(price_per_unit* 2) AS double_price
FROM SHOPPING_TRENDS.sales.sales;

---------------------------------------------------------------------
Logical Operators 

--IN used in the WHERE clause to filter data by specifying multiple values
--OR
--AND
--BETWEEN
--NOT

---IN or NOT IN ------------

SELECT salesperson, city
WHERE CITY IN (New York,Giyani)

--If you use NOT IN

SELECT salesperson, city
WHERE CITY NOT IN (New York,Giyani)

---BETWEEN-- is an inclusive statement that allows to filter data on a range of values
--RANGES = MAX & MIN

SELECT column 1,
        column2,
        FROM shopping_trends.sales.sales
        WHERE column_name BETWEEN MIN_value AND MAX_value

    SELECT productname,
    price
    FROM shopping_trends.sales.sales
    WHERE price BETWEEN 4 AND 7


   -----NULL-----
   --NULL IS an empty space or missing value (blank space)
   --no information
   --missing information 
   --NULL function helps us to handle NULL values 
   --We use NULL functions to avoid errors or unexpected results especially in calculations
   -- How to test NULL values ?
   --We use NULL to check if we have a NULL in a specific column.

   SELECT column_name 
   FROM table_name
   WHERE columnname_NULL
   --this will give you all the rows where this column has a NULL value

   

   Example
--Write an SQL query to give students who did not provide their emails

  SELECT  name,email
  FROM Student
  WHERE email is NULL
Result

---IS NOT NULL--
SELECT name, email
FROM Student
WHERE is NOT NULL
Result

--gives us the name of the people with emails


----IF NULL (expression, default_value column)
--Helps us replace NULL values
--If the column specified has NULL in that specific column then we will 
replace that NULL with default values
--IF NULL is 


SELECT name 
IFNULL(email, email not provided)-replaces email with "email not provided"
FROM Student


---COALSEC (expr1, expr2, expr3)---\
--looks for the first none NULL value
==reads from left to right
--allows you to put multiple option


SELECT Student_id
COALSEC(name,nickname) AS display_name
FROM Students 


---DATE FUNCTIONS--
--Are used to work with date, time and timestamp
--Date functions allows us to format dates
--it allows us to extractparts of a date
--it allows us to convert between date types

CURRENT_DATEC -- gives us today's date based on the time zone
SELECT (current_date);

SELECT (current_date)-1 AS yesterday;

---CURRENT -TIMESTAP--
Returns the date and time

SELECT CURRENT_TIMESTAMP;

--DATEADD( UNIT, VALUE, DATE)--specify column with date
UNIT --Month & Date
VALUE -- the number of days/months (you are adding)(+add)(-subtract)

SELECT DATEADD (day,2,'2025-08-14') AS new_date;







SELECT
  *
FROM
  "SOS"."TABLE"."ERRORS"
LIMIT
  10;

  SELECT 
  TO_DATE(transaction_date) AS transaction_date,
  DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
  DAYNAME(TO_DATE(transaction_date)) AS day_name,
  MONTHNAME(DATE(transation_date))AS month_name,
  

  CASE
  WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
  WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
  WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
  ELSE 'Night'
  END AS time_bucket,

  COUNT(DISTINCT transaction_id) AS number_of_queries,
  COUNT(DISTINCT customer_site_code) AS site_code,
  COUNT(DISTINCT about) AS short_error,
  COUNT(DISTINCT select_your_name_from_the_list) AS consultant_name
  COUNT(DISTINCT detailed_question) AS details_to_question,
  COUNT(DISTINCT quick_one) AS short_question,

  FROM sos.table.errors
  GROUP BY ALL;
  ..........................................................

  SELECT 
  

  CASE
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
    WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
    ELSE 'Night'
  END AS time_bucket,

  COUNT(DISTINCT transaction_id) AS number_of_queries,
  COUNT(DISTINCT customer_site_code) AS sitecode,
  COUNT(DISTINCT About) AS error,
  COUNT(DISTINCT select_your_name_from_the_list) AS name,
  COUNT(DISTINCT detailed_question) AS details,

FROM sos.table.errors

GROUP BY 
  DATE(transaction_date),
  DAYOFMONTH(DATE(transaction_date)),
  DAYNAME(DATE(transaction_date)),
  MONTHNAME(DATE(transaction_date)),
  time_bucket,
  quick_one;



)




-----Check what is in the dataset (what columns)
SELECT*  
FROM
  "ZIM_DEALERS"."PARTNER"."XPRESS"
LIMIT
  10;
  ----- checking the minimum date------
  SELECT MIN(transaction_date) AS min_date
  from zim_dealers.partner.express;

  ----checking the latest record in the data-------
SELECT MAX(transaction_date)
FROM zim_dealers.partner.xpress;

SELECT MAX(transaction_date) AS max_date
FROM zim_dealers.partner.xpress;

--------I want to know the opening hours of the shops-------
SELECT MIN(transaction_time)AS opening_time
FROM zim_dealers.partner.xpress

SELECT MAX(transaction_time)AS closing_time
FROM zim_dealers.partner.xpress;

------- how many shows do we have-------

SELECT COUNT(DISTINCT store_id)
FROM zim_dealers.partner.xpress

-----getting the names if the shops -------
SELECT DISTINCT store_location
FROM zim_dealers.partner.xpress

---------how many products do we have------
SELECT COUNT(DISTINCT product_id)AS number_of_products
FROM zim_dealers.partner.xpress

----------------------- end------

--I am checking all the columns in my dataset
SELECT *
FROM sales.public
--Dates 

TO_DATE 



SELECT *
FROM BRIGHT_COFFEE.SALES.SHOP_TRANSACTIONS


SELECT DISTINCT transaction_date
  FROM bright_coffee.sales.shop_transactions

  SELECT DISTINCT transaction_time
  FROM bright_coffee.sales.shop_transactions
  
  SELECT DISTINCT transaction_qty
  FROM bright_coffee.sales.shop_transactions

 SELECT DISTINCT store_location, store_id
  FROM bright_coffee.sales.shop_transactions

 SELECT DISTINCT product_category
 FROM bright_coffee.sales.shop_transactions

 SELECT DISTINCT product_type
  FROM bright_coffee.sales.shop_transactions
  
 SELECT DISTINCT product_detail
  FROM bright_coffee.sales.shop_transactions
  
  ------------------------------------------------------------------------

  SELECT MAX (unit_price)
  FROM bright_coffee.sales.shop_transactions
  
  SELECT MIN (unit_price)
  FROM bright_coffee.sales.shop_transactions

--- I want to see the columns in my table and the data type
--# is a number
--A is text

SELECT
  *
FROM
  "BRIGHT_COFFEE"."SALES"."SHOP_TRANSACTIONS"
LIMIT
  10;

  SELECT MIN (transaction_time) AS opening_time
  FROM bright_coffee.sales.shop_transactions
  
SELECT MAX (transaction_time) AS closing_time
  FROM bright_coffee.sales.shop_transactions
  
--It gives different transactions at the store

--Dates
  SELECT 
  
  TO_DATE(transaction_date)AS transaction_date,
  DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
  DAYNAME(TO_DATE (transaction_date)) AS day_name,
  MONTHNAME(TO_DATE(transaction_date)) AS Month_name,
  TO_CHAR(TO_DATE(transaction_date), 'YYYYMM')AS month_id,

  CASE
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'MORNING'
    WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'AFTERNOON'
     WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'EVENING'
     ELSE 'Night'
  END AS time_bucket,

  CASE
      WHEN DAYNAME(TO_DATE(transaction_date)) NOT IN ('Sat','Sun') THEN 'Weekday'
      ELSE 'Weekend'
      END AS day_classification,

  --ROUND(SUM(IFNULL(transaction_qty, 0)*IFNULL(unit_price,0)),0) AS revenue,
    SUM(transaction_qty*unit_price) AS revenue,
    
  --COUNTS
    COUNT(DISTINCT transaction_id) AS number_of_sales,
    COUNT(DISTINCT UNIT_PRICE) AS price_of_sales,
  COUNT(DISTINCT product_id) AS number_of_unique_products,
  COUNT(DISTINCT store_id) AS number_of_shops,

 --Categories
  store_location,
  product_category,
  product_detail,
  product_type,
    
  FROM bright_coffee.sales.shop_transactions
  GROUP  BY ALL;




SQL Aggregate Functions
An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

Aggregate functions are often used with the GROUP BY clause of the SELECT statement. The GROUP BY clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.

The most commonly used SQL aggregate functions are:

MIN() - returns the smallest value within the selected column
MAX() - returns the largest value within the selected column
COUNT() - returns the number of rows in a set
SUM() - returns the total sum of a numerical column
AVG() - returns the average value of a numerical column
Aggregate functions ignore null values (except for COUNT(*)).


--We will go through the aggregate functions above in the next chapters.
Use MIN() with GROUP BY
Here we use the MIN() function and the GROUP BY clause, to return the smallest price for each category in the Products table

--The SQL COUNT() Function
The COUNT() function returns the number of rows that matches a specified criterion

SELECT COUNT(*)
FROM Products;
--Find the total number of rows in the Products table:


-- SELECT ALL THE COLUMNS AND ALL THE ROWS IN OUR DATASET
-- USE SELECT*FROM shopping.sales.sales
-- YOU CAN SELECT SPECIFIC COLUMNS IN YOUR DATA BY SPECIFYING THE COLUMN NAMES IN THE SELECT STATEMENT
--You seperate the column names in the select statement by a comma

SELECT customer_id,
date, 
total_amount
FROM shopping_trends.sales.sales

----------------------------------------------------
-- The DISTINCT means different 
--When you SELECT DISTINCT, it gives you unique values in that specific column
--It does not include duplicates 

SELECT DISTINCT gender
FROM shopping_trends.sales.sales


SELECT DISTINCT product_category
FROM shopping_trends.sales.sales

SELECT customer_id, total_amount, date
FROM shopping_trends.sales.sales
------------------------------------------------------------------------------
--Filtering Statement
-- Inclused all the male in the gender column

SELECT*
FROM shopping_trends.sales.sales
WHERE gender='Males'


-------------------------------------------------------------------------------------
--AGGREGATE FUNCTION 
--An aggregate function performs a calculation on a specific , row , column and returns a single value
--
--
--
--
-- MAX()

SELECT SUM(column_name)
FROM shopping_trends.sales.sales
----------------------------------------------------------------------------------------------------------------------------

--Arethmetic operators - allows us to perform mathemetical calculations

-- + Plus sign = + addition
--- Minus Sign = - deduction
--- Division sign = / division
--- Multiplication sign = * multiplication

--We normally use the mathematical operators in the SELECT statement
--We can apply the mathematical operators betwen two or more columns
--We can also apply a constant on an entire column

-- Example : calculate the discount price if the discount is 50%

SELECT*FROM shopping_trends.sales.sales

SELECT price_per_unit,
(price_per_unit/2) AS discount_price
FROM SHOPPING_TRENDS.sales.sales;

SELECT price_per_unit,
(price_per_unit* 2) AS double_price
FROM SHOPPING_TRENDS.sales.sales;

---------------------------------------------------------------------
Logical Operators 

--IN used in the WHERE clause to filter data by specifying multiple values
--OR
--AND
--BETWEEN
--NOT

---IN or NOT IN ------------

SELECT salesperson, city
WHERE CITY IN (New York,Giyani)

--If you use NOT IN

SELECT salesperson, city
WHERE CITY NOT IN (New York,Giyani)

---BETWEEN-- is an inclusive statement that allows to filter data on a range of values
--RANGES = MAX & MIN

SELECT column 1,
        column2,
        FROM shopping_trends.sales.sales
        WHERE column_name BETWEEN MIN_value AND MAX_value

    SELECT productname,
    price
    FROM shopping_trends.sales.sales
    WHERE price BETWEEN 4 AND 7


   -----NULL-----
   --NULL IS an empty space or missing value (blank space)
   --no information
   --missing information 
   --NULL function helps us to handle NULL values 
   --We use NULL functions to avoid errors or unexpected results especially in calculations
   -- How to test NULL values ?
   --We use NULL to check if we have a NULL in a specific column.

   SELECT column_name 
   FROM table_name
   WHERE columnname_NULL
   --this will give you all the rows where this column has a NULL value

   

   Example
--Write an SQL query to give students who did not provide their emails

  SELECT  name,email
  FROM Student
  WHERE email is NULL
Result

---IS NOT NULL--
SELECT name, email
FROM Student
WHERE is NOT NULL
Result

--gives us the name of the people with emails


----IF NULL (expression, default_value column)
--Helps us replace NULL values
--If the column specified has NULL in that specific column then we will 
replace that NULL with default values
--IF NULL is 


SELECT name 
IFNULL(email, email not provided)-replaces email with "email not provided"
FROM Student


---COALSEC (expr1, expr2, expr3)---\
--looks for the first none NULL value
==reads from left to right
--allows you to put multiple option


SELECT Student_id
COALSEC(name,nickname) AS display_name
FROM Students 


---DATE FUNCTIONS--
--Are used to work with date, time and timestamp
--Date functions allows us to format dates
--it allows us to extractparts of a date
--it allows us to convert between date types

CURRENT_DATEC -- gives us today's date based on the time zone
SELECT (current_date);

SELECT (current_date)-1 AS yesterday;

---CURRENT -TIMESTAP--
Returns the date and time

SELECT CURRENT_TIMESTAMP;

--DATEADD( UNIT, VALUE, DATE)--specify column with date
UNIT --Month & Date
VALUE -- the number of days/months (you are adding)(+add)(-subtract)

SELECT DATEADD (day,2,'2025-08-14') AS new_date;

-------------------------------Coffee syntax --
SELECT 
  
  TO_DATE(transaction_date)AS transaction_date,
  DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
  DAYNAME(TO_DATE (transaction_date)) AS day_name,
  MONTHNAME(TO_DATE(transaction_date)) AS Month_name,
  TO_CHAR(TO_DATE(transaction_date), 'YYYYMM')AS month_id,

  CASE
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'MORNING'
    WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'AFTERNOON'
     WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'EVENING'
     ELSE 'Night'
  END AS time_bucket,

  CASE
      WHEN DAYNAME(TO_DATE(transaction_date)) NOT IN ('Sat','Sun') THEN 'Weekday'
      ELSE 'Weekend'
      END AS day_classification,

  --ROUND(SUM(IFNULL(transaction_qty, 0)*IFNULL(unit_price,0)),0) AS revenue,
    SUM(transaction_qty*unit_price) AS revenue,
    
  --COUNTS
    COUNT(DISTINCT transaction_id) AS number_of_sales,
    COUNT(DISTINCT UNIT_PRICE) AS price_of_sales,
  COUNT(DISTINCT product_id) AS number_of_unique_products,
  COUNT(DISTINCT store_id) AS number_of_shops,

 --Categories
  store_location,
  product_category,
  product_detail,
  product_type,
    
  FROM bright_coffee.sales.shop_transactions
  GROUP  BY ALL;
-----------------------------------EDA-------------------------------------------------


--- I am checking all the columns in my dataset
SELECT*
FROM bright_coffee.sales.shop_transactions LIMIT 10;

--- Checking minimum date
SELECT MIN(transaction_date) AS min_date
FROM sales.public.coffee;

--- CHecking the latest record in the data
SELECT MAX(transaction_date) AS max_date
FROM sales.public.coffee;


--I want to know the openning hours of the shops
SELECT MAX(transaction_time) AS closing_time
FROM sales.public.coffee;


--- Opennig time
SELECT MIN(transaction_time) AS opening_time
FROM sales.public.coffee;

-- How many shops do we have ---counting the number of shops
select count(distinct store_id)
FROM sales.public.coffee;

-- Geeting the names of the shops
SELECT DISTINCT store_location
FROM sales.public.coffee;

-- How many products are we selling 
SELECT COUNT(DISTINCT product_id) AS Number_of_products
FROM sales.public.coffee;

SELECT DISTINCT product_detail; Number_of_products
FROM sales.public.coffee;

SELECT DISTINCT product_category; 
FROM sales.public.coffee;
WHERE product_category ILIKE('Coffee');

SELECT DISTINCT product_category; 
FROM sales.public.coffee;
WHERE product_category ILIKE('Tea');

SELECT COUNT(DISTINCT product_category) AS number_of_unique_products; 
FROM sales.public.coffee;

-----------------------------------------------------

Date Functions --CREATE A NEW Column
Alphabet is a string

SELECT  

--DATE 
TO_DATE(Transaction_date)AS purchase_date,
DAYOFMONTH(transaction_date)AS day_of_month,
MONTHNAME(TO_DATE(transaction_date)) AS Month_name,
TO_CHAR(transaction_date, 'YYYYMM') AS month_id,
DAYNAME(transaction_date)AS day_name, 

HOUR (transaction_time) AS hour_of_day, 
--Time buckets
CASE
WHEN transaction_time BETWEEN '06:00:00' AND '08:59:59' THEN '01. 6am-8am - Early Morning'
WHEN transaction_time BETWEEN '09:00:00' AND '11:59:59' THEN '02. 9am-8am - Morning'
WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN '03. 12am-3pm - Afternoon'
WHEN transaction_time BETWEEN '16:00:00' AND '19:59:59' THEN '04. 4pm-7pm - Evening'
ELSE '05. +8PM -NIGHT'
END AS time_bucket,

--count 
COUNT(DISTINCT transaction_id) AS number_of_sale,
COUNT(DISTINCT product_id) AS number_of_products,

--Revenue
SUM(transaction_qty*unit_price)AS tot_rev,
SUM(transaction_qty)AS number_of_units_sold,

store_location,
product_category,
product_detail,
product_type,

FROM bright_coffee.sales.shop_transactions
GROUP BY ALL;
.......................................

SELECT*
FROM bright_coffee.sales.shop_transactions
WHERE(category_id =1 or category_id = 5)
and unit_price >3.5;



create or replace TABLE SIPHIWE.MAKHUBO.GIFT (
	TRANSACTION_ID NUMBER(38,0),
	DATE DATE,
	CUSTOMER_ID VARCHAR(16777216),
	GENDER VARCHAR(16777216),
	AGE NUMBER(38,0),
	PRODUCT_CATEGORY VARCHAR(16777216),
	QUANTITY NUMBER(38,0),
	PRICE_PER_UNIT NUMBER(38,0),
	TOTAL_AMOUNT NUMBER(38,0)


    .....................................

    SELECT 
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category IN ('Beauty', Clothing);


    SELECT 
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category NOT IN ('Beauty', Clothing);

    SELECT 
    transaction_id,
    customer_id,
    age,
    date AS purchase_date,
        FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit/2 AS discount_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit*2 AS double_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20 


    SELECT*
FROM shopping_trends.sales.sales
WHERE gender='Males';

----------------------------------------------------

SELECT COUNT (DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT customer_id)AS number_of_customers,

date as purchase_date,
DAYNAME (DATE) AS day_name,
MONTHNAME (date) AS month_name,
DAYOFMONTH(date)AS day_of_month,

CASE
WHEN age BETWEEN 0 AND 12 THEN 'Child'
WHEN age BETWEEN 12 AND 18 THEN 'Youth'
WHEN age BETWEEN 19 AND 20 THEN 'Young Adult'
WHEN age BETWEEN 31 AND 40 THEN 'Adult'
ELSE 'Senior'
END AS age_bucketss,

CASE 
WHEN total_amount BETWEEN 0 AND 100 THEN 'Low spend'
WHEN total_amount > 100 AND total_amount <200 THEN 'Med spend'
WHEN total_amount > 200 THEN 'High spend'
END AS spend_buckets,

SUM (quantity) AS UNIT_SOLD,
SUM (TOTAL_AMOUNT) AS total_revenue,
product_category,
gender
FROM shopping_trends.sales.sales
GROUP BY ALL




----select all the columns and all the rows in our dataset


    SELECT
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category IN ('Beauty', Clothing);


    SELECT 
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category NOT IN ('Beauty', Clothing);

    SELECT 
    transaction_id,
    customer_id,
    age,
    date AS purchase_date,
        FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit/2 AS discount_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit*2 AS double_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20 

  -- SQL Comparison Operator 
  -- = Equal to
  -- > Greater than
  -- >= Greater than or equal
  -- < Less than
-- <= Less than or Equal to 
-- != and <> Not Equal to 

-- The = equal operator gives you the exact value that you looking for
-- We can use the equal sign with words and numbers
-- The not equal sign works the same way as the equal to sign

  SELECT* FROM SIPHIWE.MAKHUBO.GIFT
  WHERE Gender = 'Male';

 SELECT* FROM SIPHIWE.MAKHUBO.GIFT
  WHERE age=30; 

  SELECT
  customer_id
  date AS purchase_date,
  product_category,
  age,
  total_amount AS revenue  
  FROM SIPHIWE.MAKHUBO.GIFT;
  WHERE purchase_date !='2023-01-25';

  SELECT
  customer_id
  date AS purchase_date,
  product_category,
  age,
  total_amount AS revenue  
  FROM SIPHIWE.MAKHUBO.GIFT;
  WHERE  age >30 AND age<50 ;


  create or replace TABLE SIPHIWE.MAKHUBO.GIFT (
	TRANSACTION_ID NUMBER(38,0),
	DATE DATE,
	CUSTOMER_ID VARCHAR(16777216),
	GENDER VARCHAR(16777216),
	AGE NUMBER(38,0),
	PRODUCT_CATEGORY VARCHAR(16777216),
	QUANTITY NUMBER(38,0),
	PRICE_PER_UNIT NUMBER(38,0),
	TOTAL_AMOUNT NUMBER(38,0)


    .....................................

    SELECT 
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category IN ('Beauty', Clothing);


    SELECT 
    transaction-id,
    customer_id,
    date AS purchase_date,
    product_category,
    total_amount AS revenue
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE product_category NOT IN ('Beauty', Clothing);

    SELECT 
    transaction_id,
    customer_id,
    age,
    date AS purchase_date,
        FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit/2 AS discount_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20

    SELECT 
        customer_id,
        price_per_unit
        price_per_unit*2 AS double_price,
    date AS purchase_date,
    FROM SIPHIWE.MAKHUBO.GIFT
    WHERE age BETWEEN 18 AND 20 


    SELECT*
FROM shopping_trends.sales.sales
WHERE gender='Males';

----------------------------------------------------

SELECT COUNT (DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT customer_id)AS number_of_customers,

date as purchase_date,
DAYNAME (DATE) AS day_name,
MONTHNAME (date) AS month_name,
DAYOFMONTH(date)AS day_of_month,

CASE
WHEN age BETWEEN 0 AND 12 THEN 'Child'
WHEN age BETWEEN 12 AND 18 THEN 'Youth'
WHEN age BETWEEN 19 AND 20 THEN 'Young Adult'
WHEN age BETWEEN 31 AND 40 THEN 'Adult'
ELSE 'Senior'
END AS age_bucketss,

CASE 
WHEN total_amount BETWEEN 0 AND 100 THEN 'Low spend'
WHEN total_amount > 100 AND total_amount <200 THEN 'Med spend'
WHEN total_amount > 200 THEN 'High spend'
END AS spend_buckets,

SUM (quantity) AS UNIT_SOLD,
SUM (TOTAL_AMOUNT) AS total_revenue,
product_category,
gender
FROM shopping_trends.sales.sales
GROUP BY ALL
  




