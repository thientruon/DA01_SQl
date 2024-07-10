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
EXTRACT(month FROM event_date) as month,
uses as monthly_active_users 
FROM (SELECT
        event_type,
        user_id,
        event_date,
        COUNT(user_id) AS uses
      FROM user_actions
      WHERE (EXTRACT(month FROM event_date) = '7' OR EXTRACT(month FROM event_date) = '6')
      AND EXTRACT(year FROM event_date) = 2022 
      GROUP BY event_type, user_id, event_date
      HAVING event_type IN ('sign-in', 'like', 'comment') 
) AS tab
GROUP BY EXTRACT(month FROM event_date), uses  


--Ex6





