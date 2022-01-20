-- data window
-- localized sorting
-- different ranking functions: row_number(), rank(), dense_rank()
SELECT customer_id,
  COUNT(*) AS num_rentals,
  row_number() OVER (
    ORDER BY COUNT(*) DESC
  ) AS row_number_rank,
  rank() OVER (
    ORDER BY COUNT(*) DESC
  ) AS row_number_rank,
  dense_rank() OVER (
    ORDER BY COUNT(*) DESC
  ) AS row_number_rank
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC;

-- generate multiple rankings
SELECT customer_id,
  monthname(rental_date) AS rental_month,
  COUNT(*) AS num_retals
FROM rental
GROUP BY customer_id,
  monthname(rental_date)
ORDER BY 2,
  3 DESC;

-- add ranking among each month
SELECT customer_id,
  monthname(rental_date) AS rental_month,
  COUNT(*) AS num_rentals,
  rank() over (
    PARTITION by monthname(rental_date)
    ORDER BY COUNT(*) DESC
  ) rank_num
FROM rental
GROUP BY customer_id,
  monthname(rental_date)
ORDER BY 2,
  3 DESC;

-- use ranking / analytics result set as subquery (intermediate table)
SELECT customer_id,
  rental_month,
  num_rentals,
  rank_num
FROM (
    SELECT customer_id,
      monthname(rental_date) AS rental_month,
      COUNT(*) AS num_rentals,
      rank() over (
        PARTITION by monthname(rental_date)
        ORDER BY COUNT(*) DESC
      ) rank_num
    FROM rental
    GROUP BY customer_id,
      monthname(rental_date)
    ORDER BY 2,
      3 DESC
  ) AS t
WHERE rank_num <= 5
ORDER BY rental_month,
  num_rentals DESC;

-- reporting function
-- every row, append monthly_total, grand_total
SELECT monthname(payment_date) AS payment_month,
  amount,
  SUM(amount) over (PARTITION by monthname(payment_date)) AS monthly_total,
  SUM(amount) over () AS grand_total
FROM payment
ORDER BY monthname(payment_date);

-- every month and grand_total
SELECT monthname(payment_date) AS payment_month,
  SUM(amount) AS monthly_total,
  SUM(SUM(amount)) over () AS grand_total
FROM payment
GROUP BY monthname(payment_date);

SELECT monthname(payment_date) AS payment_month,
  SUM(amount) AS monthly_total,
  SUM(SUM(amount)) over () AS grand_total,
  (SUM(amount) / SUM(SUM(amount)) over ()) * 100 AS percent_of_total
FROM payment
GROUP BY monthname(payment_date);

-- reporting analytics can be seen as a value, calculated constant
SELECT monthname(payment_date) AS payment_month,
  SUM(amount) AS monthly_total,
  CASE
    SUM(amount)
    WHEN MAX(SUM(amount)) OVER () THEN 'HIGH'
    WHEN MIN(SUM(amount)) OVER () THEN 'LOW'
    ELSE 'Middle'
  END
FROM payment
GROUP BY monthname(payment_date);

-- rows and range
SELECT yearweek(payment_date) AS payment_week,
  SUM(amount) AS week_total,
  SUM(SUM(amount)) OVER (
    ORDER BY yearweek(payment_date) ROWS unbounded preceding
  ) AS rolling_sum
FROM payment
GROUP BY yearweek(payment_date);

SELECT yearweek(payment_date) AS payment_week,
  SUM(amount) AS week_total,
  AVG(SUM(amount)) OVER (
    ORDER BY yearweek(payment_date) ROWS BETWEEN 1 preceding AND 1 following
  ) AS rolling_3w_avg
FROM payment
GROUP BY yearweek(payment_date);

SELECT date(payment_date) AS payment_date,
  SUM(amount) AS daily_total,
  AVG(SUM(amount)) OVER (
    ORDER BY date(payment_date) RANGE BETWEEN INTERVAL 3 DAY preceding
      AND INTERVAL 3 DAY following
  ) AS 7_day_avg
FROM payment
GROUP BY date(payment_date);

-- lag and lead
SELECT payment_date,
  yearweek(payment_date) AS payment_week,
  amount
FROM payment;

SELECT yearweek(payment_date) AS payment_week,
  SUM(amount) AS week_total
FROM payment
GROUP BY yearweek(payment_date);

SELECT yearweek(payment_date) AS payment_week,
  SUM(amount) AS week_total,
  lag(SUM(amount), 1) OVER (
    ORDER BY yearweek(payment_date)
  ) AS prev_week_total,
  lead(SUM(amount), 1) OVER (
    ORDER BY yearweek(payment_date)
  ) AS next_week_total
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY yearweek(payment_date);

SELECT yearweek(payment_date) AS payment_week,
  SUM(amount) AS week_total,
  lag(SUM(amount), 1) OVER (
    ORDER BY yearweek(payment_date)
  ) AS prev_week_total,
  lead(SUM(amount), 1) OVER (
    ORDER BY yearweek(payment_date)
  ) AS next_week_total,
  ROUND(
    (
      SUM(amount) - lag(SUM(amount), 1) OVER (
        ORDER BY yearweek(payment_date)
      )
    ) / lag(SUM(amount), 1) OVER (
      ORDER BY yearweek(payment_date)
    ) * 100,
    1
  ) AS percent_diff
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY yearweek(payment_date);

-- group_concat
SELECT f.title,
  GROUP_CONCAT(
    a.last_name
    ORDER BY a.last_name SEPARATOR '; '
  ) AS actors
FROM actor AS a
  INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
  INNER JOIN film AS f ON fa.film_id = f.film_id
GROUP BY f.title;
