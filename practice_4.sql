-- Ex1: 
SELECT 
SUM(CASE
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) AS laptop_views, 
SUM(CASE
  WHEN device_type = 'tablet' OR device_type = 'phone' THEN 1
  ELSE 0
END) AS mobile_views
FROM viewership

-- Ex2: 
/* Bài này có một chút lí thuyết về toán: để 3 cạnh tạo nên được 1 tam giác thì có định luật rằng tổng 2 cạnh nhỏ hơn phải lớn cạnh còn lại (bất đẳng thức tam giác) */ 
SELECT 
*, 
CASE
    WHEN x >= y AND x >= z AND y + z > x THEN 'Yes'
    WHEN y >= x AND y >= z AND x + z > y THEN 'Yes'
    WHEN z >= x AND z >= y AND x + y > z THEN 'Yes'
    ELSE 'No' 
END triangle
FROM triangle;


--Ex3: 
SELECT
ROUND((CAST(SUM(CASE 
  WHEN call_category IS NULL or call_category = 'n/a' THEN 1
  ELSE 0
END) AS decimal) / COUNT(*)) * 100,1) AS uncategorised_call_pct
FROM callers;


--Ex4: 
select 
survived,
SUM(CASE 
    WHEN pclass = 1 AND survived = 1 THEN 1
    WHEN pclass = 1 AND survived = 0 THEN 1
    ELSE 0
END) AS first_class,
SUM(CASE 
    WHEN pclass = 2 AND survived = 1 THEN 1 
    WHEN pclass = 2 AND survived = 0 THEN 1
    ELSE 0
END) AS second_class,
SUM(CASE 
    WHEN pclass = 3 AND survived = 1 THEN 1
    WHEN pclass = 3 AND survived = 0 THEN 1
    ELSE 0
END) AS third_class
from titanic
GROUP BY survived
