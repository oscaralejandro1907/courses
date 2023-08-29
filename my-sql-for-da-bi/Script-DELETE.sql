USE employees;

/*
 * The use of the WHERE condition is important, otherwise, we take the risk of 
 * deleting all records in a table. 
 * 
 * Differences between DROP - TRUNCATE - DELETE
 * 
 * DROP: Deletes everything, won't be able to ROLLBACK at the initial state, or last COMMIT. 
 * Use it when the table is no longer to be needed.
 * 
 * TRUNCATE: Removes all records of the table, but the structure will remain
 * Ends up with the empty table. Just as a DELETE without the WHERE clause.
 * 
 * DELETE: Removes records by rows, specifying a condition.
 * Have in mind also that auto-increment values are not reset with DELETE
 * 
 * 
 */


DELETE FROM employees 
WHERE emp_no = 999903;

-- Remove the department number 10 record from the “departments” table.
DELETE FROM departments 
WHERE dept_no = 'd010';



/* You want to remove a table from your database, together with its structure and all related objects, 
 * like indexes and constraints. Which of the commands would allow you to do that?
 * 
 * ANSWER: DROP
 * 
 * 
 * 
 * You want to remove the entire data from a table and keep its structure. 
 * Furthermore, you want auto-increment values to be reset. 
 * Which of the commands should you use?
 * 
 * ANSWER: TRUNCATE
 */


DROP TABLE departments_dup;