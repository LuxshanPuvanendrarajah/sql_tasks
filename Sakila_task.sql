-- Sakila database
-- Question 1 List all actors
SELECT * FROM actor;
-- Question 2 Find the surname of the actor with the forename 'John'.
SELECT * FROM actor WHERE first_name='john';
-- Question 3 Find all actors with surname 'Neeson'.
SELECT * FROM actor WHERE last_name='Neeson';
-- Question 4 Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE actor_id %10=0;
-- Question 5 What is the description of the movie with an ID of 100?
SELECT * FROM film WHERE film_id = 100;
-- Question 6 Find every R-rated movie.
SELECT * FROM film WHERE rating='R';
-- Question 7 Find every non-R-rated movie.
SELECT * FROM film WHERE rating !='R';
-- Question 8 Find the ten shortest movies.
SELECT * FROM film ORDER BY length ASC LIMIT 10;
-- Question 9 Find the movies with the longest runtime, without using LIMIT.
SELECT title FROM film WHERE length=(SELECT max(length) FROM film);
-- Question 10 Find all movies that have deleted scenes.
SELECT * FROM film WHERE special_features = 'deleted scenes';
-- Question 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name 
FROM actor 
GROUP BY last_name 
HAVING COUNT(*)>=1 
ORDER BY last_name 
DESC;
-- Question 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name 
FROM actor 
GROUP BY last_name 
HAVING COUNT(*)>=2 
ORDER BY count(last_name) DESC;
-- Question 13 Which actor has appeared in the most films?
SELECT a.first_name , a.last_name,COUNT(f.film_id)
FROM actor a
INNER JOIN film_actor f ON a.actor_id=f.actor_id
GROUP BY f.actor_id 
ORDER BY COUNT(f.film_id) DESC;
-- Question 14 When is 'Academy Dinosaur' due?
SELECT f.title , DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY) AS due_date
FROM inventory i
JOIN film f ON i.film_id=f.film_id
JOIN rental r ON i.inventory_id=r.inventory_id
WHERE f.title ='Academy Dinosaur' AND r.return_date IS NULL;
-- Question 15 What is the average runtime of all films?
SELECT AVG(length) FROM Film;
-- Question 16 List the average runtime for every film category.
Select AVG(f.length),c.`name`
FROM film f
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON fc.category_id=c.category_id
GROUP BY c.name
ORDER BY AVG(f.length);
-- Question 17 List all movies featuring a robot.
SELECT * FROM film WHERE `description`LIKE '%robot%';
-- Question 18 How many movies were released in 2010?
SELECT COUNT(release_year) FROM film WHERE release_year=2010;
-- Question 19 Find the titles of all the horror movies.
Select f.title,c.`name`
FROM film f
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON fc.category_id=c.category_id
WHERE c.name ='horror';
-- Question 20 List the full name of the staff member with the ID of 2.
SELECT first_name,last_name FROM staff WHERE staff_id = 2;
-- Question 21 List all the movies that Fred Costner has appeared in.
Select f.title,a.first_name,a.last_name
FROM film f
JOIN film_actor fa ON f.film_id=fa.film_id
JOIN actor a ON fa.actor_id=a.actor_id
WHERE a.first_name='Fred' AND a.last_name='Costner';
-- Question 22 How many distinct countries are there?
SELECT DISTINCT COUNT(country) FROM country;
-- Question 23 List the name of every language in reverse-alphabetical order.
SELECT * FROM `language` ORDER BY `name` DESC;
-- Question 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name,last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;
-- Question 25 Which category contains the most films?
Select c.`name`,count(f.category_id)
FROM category c
JOIN film_category f ON c.category_id=f.category_id
group by c.category_id
ORDER BY COUNT(f.category_id) desc limit 1 ;

