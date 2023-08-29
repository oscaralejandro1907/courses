USE employees;

/* 
 * UPDATE statement updates the values of an existing record
 * If the WHERE condition(s) is(are) not provided, ALL ROWS will be updated
 */

UPDATE employees 
SET first_name = 'Stella', last_name = 'Parkinson', birth_date = '1990-12-31', gender = 'F'
WHERE emp_no = 999901;


-- Change the “Business Analysis” department name to “Data Analysis”.
-- Hint: use the “departments” table.
UPDATE departments
SET dept_name = "Data Analysis"
WHERE dept_no = "d010";
