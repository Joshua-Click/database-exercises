show databases;
USE sakila;
show tables;
-- SELECT statements
-- select all comlumns from the actor table
SELECT * FROM actor;
-- select only the last_name column from the actor table
SELECT last_name FROM actor;
-- select only the film_id,title,and release_year columns from the film table
SELECT film_id, title, release_year FROM film;

-- DISTINCT operator
-- Select all distinct last names from the actor table
SELECT DISTINCT last_name FROM actor;
-- Select all distinct postal codes from the address table
SELECT * FROM address;
SELECT DISTINCT postal_code FROM address;
-- select all distinct rating from the film table
SELECT DISTINCT rating FROM film;

-- WHERE clause
SELECT * FROM film;
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer
SELECT title, description, rating, length FROM film
WHERE length > 180;
-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005
SELECT * FROM payment;
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date >= '2005-05-27';
-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005
DESCRIBE payment;
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date = '2005-05-27';
-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N
SELECT * FROM customer;
SELECT * FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';
-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M"
SELECT * FROM customer
WHERE active = '0' AND last_name LIKE 'M%';

-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T
DESCRIBE customer;
SELECT * FROM customer
WHERE customer_id > 4
AND last_name LIKE 'c%' OR last_name LIKE 'S%' OR last_name LIKE 'T%';
-- Select all columns minus the password column from the staff table for rows that contain a password
SELECT * FROM  staff;
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update FROM staff;
-- Select all columns minus the password column from the staff table for rows that do not contain a password
