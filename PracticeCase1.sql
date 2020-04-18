/*1. A customer wants to know the film about "Astronaut". How many recommendations could you give for him?*/
select count(title) from film where description ilike '%astronaut%'

/*2. I wonder, how many film have a rating of "R" and a replacement cost between $5 and %15?*/
select rating, count(rating) as total from film where rating='R' and replacement_cost between 5 and 15 group by rating

/*3. We have two staff members with staff IDs 1 and 2. We want to give a bonus to the staff member 
 * that handled the most payments. 
 * How many payments did each staff member handle? 
 * and how much was the total amount processed by each staff member?*/
select staff_id, count(payment_id) as total_payment, sum(amount) as total_amount from payment group by staff_id 

/*4. Corporate headquarter is auditing the store, they want to know the average replacement cost of movies by rating.*/
select rating, avg(replacement_cost) as avg_replacement_cost from film group by rating 

/*5. We want to send coupons to the 5 customers who have spent the most amount of money. 
 * Get the customer name, email, and their spent amount!*/
select p.customer_id, sum(p.amount) as spent_amount, concat(c.first_name, ' ', c.last_name) as customer_name, c.email 
from payment as p 
inner join customer as c
on p.customer_id=c.customer_id
group by p.customer_id, c.email, customer_name, c.email 
order by spent_amount desc limit 5;

/*6. We want to audit our stock of films in all of our stores. 
 * How many copies of each movie in each store do we have?*/
select distinct film_id, count(film_id) as total_film, store_id 
from inventory 
group by film_id, store_id order by store_id, film_id asc


/*7. We want to know what customers are eligible for our platinum credit card. 
 * The requirements are that the customer has at least a total of 40 transaction payments. 
 * Get the customer name, email who are eligible for the credit card!*/
select p.customer_id, count(p.payment_id) as total_transaction, concat(c.first_name, ' ', c.last_name) as customer_name, c.email
from payment as p
inner join customer as c
on p.customer_id=c.customer_id
group by p.customer_id, c.email, customer_name, c.email 
having count(p.payment_id) >= 40 order by total_transaction desc




