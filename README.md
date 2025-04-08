# SQL-Project
#   Employee Data Analysis with SQL 📊

##   Overview

This repository contains SQL code snippets for analyzing employee data. The queries demonstrate various SQL concepts, from basic data retrieval and filtering to more advanced techniques like joins, subqueries, and case statements. These examples can be used to understand employee demographics, salary information, and relationships between different data points.

This collection of SQL queries serves as a demonstration of SQL skills for data analysis and manipulation.

##   Key SQL Concepts Demonstrated

The queries cover a range of SQL functionalities:

* **Basic Selection and Filtering:** Retrieving data based on specific conditions.
* **Sorting and Ordering:** Arranging data in ascending or descending order.
* **String Functions:** Manipulating text data.
* **Aggregate Functions:** Calculating summary statistics (e.g., average).
* **Grouping and Having:** Grouping data and filtering groups based on conditions.
* **Joins:** Combining data from multiple tables.
* **Unions:** Combining the result sets of multiple SELECT statements.
* **Subqueries:** Using a SELECT statement within another statement.
* **Case Statements:** Performing conditional logic within a query.
* **Aliasing:** Assigning temporary names to columns or tables.

##   Methodology & Tools

The code snippets are written in SQL and can be executed in any SQL database management system (e.g., MySQL, PostgreSQL, SQL Server).

* **Language:** SQL

##   SQL Code Snippets Examples

Here are some examples of the SQL queries included:

* **Basic Selection and Filtering:**

    ```sql
    SELECT * FROM employee_salary
    WHERE occupation = 'office Manager';

    SELECT * FROM employee_salary
    WHERE salary >=  50000 ;

    SELECT * FROM employee_demographics
    WHERE gender !='Female';
    ```

* **Sorting and Ordering:**

    ```sql
    SELECT * FROM employee_demographics
    ORDER BY age DESC;
    ```

* **Aggregate Functions, Grouping, and Having:**

    ```sql
    SELECT gender, AVG(age) AS avg_age
    FROM employee_demographics
    GROUP BY gender
    HAVING AVG(age) > 40;
    ```

* **Joins:**

    ```sql
    SELECT dem.employee_id, age, occupation
    FROM employee_demographics AS dem
    INNER JOIN employee_salary AS sal
      ON dem.employee_id = sal.employee_id;
    ```

* **Unions:**

    ```sql
    SELECT first_name, last_name
    FROM employee_demographics
    UNION ALL
    SELECT first_name, last_name
    FROM employee_salary;
    ```

* **Subqueries:**

    ```sql
    SELECT *
    FROM employee_demographics
    WHERE employee_id IN 
                (SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1);
    ```

* **Case Statements:**

    ```sql
    SELECT first_name, last_name, salary,
    CASE
        WHEN salary > 45000 THEN salary + (salary * 0.05)
        WHEN salary < 45000 THEN salary + (salary * 0.07)
    END AS new_salary
    FROM employee_salary;
    ```

##   Running the Queries

To run these queries:

1.  Ensure you have a SQL database set up (e.g., MySQL, PostgreSQL).
2.  Import the relevant employee data into the database.  (The table structures are implied by the queries.)
3.  Use a SQL client or interface to connect to your database.
4.  Copy and paste the SQL code snippets and execute them.
