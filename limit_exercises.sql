SHOW DATABASES;
USE employees;

-- 2. List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name FROM employees 
ORDER by last_name Desc
limit 10;
-- 'Zykh''Zyda''Zwicker''Zweizig''Zumaque''Zultner''Zucker''Zuberek''Zschoche''Zongker'



-- 3. Find all previous or current employees hired in the 90s and born on Christmas.
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
-- Write a comment in your code that lists the five names of the employees returned.
SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date between '1990-01-01' AND '1999-12-31' 
ORDER BY hire_date
limit 5;
-- cappello/mandell/schreiter/kushner/stroustrup


-- 4. Try to think of your results as batches, sets, or pages. 
-- The first five results are your first page. The five after that would be your second page, etc. 
-- Update the query to find the tenth page of results.

SELECT * FROM employees WHERE birth_date like '%-12-25' AND hire_date between '1990-01-01' AND '1999-12-31' 
ORDER BY hire_date
limit 5 OFFSET 45;

-- narwekar farrow karcich luachevsky fontan


