SHOW DATABASES;
USE employees;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name limit 1 offset 708;
-- First: Irena Reutenauer / Last: Vidya Simmen

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name limit 1 offset 708;
-- First: Irena Acton / Last: Vidya Zweizig

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.  
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya') AND gender = 'M' ORDER BY last_name, first_name;
-- First: Irena Acton / Last: Maya Zyda

-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number. 
-- Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT * FROM employees 
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

SELECT * FROM employees 
WHERE last_name LIKE 'e%e'
ORDER BY emp_no limit 1 offset 898;

-- Number of Emps Returned = 899 / 10021 Ramzi Erde / 499648 Tadahiro Erde

-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first. 
-- Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT * FROM employees 
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 899 / Newest: Teiji Eldridge / Oldest: Sergi Erde


-- Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date 
between '1990-01-01' AND '1999-12-31' 
ORDER BY birth_date, hire_date Desc;

-- 362 Returned / Oldest&Last: Khun Bernini / Youngest&First: Douadi Pettis

-- Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name,' ' ,last_name) AS full_name
FROM employees 
WHERE last_name LIKE 'e%e';


-- Convert the names produced in your last query to all uppercase.
SELECT UPPER (CONCAT(first_name,' ' ,last_name)) AS full_name
FROM employees 
WHERE last_name LIKE 'e%e';

-- Use a function to determine how many results were returned from your previous query.
SELECT COUNT(UPPER(
CONCAT(first_name,' ' ,last_name)
)) AS full_name
FROM employees 
WHERE last_name LIKE 'e%e';
-- 899


-- Find all employees hired in the 90s and born on Christmas. 
SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date 
between '1990-01-01' AND '1999-12-31';
-- Use datediff() function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),
SELECT DATEDIFF(NOW(), hire_date) As time_worked
FROM employees WHERE birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'; 


-- Find the smallest and largest current salary from the salaries table.
show tables;
SELECT * FROM salaries limit 20;
SELECT MIN(salary), MAX(salary) FROM salaries;


-- Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born.


SELECT LOWER(CONCAT(SUBSTR(first_name, 1 , 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username, first_name, last_name, birth_date
FROM employees;