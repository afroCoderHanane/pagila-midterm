/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */
SELECT 
	DISTINCT film.title
FROM film 
  JOIN inventory USING (film_id)
  JOIN rental USING (inventory_id)
WHERE 
	film_id 
	NOT IN
        (
	SELECT 
		film_id 
	FROM film 
	  JOIN film_actor using (film_id) 
	  JOIN actor using (actor_id) 
	WHERE 
		actor.first_name SIMILAR TO '%F%' 
		OR
		actor.last_name SIMILAR TO '%F%'
	)
	AND 

	customer_id 

	NOT IN 
	(
	SELECT 
		customer_id 
 	FROM customer 
	WHERE 
		first_name SIMILAR TO '%F%' 
 		OR
	   	last_name SIMILAR TO '%F%'
        ) 
	AND
	film.title NOT SIMILAR TO '%F%' 
;
