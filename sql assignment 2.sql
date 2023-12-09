-- SQL Assignment 2

use mavenmovies;
-- Q1
SELECT 
    COUNT(*) AS total_rental
FROM
    rental;

-- Q2
SELECT 
    AVG(rental_duration) AS avg_rental_duration
FROM
    film;

-- Q3
SELECT 
    UPPER(CONCAT(first_name, ' ', last_name)) AS name
FROM
    customer;

-- Q4
SELECT 
    rental_id, MONTH(rental_date) AS month_of_rental
FROM
    rental
GROUP BY rental_id;

-- Q5
SELECT 
    customer_id, COUNT(*) AS no_rentals
FROM
    rental
GROUP BY customer_id;

-- Q6
SELECT 
    s.store_id, SUM(p.amount) AS total_revenue
FROM
    store s
        JOIN
    staff st ON s.manager_staff_id = st.staff_id
        JOIN
    payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- Q7 
-- film - film_id,title
-- inventory -  film_id,inventory_id,store_id
-- rental - rental_id,inventory_id,customer_id,
-- customer - customer_id,store_id,first_name,last_name

SELECT 
    f.title, c.first_name, c.last_name
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON f.film_id = i.film_id;

-- Q8 
-- film - film_id,title
-- actor - actor_id,first_name,last_name
-- film_actor - actor_id,film_id

SELECT 
    CONCAT(a.first_name, ' ',a.last_name) AS names
FROM
    actor a
        JOIN
    film_actor fa ON a.actor_id = fa.actor_id
        JOIN
    film f ON f.film_id = fa.film_id
WHERE
    f.title = upper('Gone with the Wind'); 

-- Q1
-- rental - rental_id , customer_id ,inventory_id
-- film_category - film_id , category_id
-- film - film_id , title
-- inventory - inventory_id , film_id
SELECT 
    category_id AS category, COUNT(*) AS total_rental
FROM
    film_category fc
        JOIN
    film f ON fc.film_id = f.film_id
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON r.inventory_id = i.inventory_id
GROUP BY fc.category_id;

-- Q2 
-- language - language_id ,name
-- film - film_id , title , language_id , 
SELECT 
    AVG(f.rental_rate) AS average_rental_rate,
    l.name AS language
FROM
    film f
        JOIN
    language l ON f.language_id = l.language_id
GROUP BY l.name;

-- Q3 
-- rental - rental_id , inventory_id , customer_id 
-- customer - customer_id , first_name , last_name 
-- payment - payment_id , customer_id , rental_id , amount
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS names,
    SUM(p.amount) AS total_amount
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;   

-- Q4
-- film - film_id , title
-- rental - rental_id , customer_id , inventor_id , staff_id
-- city - city_id , country_id ,city
-- inventory - inventory_id , film_id , store_id
-- customer - customer_id , store_id , address_id
-- address - address_id , city_id 

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    f.title AS rented_movie_titles
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    customer c ON r.customer_id = c.customer_id
JOIN
    address a ON c.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
WHERE
    ci.city = 'London'
ORDER BY
    customer_name, rented_movie_titles;

-- Q5
-- film - film_id , title , language_id
-- inventory - inventory_id , film_id , store_id
-- rental - rental_id , inventory_id , customer_id , staff_id

SELECT 
    f.title, COUNT(*) AS rental_count
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Q6
-- customer - customer_id , store_id , first_name ,last_name , address_id 
-- rental - rental_id , inventory_id , customer_id , staff_id
-- inventory - inventory_id , film_id , store_id 

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    i.store_id,
    COUNT(*) AS rental_count
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
WHERE
    i.store_id IN (1, 2)
GROUP BY
    c.customer_id, customer_name, i.store_id;

