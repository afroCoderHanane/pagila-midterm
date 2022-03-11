/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */
SELECT 
	DISTINCT film.title
FROM film 
    JOIN film_category USING (film_id)
    JOIN category USING(category_id)
WHERE 
	film.title 

		IN 

    		(
                 SELECT
			 film.title 
                 FROM film 
                 WHERE
		 	rating='NC-17'
			OR
			rating='R'
                 )
                 
	AND 

	name='Children'
;
