USE employees;

/*
 * AGGREGATE FUNCTIONS gather data from several rows, then aggregate it into a single value.
 * 	INPUT: Info contained in multiple rows -> OUTPUT: the single value they provide.
 * 	They ignore null values, but if it is used as COUNT(*), NULL values will be included. 
 * 	No space before opening the parenthesis must be left.
 * 
 * ROUND(#, decimal_places)
 */

/*
 * 	IFNULL(expr_1, expr_2): returns the first expresion if the data is not null, 
 * 	and returns the second if there is a null value.
 * 
 * 	As IFNULL only accepts 2 params, COALESCE allows N arguments.
 * 	COALESCE will return a single value of the params. This value will be the first non-null value,
 * 	reading the favlues from left to right. 
 */


-- How many employee start dates are in the database?
SELECT COUNT(from_date) FROM salaries; 

-- How many employees with different start dates are in the database?
SELECT COUNT(DISTINCT from_date) FROM salaries; 

-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT SUM(salary) FROM salaries WHERE from_date >= '1997-01-01';

-- Which is the highest salary we offer?
SELECT MAX(salary) FROM salaries;

-- Which is the lowest contract value?
SELECT MIN(salary) FROM salaries;

-- Which is the lowest employee number in the database?
SELECT MIN(emp_no) FROM employees;

-- Which is the highest employee number in the database?
SELECT MAX(emp_no) FROM employees; 

-- Which is the average annual salary the company's employee received?
SELECT AVG(salary) FROM salaries;

-- What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT AVG(salary) FROM salaries WHERE from_date >= '1997-01-01';

-- Round the average salary to the closest integer
SELECT ROUND(AVG(salary)) FROM salaries; 

-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 
-- to a precision of cents.
SELECT ROUND(AVG(salary), 2) FROM salaries WHERE from_date >= '1997-01-01';


-- Select the department number and name from the ‘departments_dup’ table and add a third column 
-- where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
SELECT dept_no, dept_name, COALESCE(dept_no, dept_name) as dept_info
FROM departments_dup
ORDER BY dept_no ASC;

-- Modify the code obtained from the previous exercise in the following way. 
-- Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever 
-- a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
SELECT IFNULL(dept_no, 'N/A') AS dept_no, IFNULL(dept_name, 'Department name not provided') AS dept_name, COALESCE (dept_no, dept_name) AS dept_info
FROM departments_dup 
ORDER BY dept_no ASC;




