--Q) How many actors are there with the last name ‘Wahlberg’?
--A) 2
 select  * from actor 
 where  last_name = 'Wahlberg';
 
--Q)How many payments were made between $3.99 and $5.99? 
--A) 5607
select  count(amount)
from payment 
where amount between 3.99 and 5.99


--Q)What film does the store have the most of?          
--A)193 789 730 378 595 849 231 586 69 764 745 1 767 369 738 638 31 356 199 683 127 609 403 174 266 109 434 220 239 873 893 468 525 897 697 835 773 945 444 412 880 846 331 911 621 301 1000 361 91 200 358 973 350 559 86 489 382 702 531 856 870 295 206 73 418 460 103 341 748 500 753 572
-- all the film_id have count of 8
select film_id, Count(film_id)
from inventory 
group by film_id 
order by count(film_id) desc; 


--Q)How many customers have the last name ‘William’?
--A)0
select count(last_name), last_name
from customer 
where last_name = 'William'
group by last_name 

--Q)What store employee sold the most rentals?
--A) staff_id 1 sold 8040 rentals
select count(staff_id) , staff_id 
from rental 
group by staff_id 
order by staff_id desc;

--Q)How many different district names are there?
--A)387
select count(distinct district) 
from address

--What film has the most actors in it? 
--A) film-id 508 -15
select count(film_id) as no_actors, film_id 
from film_actor
group by film_id 
order by no_actors desc
limit 1;

--Q)From store_id 1, how many customers have a last name ending with ‘es’?
--A) 13
select store_id, count(last_name)
from customer 
where last_name like '%es' and store_id = 1
group by store_id 

--Q)How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  
--with ids between 380 and 430? (use group by and having > 250)
--A) 0
select amount, count(rental_id) , customer_id
from payment 
where amount>= 4.99 and customer_id between 380 and 430 
group by customer_id , amount 
having count(rental_id) >250

--Q)Within the film table, how many rating categories are there? And what rating has the most movies total?
--A) 5 rating categories.  PG-13 has the most movies total
select count(distinct rating) from film 

select rating , count(rating)
from film 
group by rating
order by count(rating) desc;