--exercise1
SELECT c.first_name,
  c.last_name,
  a.address,
  ct.city
FROM customer c
  INNER JOIN address a ON c.address_id = a.address_id
  INNER JOIN city ct ON a.city_id = ct.city_id
WHERE a.district = 'California';

-- exercise2
SELECT f.title
FROM film AS f
  INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
  INNER JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'JOHN';

-- exercise3
SELECT addr1.address,
  addr2.address,
  addr1.city_id,
  addr2.city_id
FROM address AS addr1
  INNER JOIN address AS addr2 ON addr1.city_id = addr2.city_id
  AND addr1.address_id != addr2.address_id
ORDER BY addr1.city_id;
