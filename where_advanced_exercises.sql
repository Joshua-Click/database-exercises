SHOW DATABASES;
USE employees;
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- 1. What is the employee number of the top three results?
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 10200, 10397, 10610

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- 2. What is the employee number of the top three results? Does it match the previous question?
SELECT * FROM employees WHERE first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
-- 10200, 10397, 10610, yes it matches

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- 3. What is the employee number of the top three results.
SELECT * FROM employees WHERE (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya') AND gender = 'M';
-- 10200, 10397, 10821

-- 4. Find all unique last names that start with 'E'
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%';
-- 104 rows

-- 5. Find all unique last names that start or end with 'E'
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' or last_name like '%e';
-- 167 rows


-- 6. Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%e' AND last_name NOT LIKE 'e%';
-- 127 rows

-- 7. Find all unique last names that start and end with 'E'
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'e%e';
-- 5 rows

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 10008, 10011, 10012

-- 9. Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers
SELECT * FROM employees WHERE birth_date LIKE '%-12-25';
-- 10200, 10526, 10556

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with top three employee numbers.
SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date between '1990-01-01' AND '1999-12-31';
-- 10556, 11095, 12715

-- 11. Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name FROM employees WHERE last_name like '%q%';
-- 10 rows

-- 12. Find all unique last names that have a 'q' in their last name but not 'qu'
SELECT DISTINCT last_name FROM employees WHERE last_name like '%q%' AND last_name NOT LIKE '%qu%';
-- 3 rows