USE employees;

-- Add a new employee
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');

-- insert information about employee number 999903. 
-- State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
INSERT INTO employees
VALUES (999903,'1977-09-14','Johnathan', 'Creek','M', '1999-01-01');


INSERT INTO titles (emp_no,title,from_date)
VALUES(999903,'Senior Engineer','1997-10-01');

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. 
-- He/She is working for department number 5, and has started work on  October 1st, 1997; 
-- her/his contract is for an indefinite period of time. 
-- Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.
INSERT INTO dept_emp(emp_no,dept_no,from_date,to_date)
VALUES(999903,'d005','1997-10-01','9999-01-01');

-- Create a new department called “Business Analysis”. Register it under number ‘d010’.
INSERT INTO departments 
VALUES ('d010', 'Business Analysis');


-- Creating a duplicate table and add data from the original table
CREATE TABLE departments_dup
(
	dept_no CHAR(4) NOT NULL,
	dept_name VARCHAR(40) NULL
);

INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;

-- Add more data
INSERT INTO departments_dup(dept_no) VALUES ('d010');
INSERT INTO departments_dup(dept_no) VALUES ('d011');