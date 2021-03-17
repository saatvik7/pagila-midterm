/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM (
	SELECT first_name, last_name, actor_id
	FROM actor
	INNER JOIN film_actor USING(actor_id)
	INNER JOIN film_category USING(film_id)
	WHERE category_id != 11 -- 11 is the category_id for Horror
) t
INNER JOIN film_actor USING(actor_id)
INNER JOIN film_category USING(film_id)
WHERE category_id = 3 -- 3 is the category_id for Children
ORDER BY "Actor Name";

