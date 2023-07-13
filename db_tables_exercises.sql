-- 3. List all databases
SHOW DATABASES;
-- 4. Use albums database
USE albums_db;

-- 5. Show the currently selected database
SELECT database();

-- 6. List all tables in the database
SHOW TABLES;

-- 7. switch to the employees database
USE employees;

-- 8. how the currently selected database
SELECT database();

-- 9. List all tables in the database
SHOW TABLES;

-- 10. What dif data types are present in this table?
SELECT * FROM employees;
DESCRIBE employees;
-- 				Int / date / varchar(14) / var char(16) / enum(M/F) / Date
-- 11. Which tables do you think contain a numeric type column?
--              emp_no 
-- 12. Which tables do you think contain a string type column?
--              first_name / last_name / gender
-- 13. Which tables do you think contain a date type column?
--              birth_date / hire_date

-- 14. What is the relationship between the employees and the departments tables?
SELECT * FROM departments;
DESCRIBE departments;
-- The employee table and the department tables have no direct link
-- But combined they are linked by where the employees work in each dept

-- 15. SQL code that created the dept_manager table
SHOW CREATE TABLE dept_manager;


