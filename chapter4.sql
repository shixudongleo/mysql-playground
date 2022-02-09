-- exercise 1
SELECT *
FROM payment
WHERE customer_id <> 5
  AND (
    amount > 8
    OR DATE(payment_date) = '2005-08-23'
  );

-- exercise 2
SELECT *
FROM payment
WHERE customer_id = 5
  AND NOT (
    amount > 6
    OR DATE(payment_date) = '2005-06-19'
  );

-- exercise 3
SELECT *
FROM payment
WHERE amount IN (1.98, 7.98, 9.98);

-- exercise 4
SELECT *
FROM customer
WHERE last_name LIKE '_A%W%';
