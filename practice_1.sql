-- Ex1:
SELECT DISTINCT Name FROM city 
WHERE population > 120000 AND Countrycode = "USA";

-- Ex2: 
SELECT * FROM city 
WHERE countrycode = "JPN";
  
-- Ex3: 
SELECT city, state FROM station;

--Ex4:
SELECT DISTINCT city FROM station 
WHERE city LIKE 'a%' 
        OR city LIKE 'e%'
        OR city LIKE 'i%' 
        OR city LIKE 'o%'
        OR city LIKE 'u%';

--Ex5: 
SELECT DISTINCT city FROM station 
WHERE city LIKE '%a' 
        OR city LIKE '%e' 
        OR city LIKE '%i' 
        OR city LIKE '%o' 
        OR city LIKE '%u';

--Ex6: 
SELECT DISTINCT city FROM station 
WHERE city NOT LIKE 'A%'
              AND city NOT LIKE 'E%'
              AND city NOT LIKE 'I%'
              AND city NOT LIKE 'O%'
              AND city NOT LIKE 'U%';

--Ex7: 
SELECT name FROM Employee 
ORDER BY name;

--Ex8: 
SELECT name FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id; 

--Ex9:
SELECT product_id FROM products 
WHERE low_fats = 'Y' AND recyclable = 'Y';

--Ex10: 
SELECT name FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL;

--Ex11: 
SELECT name, population, area FROM World 
WHERE area >= 3000000 OR population >= 25000000;

--Ex12: 
SELECT DISTINCT author_id AS id FROM Views 
WHERE viewer_id = author_id
ORDER BY author_id;

--Ex13: 
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL;

--Ex14: 
select * from lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;

--Ex15: 
select advertising_channel from uber_advertising
WHERE money_spent > 100000 AND year = 2019;
