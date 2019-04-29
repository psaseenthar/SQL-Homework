USE sakila;
#1a
SELECT first_name, last_name FROM actor;

#1b
SELECT CONCAT(first_name, ' ', last_name) AS Actor_name FROM actor;

#2a
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';

#2b
SELECT * FROM actor WHERE last_name LIKE '%GEN%';

#2c
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name, first_name;

#2d
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#3a
ALTER TABLE actor ADD COLUMN description BLOB;

#3b
ALTER TABLE actor DROP COLUMN description;

#4a
SELECT last_name, COUNT(*) AS freq FROM actor GROUP BY last_name;

#4b
SELECT last_name, COUNT(*) AS freq FROM actor GROUP BY last_name HAVING freq > 1;

#4c
SELECT * FROM actor WHERE first_name = 'GROUCHO';
UPDATE actor SET first_name = 'HARPO' WHERE actor_id = 172;

#4d
SELECT * FROM actor WHERE first_name = 'Harpo';
UPDATE actor SET first_name = 'GROUCHO' WHERE actor_id = 172;

#5a
SHOW CREATE TABLE address;

#6a
SELECT staff.first_name, staff.last_name, address.address FROM address INNER JOIN staff ON staff.address_id = address.address_id;

#6b
SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) FROM staff INNER JOIN payment ON staff.staff_id = payment.staff_id WHERE YEAR(payment_date) = 2005 AND MONTH(payment_date) = 8 GROUP BY staff_id;

#6c
SELECT film.title, COUNT(film_actor.actor_id) FROM film_actor INNER JOIN film ON film.film_id = film_actor.film_id GROUP BY film.title;

#6d
SELECT COUNT(inventory.inventory_id) FROM inventory WHERE film_id =(SELECT film_id FROM film WHERE title = 'Hunchback Impossible');

#6e
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(payment.amount) FROM customer INNER JOIN payment ON customer.customer_id = payment.customer_id GROUP BY customer.customer_id ORDER BY customer.last_name;

#7a
SELECT title FROM film  WHERE title LIKE 'K%' OR title LIKE 'Q%' AND language_id IN (SELECT language_id FROM film WHERE language_id = 1);

#7b
SELECT actor.first_name, actor.last_name FROM actor WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id IN (SELECT film_id FROM film WHERE title = 'Alone Trip'));

#7c
SELECT customer.first_name, customer.last_name, customer.email FROM customer WHERE address_id IN (SELECT address_id FROM address WHERE city_id IN (SELECT city_id FROM city WHERE country_id IN (SELECT country_id FROM country WHERE country = 'Canada')));

#7d
SELECT title FROM film WHERE film_id IN (SELECT film_id FROM film_category WHERE category_id IN (SELECT category_id FROM category WHERE name = 'Family'));

#7e
#select * from rental;
#SELECT title FROM film WHERE film_id IN (SELECT film_id FROM inventory WHERE inventory_id IN (SELECT inventory_id FROM rental));

#7f
#SELECT store.store_id FROM payment WHERE rental_id IN (SELECT rental_id FROM rental WHERE inventory_id IN (SELECT inventory_id FROM inventory WHERE store_id IN...?

#7g
