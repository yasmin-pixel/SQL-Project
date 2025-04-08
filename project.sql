-- Basic SQL --

SELECT * FROM employee_salary
WHERE occupation = 'office Manager';

SELECT * FROM employee_salary
WHERE first_name = 'Les';

SELECT * FROM employee_salary
WHERE salary >=  50000 ;

SELECT * FROM employee_salary
WHERE salary <=  50000 ;

SELECT * 
FROM employee_demographics
WHERE gender !='Female';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01';
 
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01' AND gender = 'male';

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;


 
 SELECT * 
 FROM employee_demographics
 ORDER BY age DESC;

 SELECT * 
 FROM employee_demographics
 WHERE gender = 'female' AND first_name LIKE 'A%';
 
 SELECT gender, AVG(age)
 FROM employee_demographics
 GROUP BY gender
 HAVING AVG(age) > 40
 ;
 

 SELECT * 
 FROM employee_salary
 WHERE occupation= 'Director of Parks and Recreation' OR occupation = 'office manager';
 
 SELECT * 
 FROM employee_salary
 WHERE NOT occupation = 'office manager';
 
 SELECT occupation,AVG(salary)
 FROM employee_salary
 WHERE occupation LIKE "%manager%"
 GROUP BY occupation
 HAVING AVG(salary) > 75000;

SELECT first_name, 
last_name,
birth_date,
age, age + 10
FROM employee_demographics;

SELECT DISTINCT first_name,gender
FROM employee_demographics;

INSERT INTO employee_salary ( employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'jasmin' , 'Mina' , 'Doctor' , 70000, 7);

 SELECT * 
 FROM employee_salary
 LIMIT 5;
 
 SELECT * 
 FROM employee_demographics
 LIMIT 3;
 
 SELECT * 
 FROM employee_demographics
 ORDER BY age DESC
 LIMIT 2, 1;
 
 -- Aliasing --
 
 SELECT gender, AVG(age) AS avg_age
 FROM employee_demographics
 GROUP BY gender
 HAVING  avg_age > 40;
 
 SELECT occupation , AVG(salary) AS avg_sal
 FROM employee_salary
 GROUP BY occupation 
 HAVING avg_sal <= 70000;
 ;
 
 
 
 -- Intermediate SQL --
 -- Joins --
 
 SELECT * 
 FROM employee_demographics;
 
 SELECT * 
 FROM employee_salary;
 
 SELECT * 
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
   ;
   
 SELECT dem.employee_id,age,occupation
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
   ;


-- Outer Joins --

SELECT *
 FROM employee_demographics AS dem
 LEFT JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
   ;
   
 SELECT *
 FROM employee_demographics AS dem
 RIGHT JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
   ;
   
   -- self join --
   
 SELECT emp1.employee_id AS emp_santa,
 emp1.first_name AS first_name_emp,
 emp1.last_name AS first_name_emp,
 emp2.employee_id AS emp_santa,
 emp2.first_name AS first_name_emp,
 emp2.last_name AS first_name_emp
 FROM employee_salary emp1
 JOIN employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id;
    
    -- Joining multiple tables together --
    
    
 SELECT *
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd 
   ON sal.dept_id = pd.department_id
   ;
   
   -- Unions--
   
 SELECT first_name , last_name
 FROM employee_demographics
 UNION ALL
 SELECT first_name, last_name
 FROM employee_salary;
 
 
SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee'
FROM employee_salary
WHERE salary >= 70000
ORDER BY first_name
;
-- String Function 

SELECT LENGTH('sky');


SELECT first_name, LENGTH(first_name) 
FROM employee_demographics;


SELECT UPPER('sky');

SELECT first_name, UPPER(first_name) 
FROM employee_demographics;


SELECT LOWER('sky');

SELECT first_name, LOWER(first_name) 
FROM employee_demographics;


SELECT TRIM('sky'   );

-- Subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
				FROM employee_salary
                WHERE dept_id = 1);
                
SELECT first_name, salary, AVG(salary)
FROM employee_salary;

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;

-- Case Statement 

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

SELECT first_name, last_name, salary,
CASE
	WHEN salary > 45000 THEN salary + (salary * 0.05)
    WHEN salary < 45000 THEN salary + (salary * 0.07)
END AS new_salary
FROM employee_salary;

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics;


SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS Age_Bracket
FROM employee_demographics;
