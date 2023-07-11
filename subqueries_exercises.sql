USE employees;




-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.

SELECT * 
FROM employees e
JOIN dept_emp de
ON de.emp_no = e.emp_no
AND de.to_date > NOW()
WHERE hire_date = (SELECT 
		hire_date
		FROM employees
		WHERE emp_no = 101010);
-- 55 Rows


-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT 
	e.emp_no
FROM
	employees e
JOIN dept_emp de
ON de.emp_no = e.emp_no
AND de.to_date > NOW()
WHERE first_name = 'Aamod';

SELECT 
	title
FROM titles
WHERE 
	emp_no IN (SELECT 
		e.emp_no
	FROM
		employees e
	JOIN dept_emp de
	ON de.emp_no = e.emp_no
	AND de.to_date > NOW()
	WHERE first_name = 'Aamod');
-- 251 rows
		

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT COUNT(*)
FROM employees e
WHERE emp_no
NOT IN (
		SELECT emp_no FROM dept_emp
        WHERE to_date > NOW()
);
-- 59900

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
SELECT AVG(salary)
FROM salaries;

select
	*
from employees e
join dept_emp de
using(emp_no)
join salaries s 
using(emp_no)
where
	de.to_date > NOW()
    AND
    s.to_date > NOW()
    and 
	salary > (select avg(salary) from salaries);
-- 154542

-- 6. How many current salaries are within 1 standard deviation of the current highest salary?
SELECT COUNT(salary)
FROM salaries
WHERE salary >= ((SELECT MAX(salary) AS highest_salary FROM salaries WHERE to_date = '9999-01-01')-
(SELECT STDDEV(salary) AS 1_std_dev FROM salaries WHERE to_date = '9999-01-01'));
-- 220


	-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?


    
	-- Hint You will likely use multiple subqueries in a variety of ways
	-- Hint It's a good practice to write out all of the small queries that you can. 
	-- Add a comment above the query showing the number of rows returned. 
	-- You will use this number (or the query that produced it) in other, larger queries.



select count(*)
from salaries
where salaries.to_date > NOW() 
and salary >= (SELECT MAX(salary) - stddev(salary) one_dev
from salaries s
where s.to_date > NOW());





-- BONUS

-- 1. Find all the department names that currently have female managers.

-- 2. Find the first and last name of the employee with the highest salary.

-- 3. Find the department name that the employee with the highest salary works in.

-- 4. Who is the highest paid employee within each department.