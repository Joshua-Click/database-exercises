


USE employees;

-- 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' 
	-- that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

select emp_no, dept_no, hire_date, to_date,
	if(to_date = '9999-01-01', True, False) as is_current_employee
from employees
join dept_emp
	USING(emp_no);



-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 
	-- 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.


select *,
	case 
		when last_name between 'A' and 'H' then 'A-H'
        when last_name between 'I' and 'Q' then 'I-Q'
        else 'R-Z'
	end as alpha_group
from employees;
    


-- 3. How many employees (current or previous) were born in each decade?

select *,
	case
		when birth_date like '195%' then '50s'
        when birth_date like '196%' then '60s'
        when birth_date like '197%' then '70s'
        when birth_date like '198%' then '80s'
        when birth_date like '199%' then '90s'
        when birth_date like '200%' then '2000s'
		else 'im old'
	end as decades
FROM employees;
        
								  
-- 4. What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select * from departments;
select 
	case
		when dept_name in ('research', 'development') then 'R&D'
        when dept_name in ('sales', 'marketing') then 'Sales & Marketing'
        when dept_name in ('Production', 'quality management') then 'Prod & QM'
        else 'Finance & HR, Customer Service'
	end as dept_group,
    round(avg(s.salary)) as dept_avg

from departments
left join dept_emp
	USING (dept_no)
left join salaries s
	on dept_emp.emp_no = s.emp_no
    and s.to_date > NOW()
GROUP BY dept_group
;


-- Bonus: Remove duplicate employees from exercise 1

select emp_no, dept_no, hire_date, to_date, concat(first_name, ' ',last_name) as full_name,
	if(to_date = '9999-01-01', True, False) as is_current_employee
from employees
join dept_emp
	USING(emp_no)

;
