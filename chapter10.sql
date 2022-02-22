--exercise1
WITH Customer AS (
  SELECT 1 AS Customer_id,
    'John Smith' AS Name
  UNION ALL
  SELECT 2 AS Customer_id,
    'Kathy Jones' AS Name
  UNION ALL
  SELECT 3 AS Customer_id,
    'Greg Oliver' AS Name
),
Payment AS (
  SELECT 101 AS Payment_id,
    1 AS Customer_id,
    8.99 AS Amount
  UNION ALL
  SELECT 102 AS Payment_id,
    2 AS Customer_id,
    4.99 AS Amount
  UNION ALL
  SELECT 103 AS Payment_id,
    1 AS Customer_id,
    7.99 AS Amount
)
SELECT c.Name,
  SUM(p.Amount) AS total
FROM Customer AS c
  LEFT OUTER JOIN Payment AS p ON c.Customer_id = p.Customer_id
GROUP BY c.Name;

-- exercise2
WITH Customer AS (
  SELECT 1 AS Customer_id,
    'John Smith' AS Name
  UNION ALL
  SELECT 2 AS Customer_id,
    'Kathy Jones' AS Name
  UNION ALL
  SELECT 3 AS Customer_id,
    'Greg Oliver' AS Name
),
Payment AS (
  SELECT 101 AS Payment_id,
    1 AS Customer_id,
    8.99 AS Amount
  UNION ALL
  SELECT 102 AS Payment_id,
    2 AS Customer_id,
    4.99 AS Amount
  UNION ALL
  SELECT 103 AS Payment_id,
    1 AS Customer_id,
    7.99 AS Amount
)
SELECT c.Name,
  SUM(p.Amount) AS total
FROM Payment AS p
  RIGHT OUTER JOIN Customer AS c ON c.Customer_id = p.Customer_id
GROUP BY c.Name;

-- exercise 3
-- construct 0 - 100 using ones, tens and hundreds
WITH ones AS (
  SELECT 0 AS num
  UNION ALL
  SELECT 1 AS num
  UNION ALL
  SELECT 2 AS num
  UNION ALL
  SELECT 3 AS num
  UNION ALL
  SELECT 4 AS num
  UNION ALL
  SELECT 5 AS num
  UNION ALL
  SELECT 6 AS num
  UNION ALL
  SELECT 7 AS num
  UNION ALL
  SELECT 8 AS num
  UNION ALL
  SELECT 9 AS num
),
tens AS (
  SELECT 0 AS num
  UNION ALL
  SELECT 10 AS num
  UNION ALL
  SELECT 20 AS num
  UNION ALL
  SELECT 30 AS num
  UNION ALL
  SELECT 40 AS num
  UNION ALL
  SELECT 50 AS num
  UNION ALL
  SELECT 60 AS num
  UNION ALL
  SELECT 70 AS num
  UNION ALL
  SELECT 80 AS num
  UNION ALL
  SELECT 90 AS num
),
hundreds AS (
  SELECT 0 AS num
  UNION ALL
  SELECT 100 AS num
)
SELECT ones.num + tens.num + hundreds.num AS sequence
FROM ones
  CROSS JOIN tens
  CROSS JOIN hundreds
WHERE ones.num + tens.num + hundreds.num <= 100
ORDER BY 1;

WITH ones AS (
  SELECT 0 AS num
  UNION ALL
  SELECT 1 AS num
  UNION ALL
  SELECT 2 AS num
  UNION ALL
  SELECT 3 AS num
  UNION ALL
  SELECT 4 AS num
  UNION ALL
  SELECT 5 AS num
  UNION ALL
  SELECT 6 AS num
  UNION ALL
  SELECT 7 AS num
  UNION ALL
  SELECT 8 AS num
  UNION ALL
  SELECT 9 AS num
),
tens AS (
  SELECT 0 AS num
  UNION ALL
  SELECT 10 AS num
  UNION ALL
  SELECT 20 AS num
  UNION ALL
  SELECT 30 AS num
  UNION ALL
  SELECT 40 AS num
  UNION ALL
  SELECT 50 AS num
  UNION ALL
  SELECT 60 AS num
  UNION ALL
  SELECT 70 AS num
  UNION ALL
  SELECT 80 AS num
  UNION ALL
  SELECT 90 AS num
)
SELECT ones.num + tens.num + 1 AS sequence
FROM ones
  CROSS JOIN tens
ORDER BY 1;
