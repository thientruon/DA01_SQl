-- Ex1 
SELECT 
name 
FROM students 
WHERE marks > 75 
ORDER BY RIGHT(name,3), id 


-- Ex2
SELECT 
user_id,
CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, length(name) - 1))) AS name
FROM users 
ORDER BY user_id;



-- Ex3
SELECT 
manufacturer,
'$' || ROUND(SUM(total_sales)/1000000,0) || ' '|| 'million' AS sale 
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC


-- Ex4
SELECT 
EXTRACT(month from submit_date) as mth,
product_id as product,
ROUND(AVG(stars),2)
FROM reviews
GROUP BY EXTRACT(month from submit_date), product_id 
ORDER BY EXTRACT(month from submit_date), product_id


-- Ex5
SELECT  
sender_id,
COUNT(sender_id)
FROM messages
WHERE EXTRACT(year from sent_date) = '2022' AND EXTRACT(month from sent_date) = '8'
GROUP BY sender_id
ORDER BY COUNT(sender_id) DESC
LIMIT 2


-- Ex6
SELECT 
tweet_id 
FROM tweets 
WHERE LENGTH(content) > 15 


-- Ex7
SELECT 
activity_date AS day, 
COUNT(DISTINCT user_id) AS active_users 
FROM activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


-- Ex8
SELECT 
COUNT(distinct id) as num_employee,
EXTRACT(Month from joining_date) as Month 
FROM employees
WHERE (EXTRACT(Month from joining_date) BETWEEN 1 AND 7)
    AND EXTRACT(Year from joining_date) = '2022'
GROUP BY EXTRACT(Month from joining_date)

  
-- Ex9
SELECT 
POSITION('a' IN first_name)
FROM worker 
WHERE first_name = 'Amitah'


-- Ex10
SELECT 
SUBSTRING(title FROM Position('2' IN title) FOR 4 ) AS year,
title 
FROM winemag_p2
WHERE country = 'Macedonia'

