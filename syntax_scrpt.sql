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


  




