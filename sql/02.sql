/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it.
 */
-- I realize that the question does not explicitly ask to display the number of
-- customers, but I added it just to be safe.

SELECT country, COUNT(DISTINCT customer.customer_id) AS "Number of Customers"
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
GROUP BY country
ORDER BY "Number of Customers" DESC
LIMIT 1;
