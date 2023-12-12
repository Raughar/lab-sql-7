use sakila;

-- Getting the actors whose last names are not repeated:
select first_name, last_name
from actor
where last_name in (
    select last_name
    from actor
    group by last_name
    having COUNT(*) = 1)
order by first_name asc;

-- Getting the last names that appear more than two times:
select first_name, last_name
from actor
where last_name in (
    select last_name
    from actor
    group by last_name
    having count(*) >= 2)
order by first_name asc;

-- Getting how many rentals were processed by every employee:
select count(rental_id) as Number_of_Rentals, staff_id
from rental
group by staff_id;

-- Getting how many films were released each year:
select count(film_id) as Number_of_Films, release_year
from film
group by release_year;

-- Getting how many films were for each rating:
select count(film_id) as Number_of_Films, rating
from film
group by rating;

-- Getting the median length of films for each rating type, rounding it to two decimals:
select round(avg(`length`), 2) as Rounded_Median_Length, rating
from film
group by rating;

-- Getting how many films by rating have a mean duration of 2 hours:
select rating, count(film_id) as Number_of_Films, avg(`length`) as Mean_Length
from film
group by rating
having avg(`length`) > 120;