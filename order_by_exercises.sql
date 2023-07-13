SHOW DATABASES;
USE employees;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
-- 2. In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name limit 1 offset 708;
-- First: Irena Reutenauer / Last: Vidya Simmen

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name limit 1 offset 708;
-- First: Irena Acton / Last: Vidya Zweizig

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.  
-- In your comments, answer: What was the first and last name in the first row of the results? 
-- What was the first and last name of the last person in the table?
SELECT * FROM employees WHERE (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya') AND gender = 'M' 
ORDER BY last_name, first_name;
-- First: Irena Acton / Last: Maya Zyda

-- 5. Write a query to find all employees whose last name starts and ends with 'E'. 
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
-- 6. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT * FROM employees 
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;
-- 899 / Newest: Teiji Eldridge / Oldest: Sergi Erde


-- Find all employees hired in the 90s and born on Christmas. 
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- 7. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date 
between '1990-01-01' AND '1999-12-31' 
ORDER BY birth_date, hire_date Desc;



-- 362 Returned / Oldest&Last: Khun Bernini / Youngest&First: Douadi Pettis

