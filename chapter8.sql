-- exercise1
SELECT COUNT(*)
FROM payment;

-- exercise2
SELECT customer_id,
  COUNT(*)
FROM payment
GROUP BY customer_id;

-- exercise3
SELECT customer_id,
  COUNT(*) AS num_count
FROM payment
GROUP BY customer_id
HAVING num_count >= 40;
