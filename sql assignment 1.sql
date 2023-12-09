-- SQL Assignment 1

-- Q1
SELECT 
    TABLE_NAME, 
    COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    CONSTRAINT_NAME = 'PRIMARY' 
    AND TABLE_SCHEMA = 'mavenmovies';

SELECT 
    TABLE_NAME, 
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    CONSTRAINT_NAME LIKE 'FK%'
    AND TABLE_SCHEMA = 'mavenmovies';

-- The major difference between Primary key and foreign key is Primary keys uniquely identify a record in a table, while foreign keys establish a link between tables. 

-- Q2
select * from actor;

-- Q3
select * from customer;

-- Q4
select distinct(country) from country;

-- Q5
select first_name , last_name from customer where active like 1;

-- Q6
select c.customer_id , r.rental_id from customer c join rental r on c.customer_id = r.customer_id where c.customer_id = 1 group by c.customer_id,rental_id;

-- Q7
select title from film where rental_duration > 5 ;

-- Q8
-- List the total number of films whose replacement cost is greater than $15 and less than $20. 
select * from film; 
select count(film_id) from film where replacement_cost > 15 and replacement_cost<20 ;

-- Q9
-- Display the count of unique first names of actors. 
select distinct(first_name) as names from actor;

-- Q10
--  Display the first 10 records from the customer table . 
select * from customer limit 10;

-- Q11
--  Display the first 3 records from the customer table whose first name starts with ‘b’. 
select first_name from customer where first_name like 'b%' limit 3;

-- Q12
-- Display the names of the first 5 movies which are rated as ‘G’. 
select * from film;
select title ,rating from film where rating like 'G';

-- Q13
-- Find all customers whose first name starts with "a". 
select first_name from customer where first_name like 'a%';

-- Q14
--  Find all customers whose first name ends with "a". 
select first_name from customer where first_name like '%a';

-- Q15
--  Display the list of first 4 cities which start and end with ‘a’ . 
select city from city where city like 'a%a';

-- Q16
--  Find all customers whose first name have "NI" in any position. 
select first_name from customer where first_name like '%ni%';

-- Q17
--  Find all customers whose first name have "r" in the second position .
select first_name from customer where first_name like '_r%';

-- Q18
--  Find all customers whose first name starts with "a" and are at least 5 characters in length. 
SELECT first_name FROM customer WHERE first_name LIKE 'a____%';

-- Q19
--  Find all customers whose first name starts with "a" and ends with "o". 
SELECT first_name FROM customer WHERE first_name LIKE 'a%o';

-- Q20
--  Get the films with pg and pg-13 rating using IN operator. 
SELECT title FROM film WHERE rating IN ('PG', 'PG-13');

-- Q21
--  Get the films with length between 50 to 100 using between operator. 
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- Q22
-- Get the top 50 actors using limit operator. 
select * from actor limit 50;

-- Q23
--  Get the distinct film ids from inventory table. 
select distinct film_id from inventory; 



