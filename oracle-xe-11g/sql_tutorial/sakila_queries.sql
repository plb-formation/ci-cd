-- Acteurs par film
SELECT  actor.first_name, 
        actor.last_name, 
        film.title 
FROM actor, film, film_actor 
WHERE film_actor.actor_id = actor.actor_id 
AND film_actor.film_id = film.film_id;

-- Meme query avec des inner join
SELECT actor.first_name, actor.last_name, film.title 
FROM film_actor 
INNER JOIN actor ON film_actor.actor_id = actor.actor_id 
INNER JOIN film ON film_actor.film_id = film.film_id;


-- liste des DVD qui n'ont pas ete rendus 
explain analyse SELECT last_name ||','||first_name AS customer,
    address.phone, film.title
    FROM rental INNER JOIN customer ON rental.customer_id = customer.customer_id
    INNER JOIN address ON customer.address_id = address.address_id
    INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
    INNER JOIN film ON inventory.film_id = film.film_id
    WHERE rental.return_date IS NULL 
    AND rental_date  < NOW()
    LIMIT 20;






