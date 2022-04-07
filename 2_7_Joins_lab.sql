-- Sakila DB is used for the lab exercises.
USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT name, COUNT(*) AS cnt
FROM category c
JOIN film_category f
ON f.category_id = c.category_id
GROUP BY 1
ORDER BY cnt DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

select staff_id, first_name, last_name, sum(amount)
from staff
join payment
using(staff_id)
group by staff_id;

-- 3. Which actor has appeared in the most films?

select first_name, last_name, count(*) as cnt
from film_actor f
join actor a
using(actor_id)
group by actor_id
order by cnt desc;

-- 4. Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(*) as cnt
from rental r
join customer c
using(customer_id)
group by customer_id
order by cnt desc;

-- 5. Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address
from staff
join address
using(address_id);

-- 6. List each film and the number of actors who are listed for that film.

select title, count(*) as 'num_actors'
from film_actor
join film
using(film_id)
group by actor_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select last_name, first_name, sum(amount) as 'Payment'
from payment p
join customer c
using(customer_id)
group by c.customer_id
order by last_name desc;

-- 8. List number of films per category.

select name, count(*) as 'num_films'
from film_category fc
join category
using(category_id)
group by category_id
order by count(*) desc;