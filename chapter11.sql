-- exercise 1
SELECT CASE
    WHEN name IN ('English', 'Italian', 'French', 'Genman') THEN 'latin1'
    WHEN name IN ('Japanese', 'Mandarin') THEN 'utf8'
    ELSE 'Unkown'
  END AS character_set
FROM language;

-- exercise 2
SELECT SUM(
    CASE
      WHEN rating = 'G' THEN 1
      ELSE 0
    END
  ) AS G,
  SUM(
    CASE
      WHEN rating = 'PG' THEN 1
      ELSE 0
    END
  ) AS PG,
  SUM(
    CASE
      WHEN rating = 'PG-13' THEN 1
      ELSE 0
    END
  ) AS PG_13,
  SUM(
    CASE
      WHEN rating = 'R' THEN 1
      ELSE 0
    END
  ) AS R,
  SUM(
    CASE
      WHEN rating = 'NC-17' THEN 1
      ELSE 0
    END
  ) AS NC_17
FROM film;
