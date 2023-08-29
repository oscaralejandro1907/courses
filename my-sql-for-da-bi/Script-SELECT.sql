# This Script contains Queries for Data Manipulation using the "SELECT" statement 

USE employees;

# Course Notes Section:

/*
The SELECT statement:
	SELECT column_1, column_2,..., column_n
	FROM table_name

 	The "*" means "all" or "everything"


The WHERE clause is to set a condition:

	SELECT column_1, column_2,..., column_n
	FROM table_name
	WHERE condition;


 	OPERATORS
	-- There are operators that can be used with the WHERE:
		-- AND, OR, IN, NOT IN, LIKE, NOT LIKE, BETWEEN
		-- EXISTS, NOT EXISTS, IS NULL, IS NOT NULL 

The precedence rule operator in SQL works like this: 
The "AND" operator is applied first, while the "OR" is applied second. 
Parenthesis can also be used to enclose


To satisfy more than 2 conditions we can use the "IN" operator
Also is faster than the "OR" structure

MySQL is case insensitive (is the same capital letter or not)

To search for patterns in writing use LIKE and LIKE NOT with the "%" and "_" called wildcard characters:
	 The "%" represents a sequence of chars that follows the typed word
	 	chars% -> gets all the registers starting with the "chars" typed
	 	%chars -> gets all the registers ending with the "chars" typed
	 	%chars% -> gets all the registers with the "chars" in between 
	 	
	 The "_" is used to match a single character, for example, to get 
	 registers start with 'Mar' and with 4 letters, 'Mar_' will be used. 
	 
	 
	 
AGGREGATE FUNCTIONS:
They ignore the NULL value (unless told not to)

-> COUNT(): counts the number of non-null records in a field
-> AVG(): Average

	WHERE vs HAVING:
	If I need to use aggregate function -> Use GROUP BY and HAVING
	On the other hand, if I have to use general condition -> Use WHERE 
	 
*/



# EXERCISES Section:

-- Select the full name of the employees
SELECT first_name, last_name FROM employees;

-- Select the info from the "dept_no" column of the "departments" table
SELECT dept_no FROM departments; 

-- Select all data from the "departments" table
SELECT * FROM departments;

-- Select all people from the "employees" table whose first name is "Elvis"
SELECT * FROM employees WHERE  first_name = 'Elvis';

-- Retrieve a list with all female employees whose first name is Kellie */
SELECT * FROM employees WHERE first_name = 'Kellie' AND gender = 'F';

-- Retrieve a list with all employees whose first name is either Kellie or Aruna
SELECT * FROM employees WHERE first_name = 'Kellie' OR first_name = 'Aruna';

-- Retrieve a list with all female employees whose first name is either Kellie or Aruna
SELECT * FROM employees e WHERE (first_name = 'Kellie' OR first_name = 'Aruna') AND gender = 'F';

-- Use the IN operator to select all individuals whose names is either Denis or Elvis
SELECT * FROM employees WHERE first_name IN ('Denis', 'Elvis');

-- Extract records, aside from those with employees named John, Mark, or Jacob
SELECT * FROM employees WHERE first_name NOT IN ('John', 'Mark', 'Jacob');

-- Select the data about all individuals whose first name starts with "Mark" 
-- (the name can be succeeded by any sequence of characters)
SELECT * FROM employees WHERE first_name LIKE('Mark%');		

-- Retrieve a list of all employees who have been hired in the year 2000
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with "1000".
SELECT * FROM employees WHERE emp_no LIKE ('1000_');

-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT * FROM employees WHERE first_name LIKE('%Jack%');	

-- extract another list containing the names of employees that do not contain “Jack”.
SELECT * FROM employees WHERE first_name NOT LIKE('%Jack%');

-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * FROM employees WHERE emp_no NOT BETWEEN '10004' AND '10012';

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

-- Select the names of all departments whose department number value is not null.
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT * FROM employees WHERE gender = 'F' AND hire_date >= '2000-01-01';

-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * FROM salaries WHERE salary > 150000;

-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT hire_date FROM employees;

-- How many employees are registered in our database?
SELECT COUNT(emp_no) FROM employees;

-- How many different names can be found in the employees' table
SELECT COUNT(DISTINCT first_name) FROM employees; 

-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
-- Use the (*) symbol in the code.
SELECT COUNT(*) FROM salaries WHERE salary >= 100000;

-- How many managers do we have in the “employees” database? 
-- Use the (*) symbol in the code.
SELECT COUNT(*) FROM dept_manager;

-- Sort employees by first name, and then by last name
SELECT * FROM employees ORDER BY first_name, last_name ASC;

-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT * FROM employees ORDER BY hire_date DESC;

-- Assume a list of two fields is needed, containing how many times a given name is repeated in our employees' table
-- 	* Here the GROUP_BY acts like a DISTINCT statement, displaying just distinct values
SELECT first_name, COUNT(first_name) 
FROM employees 
GROUP BY first_name 
ORDER BY first_name DESC;

-- Rename the previously calculated result with the aggregate function COUNT (use AS for the alias)
SELECT first_name, COUNT(first_name) AS names_count 
FROM employees 
GROUP BY first_name 
ORDER BY first_name;

-- Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
-- The second column, renamed as “emps_with_same_salary”, must show the number of employees contracted to that salary. 
-- Lastly, sort the output by the first column.
SELECT 
	salary, COUNT(emp_no) AS emps_with_same_salary
FROM 
	salaries 
WHERE 
	salary > 80000
GROUP BY salary
ORDER BY salary;

-- Example to query data of first names who repeat more than 250 times. 
-- In this example as there is a condition for the aggregate function COUNT, 
-- the HAVING clause instead of the WHERE clause must be used 
SELECT 
	first_name, COUNT(first_name) AS names_count 
FROM employees 
GROUP BY first_name 
HAVING COUNT(first_name) > 250 
ORDER BY first_name;

-- Select all employees whose average salary is higher than $120,000 per annum.
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no 
HAVING AVG(salary) > 120000
ORDER BY emp_no;

-- Extract a list of all names that are encountered less than 200 times.
-- Let the data refer to people hired after the 1st of January 1999.
SELECT first_name, COUNT(first_name) AS names_count 
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
-- To solve this exercise, use the “dept_emp” table.
SELECT emp_no 
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no 
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- Show the employee numbers of the 10 highest-paid employees in the database
SELECT * 
FROM salaries
ORDER BY salary DESC 
LIMIT 10;
