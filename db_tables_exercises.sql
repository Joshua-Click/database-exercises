-- List all databases
SHOW DATABASES;
-- Use albums database
SELECT albums_db;
-- Show the currently selected database
SELECT database();
-- List all tables in the database
SHOW TABLES;

-- switch to the employees database
USE employees;
-- how the currently selected database
SELECT database();
-- List all tables in the database
SHOW TABLES;
-- What dif data types are present in this table?
SELECT * FROM employees;
DESCRIBE employees;
-- 				Int / date / varchar(14) / var char(16) / enum(M/F) / Date
-- Which tables do you think contain a numeric type column?
--              emp_no 
-- Which tables do you think contain a string type column?
--              first_name / last_name / gender
-- Which tables do you think contain a date type column?
--              birth_date / hire_date

-- What is the relationship between the employees and the departments tables?
SELECT * FROM departments;
DESCRIBE departments;
-- The employee table and the department tables have nothing in common
-- SQL code that created the dept_manager table
SHOW CREATE TABLE dept_manager;


