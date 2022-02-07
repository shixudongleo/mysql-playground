-- exercise 1
SELECT *
FROM category
WHERE name = 'Action';

SELECT *
FROM film_category
WHERE category_id IN (
    SELECT category_id
    FROM category
    WHERE name = 'Action'
  );

-- exercise 2
-- idea: use table film_category each row's category_id, query category table there is more record hits
SELECT *
FROM film_category AS fc
WHERE EXISTS (
    SELECT *
    FROM category cat
    WHERE cat.category_id = fc.category_id
      AND cat.name = 'Action'
  );

-- exercise 3
SELECT 'Hollywood Star' LEVEL,
  30 min_roles,
  99999 max_roles
UNION ALL
SELECT 'Prolific Actor' LEVEL,
  20 min_roles,
  29 max_roles
UNION ALL
SELECT 'Newcomer' LEVEL,
  1 min_roles,
  19 max_roles
SELECT actor_id,
  COUNT(film_id) AS num_films
FROM film_actor
GROUP BY actor_id
SELECT agg.actor_id,
  ref.level,
  agg.num_films,
  ref.min_roles,
  ref.max_roles
FROM (
    SELECT actor_id,
      COUNT(film_id) AS num_films
    FROM film_actor
    GROUP BY actor_id
  ) AS agg
  INNER JOIN (
    SELECT 'Hollywood Star' LEVEL,
      30 min_roles,
      99999 max_roles
    UNION ALL
    SELECT 'Prolific Actor' LEVEL,
      20 min_roles,
      29 max_roles
    UNION ALL
    SELECT 'Newcomer' LEVEL,
      1 min_roles,
      19 max_roles
  ) AS ref ON agg.num_films BETWEEN ref.min_roles AND max_roles;
