use robinson_2283;
-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains 
-- first_name, last_name, and dept_name for employees currently with that department.

create temporary table employees_with_departments as
select first_name, last_name, dept_name 
from employees.employees e
join employees.dept_emp de
	using(emp_no)
join employees.departments d
	using(dept_no)
where  de.to_date > NOW();

select * from employees_with_departments;

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the 
-- first name and last name columns.

alter table employees_with_departments
add full_name varchar(40);


select * from employees_with_departments;


-- b. Update the table so that the full_name column contains the correct data.

update employees_with_departments
set full_name = CONCAT(first_name, ' ', last_name);


-- c. Remove the first_name and last_name columns from the table.

alter table employees_with_departments
drop column first_name;
alter table employees_with_departments
drop column last_name;


-- d. What is another way you could have ended up with this same table?
-- with concat like below
use employees;

select d.dept_name, concat(e.first_name, ' ', e.last_name) as full_name
from employees e
join dept_emp de
	USING (emp_no)
join departments d
	using (dept_no)
where de.to_date > NOW();


-- 2. Create a temporary table based on the payment table from the sakila database.
use robinson_2283;

select * from sakila.payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing 
-- the number of cents of the payment. For example, 1.99 should become 199.
create temporary table sakila_payments as
select * from sakila.payment;

select * from sakila_payments;
describe sakila_payments;

alter table sakila_payments
modify amount decimal(10,2);

update sakila_payments
set amount = amount * 100;


-- 3. Go back to the employees database. Find out how the current average pay in each department compares to the overall 
-- current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. 
-- In terms of salary, what is the best department right now to work for? The worst?

use employees;


    
    
-- dept avg salary - overall avg salary 
-- /
-- stdeb of all salaries
create temporary table dept_avgs as (
select
		dept_name,
        avg(salary) as dept_avg
from employees.departments d
join employees.dept_emp de
using(dept_no)
join employees.salaries s
using (emp_no)
where de.to_date > now() and s.to_date > now()
group by dept_name);
    
create temporary table metrics    
select
	avg(salary) as overall,
    stddev(salary) as stdv
from
employees.salaries s
where to_date > now();


select * from metrics;
select * from dept_avgs;

alter table dept_avgs
add overall_avg Float;

alter table dept_avgs
add overall_std float;

alter table dept_avgs
add zscore float;

select * from dept_avgs;

update dept_avgs
set overall_avg =
(
select overall from metrics);
    
update dept_avgs
set overall_std =
(
select stdv from metrics);

select * from dept_avgs;

update dept_avgs
set zscore = 
(dept_avg - overall_avg) / overall_std;

select dept_name, zscore from dept_avgs
order by zscore desc;
    
    
    
    
    
    
    
