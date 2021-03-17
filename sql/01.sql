/*
 * Write a SQL query SELECT query that:
 * computes the number of customers who live outside of the US.
 */


SELECT COUNT(DISTINCT customer_id) AS "Number of customers living outside the US"
FROM customer
INNER  JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country_id != 103;
