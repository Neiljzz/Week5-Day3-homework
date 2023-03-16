--1.List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, a.district 
from customer c
join address a 
on c.address_id = a.address_id
where a.district = 'Texas';



--2. List all payments of more than $7.00 with the customer’s first and last name
select c.first_name, c.last_name, p.*
from customer c 
join payment p 
on c.customer_id = p.customer_id 
where p.amount >= 7.00;

--3. Show all customer names who have made over $175 in payments (use
--subqueries)
select c.first_name, c.last_name
from customer c 
where customer_id in (
	select p.customer_id
	from payment p 
	group by p.customer_id
	having sum(p.amount) > 175);

--4. List all customers that live in Argentina (use the city table)
select *
from address
where address.district = 'Argentina'



--5. Show all the film categories with their count in descending order
select category.name as category_name, count(*) as category_count
from category
join film_category 
on category.category_id = film_category.category_id
group by category.name
order by category_count desc;

--6. What film had the most actors in it (show film info)?
select film.title, count(*) as actor_count
from film
join film_actor 
on film.film_id = film_actor.film_id
group by film.film_id
order by actor_count desc
limit 1;

--7. Which actor has been in the least movies?

select a.first_name, a.last_name, count(*) as movie_count
from actor a 
join film_actor
on a.actor_id = film_actor.actor_id
group by a.actor_id
order by movie_count asc 
limit 1;

--8. Which country has the most cities?
select country.country, count(*)as city_count
from country
join city
on country.country_id = city . country_id
group by country.country_id 
order by city_count desc 
limit 1;

--9. List the actors who have been in between 20 and 25 films.

select a.first_name, a.last_name, count(*) as film_count
from actor a 
join film_actor fa 
on fa.actor_id = a.actor_id
group by a.actor_id 
having count(*) between 20 and 25
order by count(*) asc;






