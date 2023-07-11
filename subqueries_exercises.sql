USE employees;




-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT emp_no, hire_date
	FROM employees
WHERE hire_date = 
	(SELECT hire_date FROM employees WHERE emp_no = 101010);
-- 69 rows returned

-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT e.first_name, t.title
	FROM (SELECT * FROM employees
			WHERE first_name = 'Aamod') as e
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.to_date > NOW();
-- shows 168 rows w/ name and titles

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT COUNT(*) FROM employees
	WHERE emp_no IN (SELECT de.emp_no FROM dept_emp de WHERE to_date NOT LIKE '99%');
-- 85108

-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name, gender
FROM employees
	WHERE emp_no in (SELECT emp_no FROM dept_manager WHERE to_date LIKE '99%') AND gender = 'F';
-- 4 rows returned

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT first_name, last_name, s.salary FROM employees
JOIN salaries s USING(emp_no)
WHERE s.salary > (SELECT avg(salary) FROM salaries) AND s.to_date > NOW();
-- 154542 rows returned


-- 6. How many current salaries are within 1 standard deviation of the current highest salary?
SELECT COUNT(salary)
FROM salaries
WHERE salary >= ((SELECT MAX(salary) AS highest_salary FROM salaries WHERE to_date = '9999-01-01')-
(SELECT STDDEV(salary) AS 1_std_dev FROM salaries WHERE to_date = '9999-01-01'));
-- 220


	-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


	SELECT COUNT(*) AS Total_salaries, 
		(SELECT COUNT(salary)
		FROM salaries
		WHERE salary >= ((SELECT MAX(salary) AS highest_salary FROM salaries WHERE to_date = '9999-01-01')-(SELECT STDDEV(salary) AS 1_std_dev FROM salaries WHERE to_date = '9999-01-01'))
		) AS salaries_in_range
	
	FROM salaries WHERE to_date = '9999-01-01';

    
	-- Hint You will likely use multiple subqueries in a variety of ways
	-- Hint It's a good practice to write out all of the small queries that you can. 
	-- Add a comment above the query showing the number of rows returned. 
	-- You will use this number (or the query that produced it) in other, larger queries.

-- BONUS

-- 1. Find all the department names that currently have female managers.

-- 2. Find the first and last name of the employee with the highest salary.

-- 3. Find the department name that the employee with the highest salary works in.

-- 4. Who is the highest paid employee within each department.