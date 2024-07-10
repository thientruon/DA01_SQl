--Ex1
SELECT 
COUNT(DISTINCT company_id) AS duplicate_companies
FROM (SELECT
        company_id,
        COUNT(title) AS title_count,
        COUNT(description) AS desp_count
      FROM job_listings
      GROUP BY company_id
  ) AS job_count
WHERE title_count > 1

--Ex2
SELECT 
category,
product,
spend AS total_spend
FROM (
SELECT SUM(spend) AS spend, 
        category, 
        product,
        RANK() OVER (
        PARTITION BY category 
        ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend 
  WHERE EXTRACT(year FROM transaction_date) = '2022'
  GROUP BY category, product
  ORDER BY SUM(spend) DESC, category DESC
) AS spend_table
WHERE ranking <= 2 
ORDER BY category


--Ex3
SElECT
COUNT(call_made) AS policy_holder_count
FROM(
  SELECT
  policy_holder_id,
  COUNT(DISTINCT case_id) as call_made 
  FROM callers 
  GROUP BY policy_holder_id
  HAVING COUNT(DISTINCT case_id) >= 3
) AS t


--Ex5
SELECT
    7 AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM
    user_actions
WHERE
    user_id IN (
        SELECT DISTINCT user_id
        FROM user_actions
        WHERE EXTRACT(month FROM event_date) = 6
          AND EXTRACT(year FROM event_date) = 2022
          AND event_type IN ('sign-in', 'like', 'comment')
    )
    AND EXTRACT(month FROM event_date) = 7
    AND EXTRACT(year FROM event_date) = 2022
    AND event_type IN ('sign-in', 'like', 'comment'


--Ex6
WITH approved_transactions AS (
    SELECT 
        TO_CHAR(trans_date, 'YYYY-MM') as month,
        country,
        COUNT(state) as approved_count,
        SUM(amount) as approved_total_amount
    FROM transactions
    WHERE state = 'approved'
    GROUP BY country, TO_CHAR(trans_date, 'YYYY-MM')
)
SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') as month,
    t.country,
    COUNT(t.state) as trans_count,
    COALESCE(at.approved_count,0) as approved_count,
    SUM(t.amount) as trans_total_amount,
    COALESCE(at.approved_total_amount,0) as approved_total_amount
FROM transactions t 
LEFT JOIN approved_transactions at
ON t.country = at.country 
AND TO_CHAR(trans_date, 'YYYY-MM') = at.month
GROUP BY t.country, TO_CHAR(t.trans_date, 'YYYY-MM'), at.approved_count, at.approved_total_amount
ORDER BY month

        
--Ex7
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id
)

--Ex8
SELECT 
    customer_id
FROM customer 
GROUP BY customer_id 
HAVING COUNT (DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM product)


--Ex9
SELECT employee_id
FROM employees
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM employees) 
ORDER BY employee_id;


--Ex11
SELECT 
    u.name
FROM users u INNER JOIN movierating m
ON u.user_id = m.user_id 
WHERE m.rating IN (
    SELECT 
        u.user_id,
        COUNT(rating)
    FROM movierating
    GROUP BY u.user_id 
)

-- SELECT 
--     s.title
-- FROM movies s INNER JOIN movierating m
-- ON s.movie_id = m.movie_id
-- WHERE m.rating >= (
--     SELECT 
--         MAX(rating)
--     FROM movierating
-- ) 







