USE join_example_db;
SHOW tables;
-- roles, users
DESCRIBE roles;
-- id PK, name
SELECT * FROM roles;
DESCRIBE users;
-- id PK, name, email, role_id (MUL)
SELECT * FROM users;
-- inner join
SELECT * FROM users
JOIN roles ON users.role_id = roles.id;
-- left join
SELECT * FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- right join
SELECT * FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- 3. Use count and the appropriate join type to get a list of roles along with the number of users that has the role
SELECT COUNT(*) AS ammount_users, roles.name
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role_id;

-- 1. Uses employees database
USE employees;
SHOW tables;
-- departments, dept_emp, dept_manager, employees, salaries, titles
DESCRIBE departments;
-- dept_no (PK), dept_name (UNI)
SELECT * FROM departments AS d;
DESCRIBE dept_emp;
-- emp_no (PK), dept_no (PK), from_date, to_date
SELECT * FROM dept_emp AS de;
DESCRIBE dept_manager;
-- emp_no (PK), dept_no (PK), from_date, to_date
SELECT * FROM dept_manager AS dm;
DESCRIBE employees;
-- emp_no (PK), birth_date, first_name, last_name, gender, hire_date
SELECT * FROM employees AS e;
DESCRIBE salaries;
-- emp_no (PK), salary, from_date (PK), to_date
SELECT * FROM salaries AS s limit 3;
DESCRIBE titles;
-- emp_no (PK), title (PK), from_date (PK), to_date
SELECT * FROM titles AS t;

-- 2. Write a query that shows each dept along with the name of the current manager for that dept
-- departments (d), dept_emp (de), dept_manager (dm), employees (e), salaries (s), titles (t)
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY Department_Name;


-- 3. Find the name of all departments currently managed by women
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY Department_Name;

-- 4. Find the current titles of employees currently working in the Customer Service department
-- departments (d), dept_emp (de), dept_manager (dm), employees (e), salaries (s), titles (t)
SELECT t.title, COUNT(t.title) AS Count
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
JOIN titles AS t
  ON t.emp_no = e.emp_no
WHERE d.dept_name = 'Customer Service' AND de.to_date = '9999-01-01' AND t.to_date = '9999-01-01'
GROUP BY title
ORDER BY title;

-- 5. Find the current salary of all current managers
-- departments (d), dept_emp (de), dept_manager (dm), employees (e), salaries (s), titles (t)
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager, s.salary AS Salary
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
  ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY Department_Name;

-- 6. Find the number of current employees in each department

SELECT d. dept_no, d.dept_name, COUNT(d.dept_name) AS num_employees
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
JOIN titles AS t
  ON t.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01' AND t.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY d.dept_no;

-- 7. Which department has the highest average salary? Use current, not historic info.
-- departments (d), dept_emp (de), dept_manager (dm), employees (e), salaries (s), titles (t)
SELECT d.dept_name, avg(s.salary) AS average_salary
FROM employees AS e
JOIN salaries as s
  ON e.emp_no = s.emp_no
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing Department?
-- departments (d), dept_emp (de), dept_manager (dm), employees (e), salaries (s), titles (t)

SELECT e.first_name, e.last_name
FROM employees AS e
JOIN salaries as s
  ON e.emp_no = s.emp_no
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01' AND d.dept_name = 'Marketing' 
ORDER BY s.salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?

SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
  ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 1;

-- 10. Determine the average salary for each department. Use all salary info and round your results

SELECT d.dept_name, ROUND(avg(s.salary)) AS average_salary
FROM employees AS e
JOIN salaries as s
  ON e.emp_no = s.emp_no
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;



















