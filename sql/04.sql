/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

WITH relevant_actors AS (
	SELECT DISTINCT actor_id
	FROM actor
	INNER JOIN film_actor USING(actor_id)
	WHERE film_id = 21 -- 21 is the film_id of AMERICAN CIRCUS
)

SELECT DISTINCT title
FROM (
	SELECT title, COUNT(DISTINCT actor_id)
	FROM film
	INNER JOIN film_actor USING(film_id)
	INNER JOIN relevant_actors USING(actor_id)
	GROUP BY title
) t
WHERE count >= 2 AND title != 'AMERICAN CIRCUS'
ORDER BY title;
