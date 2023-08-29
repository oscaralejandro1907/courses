/* 
 Joins can show a result containing fields from two tables,
for example when we want registers conforming of three columns of one table 
and two columns of the another

To be able to use them first it is neede to find the related column that contain the
first type of data (for example in our database, the key emp_no), this is: 
 -- The columns you use to realte tables must represent the same object, such as id --
*/

USE employees;

DROP TABLE departments_dup;

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
VALUES ("d010");

INSERT INTO departments_dup (dept_no)
VALUES ("d011");


