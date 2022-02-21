-- exercise1
SELECT SUBSTRING(
    'Please find the substring in this string',
    17,
    9
  ) AS substring;

-- exercise2
SELECT ABS(-25.76823) AS abs_value,
  SIGN(-25.76823) AS sign_value,
  ROUND(-25.76823, 2) AS round_value;

-- exercise3
SELECT EXTRACT(
    MONTH
    FROM CURRENT_DATE()
  ) AS curr_month;
