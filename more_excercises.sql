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
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer

-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005

-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005

-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N

-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M"

-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T

-- Select all columns minus the password column from the staff table for rows that contain a password

-- Select all columns minus the password column from the staff table for rows that do not contain a password