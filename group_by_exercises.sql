USE employees;
-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? 
show tables;
SELECT * FROM titles;
SELECT DISTINCT title FROM titles;
-- 7 different titles
SELECT COUNT(DISTINCT title) FROM titles;

SELECT * FROM employees;
-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'
Group by full_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name like '%q%' and last_name NOT LIKE '%qu%'
GROUP by last_name;
-- CHLEQ, LINDQVIST, QIWEN


-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT last_name, COUNT(*)
FROM employees
WHERE last_name like '%q%' and last_name NOT LIKE '%qu%'
GROUP by last_name;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
SELECT first_name, gender, count(*) as n_first_names FROM employees WHERE first_name IN ('Irena','Vidya','Maya')
GROUP BY first_name, gender;


-- Using your query that generates a username for all employees, generate a count of employees with each unique username.
SELECT LOWER(
CONCAT(
SUBSTR(first_name, 1 , 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)
)
) AS username, count(*) AS n_user
FROM employees
GROUP BY username
HAVING n_user > 1;


-- From your previous query, are there any duplicate usernames? YES
-- What is the highest number of times a username shows up? 6 
-- Bonus: How many duplicate usernames are there?
SELECT LOWER(
		CONCAT(
			SUBSTR(first_name,1,1),
			SUBSTR(last_name,1,4),
			SUBSTR(birth_date,6,2),
			SUBSTR(birth_date,3,2))) 
		AS username,
count(*) AS dup_count
FROM employees
GROUP BY username
HAVING dup_count > 1;