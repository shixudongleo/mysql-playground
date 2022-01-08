-- combine customer.customer_id, customer.store_id and city.city_id, city.city
SELECT customer_id,
  store_id
FROM customer
UNION
SELECT city_id,
  city
FROM city;

-- union of two select statements
SELECT 1 AS num,
  'abc' AS str
UNION
SELECT 9 AS num,
  'xyz' AS str;

-- UNION ALL customer, actor
SELECT 'CUST' AS typ,
  c.first_name,
  c.last_name
FROM customer AS c
UNION ALL
SELECT 'ACTOR' AS typ,
  a.first_name,
  a.last_name
FROM actor AS a;

-- UNION customer, actor
SELECT 'CUST' AS typ,
  c.first_name,
  c.last_name
FROM customer AS c
UNION
SELECT 'ACTOR' AS typ,
  a.first_name,
  a.last_name
FROM actor AS a;

-- UNION ALL customer and actor with fitlers
SELECT c.first_name,
  c.last_name
FROM customer AS c
WHERE c.first_name LIKE 'J%'
  AND c.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name,
  a.last_name
FROM actor AS a
WHERE a.first_name LIKE 'J%'
  AND a.last_name LIKE 'D%';

-- UNION customer and actor with fitlers
SELECT c.first_name,
  c.last_name
FROM customer AS c
WHERE c.first_name LIKE 'J%'
  AND c.last_name LIKE 'D%'
UNION
SELECT a.first_name,
  a.last_name
FROM actor AS a
WHERE a.first_name LIKE 'J%'
  AND a.last_name LIKE 'D%';

-- INTERSECT
SELECT c.first_name,
  c.last_name
FROM customer AS c
WHERE c.first_name LIKE 'J%'
  AND c.last_name LIKE 'D%'
INTERSECT
SELECT a.first_name,
  a.last_name
FROM actor AS a
WHERE a.first_name LIKE 'J%'
  AND a.last_name LIKE 'D%';

-- EXCEPT
SELECT c.first_name,
  c.last_name
FROM customer AS c
WHERE c.first_name LIKE 'J%'
  AND c.last_name LIKE 'D%'
EXCEPT
SELECT a.first_name,
  a.last_name
FROM actor AS a
WHERE a.first_name LIKE 'J%'
  AND a.last_name LIKE 'D%';

-- exercise 6-2
-- DESCRIBE customer;
-- DESCRIBE actor;
SELECT first_name,
  last_name
FROM customer
WHERE last_name LIKE 'L%'
UNION
SELECT first_name,
  last_name
FROM actor
WHERE last_name LIKE 'L%';

-- exercise 6-2
SELECT first_name,
  last_name
FROM customer
WHERE last_name LIKE 'L%'
UNION
SELECT first_name,
  last_name
FROM actor
WHERE last_name LIKE 'L%'
ORDER BY last_name;
