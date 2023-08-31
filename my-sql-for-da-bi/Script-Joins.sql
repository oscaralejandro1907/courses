/* 
 Joins can show a result containing fields from two tables,
for example when we want registers conforming of three columns of one table 
and two columns of the another

To be able to use them first it is neede to find the related column that contain the
first type of data (for example in our database, the key emp_no), this is: 
 -- The columns you use to realte tables must represent the same object, such as id --
*/

USE employees;

# Set Up ‘departments_dup’ table

DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup (
	dept_no CHAR(4),
	dept_name VARCHAR (40)
);

INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;

INSERT INTO departments_dup (dept_name)
VALUES ("Public Relations");

DELETE FROM departments_dup 
WHERE dept_no = 'd002';

INSERT INTO departments_dup (dept_no)
VALUES ("d010"),
("d011")
;


# Create and fill the "dept_manager_dup" table
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
	emp_no INT(11) NOT NULL,
	dept_no CHAR(4) NULL,
	from_date DATE NOT NULL,
	to_date DATE NULL
);

INSERT INTO dept_manager_dup 
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01')
;

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';



