-- Ex1
SELECT
b.continent, 
FLOOR(AVG(a.population))
FROM city AS a INNER JOIN country AS b
ON a.countrycode = b.code
WHERE a.id IS NOT NULL
GROUP BY b.continent
ORDER BY ROUND(AVG(a.population),0) ASC


-- Ex2
SELECT 
ROUND(CAST(SUM(CASE
  WHEN texts.signup_action = 'Confirmed' THEN 1
END) AS decimal) / COUNT(signup_action), 2 ) AS confirm_rate
FROM emails INNER JOIN texts 
ON emails.email_id = texts.email_id 

--Ex3
SELECT 
age_bucket,
ROUND(SUM(CASE WHEN activity_type = 'send' THEN time_spent
END)/ SUM(CASE WHEN activity_type IN ('send', 'open') THEN time_spent END) * 100.0, 2) AS send_perc,
ROUND(SUM(CASE WHEN activity_type = 'open' THEN time_spent
END)/ SUM(CASE WHEN activity_type IN ('send', 'open') THEN time_spent END) * 100.0, 2) AS open_perc
FROM activities AS a INNER JOIN age_breakdown AS b 
ON a.user_id = b.user_id 
GROUP BY age_bucket

--Ex4
SELECT 
c.customer_id
FROM customer_contracts AS c INNER JOIN products AS p   
ON c.product_id = p.product_id 
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_category) >= 3


--Ex5
SELECT 
b.employee_id,
b.name,
COUNT(a.employee_id) AS reports_count,
ROUND(AVG(a.age)) AS average_age
FROM employees AS a LEFT JOIN employees AS b
ON a.reports_to = b.employee_id
GROUP BY b.employee_id, b.name
HAVING b.employee_id IS NOT NULL 
ORDER BY b.employee_id


-- Ex6 
SELECT 
p.product_name,
SUM(o.unit) AS unit
FROM products AS p LEFT JOIN orders AS o
ON p.product_id = o.product_id
WHERE EXTRACT(month FROM o.order_date) = '2' AND EXTRACT(year FROM o.order_date) = '2020' 
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100


--Ex7
SELECT 
a.page_id
FROM pages AS a LEFT JOIN page_likes AS b 
ON a.page_id = b.page_id
WHERE b.page_id IS NULL
ORDER BY page_id 
