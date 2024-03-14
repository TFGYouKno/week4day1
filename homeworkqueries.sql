-- How many actors are there with the last name ‘Wahlberg’? 
 1. select * FROM actor WHERE last_name = 'Wahlberg' (2)
 
 
-- 2. How many payments were made between $3.99 and $5.99? 
 2. select * FROM payment WHERE amount BETWEEN 3.99 and 5.99 (17,508)
 
 
-- 3. What film does the store have the most of? (search in inventory) 
SELECT film_id, count(film_id)
FROM inventory 
group by film_id
order by count(film_id) desc

 
 
-- 4. How many customers have the last name ‘William’? 
 SELECT * FROM customer WHERE last_name = 'William'
 --this one i couldn't get to work properly for some reason
 
-- 5. What store employee (get the id) sold the most rentals? 
 
 SELECT staff_id, COUNT(rental_id) AS num_rentals_sold
FROM rental
GROUP BY staff_id
ORDER BY num_rentals_sold DESC
LIMIT 1;
-- Mike with 8,040
 
-- 6. How many different district names are there? 
 SELECT COUNT(DISTINCT district) AS num_districts
FROM address;
 --378--
 
-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
 SELECT film_id, COUNT(actor_id) AS num_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_actors DESC
LIMIT 1;
 --film id 508, which is Lamb Cincinatti--
 
-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
 
 SELECT COUNT(*) AS num_customers
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';
--13 customers--
 
-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  
-- with ids between 380 and 430? (use group by and having > 250) 
 
 SELECT amount, COUNT(rental_id) AS num_rentals
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
--$2.99: 290
--$4.99: 281
--$0.99: 269
 
-- 10.  Within the film table, how many rating categories are there? And what rating has the most 
-- movies total? 

SELECT COUNT(DISTINCT rating) AS num_rating_categories
FROM film;

--5 different rating categories (i didn't need code to tell you that ;) )

SELECT rating, COUNT(*) AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC
LIMIT 1;

--223 PG-13 movies
