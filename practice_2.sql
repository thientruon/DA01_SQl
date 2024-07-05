--Ex1: 
SELECT DISTINCT city FROM station
WHERE id LIKE '%2'
            OR id LIKE '%4'
            OR id LIKE '%6'
            OR id LIKE '%8'
            OR id LIKE '%0';
            
--Ex2:
SELECT  
COUNT(city) - COUNT(DISTINCT city)
FROM station;


--Ex3:
SELECT 
CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM employees;


--Ex4:
SELECT
ROUND(SUM(CAST(item_count AS DECIMAL) * order_occurrences)/SUM(order_occurrences),1)
FROM items_per_order; 


--Ex5:
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

--Ex6:
SELECT 
user_id, 
MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;

--Ex7:
SELECT
card_name,
MAX(issued_amount) - MIN(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;


--Ex8:
SELECT 
manufacturer,
ABS(SUM(total_sales - cogs)) as total_loss,
COUNT(drug) as drug_count
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

--Ex9:
SELECT * FROM cinema
WHERE id IN('1', '3', '5', '7', '9') AND description <> 'boring'
ORDER BY rating DESC;

--Ex10:
SELECT 
teacher_id,
COUNT(DISTINCT subject_id) as cnt
FROM teacher 
GROUP BY teacher_id

--Ex11:
SELECT 
user_id,
COUNT(DISTINCT follower_id) as followers_count
FROM followers 
GROUP BY user_id
ORDER BY user_id

--Ex12:
SELECT 
class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5
