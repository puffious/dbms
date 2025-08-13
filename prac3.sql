-- 1> Create table job having fields like job_id primary key, job_name,min_sal and max_sal.
CREATE TABLE job (
    job_id VARCHAR(10), 
    job_name VARCHAR(30), 
    min_sal INT, 
    max_sal INT,
    PRIMARY KEY (job_id)
);

-- 2> create table dept having fields – deptno PRIMARY KEY, dept name, dept loc, job_id as foreign key.

CREATE TABLE dept (
    dept_no INT, 
    dept_name VARCHAR(10), 
    job_id VARCHAR(10),
    dept_loc VARCHAR(15),
    PRIMARY KEY (dept_no)
);

-- 1> create table Emp with the following fields and constraints.
-- Empno as primary key, deptno as foreign key, empname, role, role id, hire date, manager no.

CREATE TABLE emp (
    emp_no INT,
    dept_no INT,
    name VARCHAR(18),
    role VARCHAR(12),
    role_id INT,
    hire_date DATE,
    manager_no INT,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

-- 4> Insert Records in all the tables as follows.

INSERT INTO job VALUES
('IT_PROG', 'Programmer', NULL, 4000),
('MK_MGR', 'Marketing manager', 9000, 15000),
('FI_MGR', 'Finance manager', 8200, 12000),
('FI_ACC', 'Account', NULL, 4200),
('LEC', 'Lecturer', NULL, 6000),
('COMP_OP', 'Computer Operator', 1500, 3000);

INSERT INTO dept VALUES
(10, 'Account', 'IT_PROG', 'New York'),
(20, 'Research', 'MK_MGR', 'Delhi'),
(30, 'Sales', 'FI_MGR', 'Chicago'),
(40, 'Operations', 'FI_ACC', 'Boston');

INSERT INTO emp VALUES
(101, 20, 'Ward', 'Salesman', 7697, '1995-02-22', 102),
(102, 20, 'Jones', 'Manager', 7839, '1990-06-15', NULL),
(103, 20, 'Martin', 'Salesman', 7697, '1993-04-23', 102),
(104, 40, 'Blake', 'Manager', 7839, '1992-05-01', NULL),
(105, 10, 'Clark', 'Manager', 7839, '1995-10-02', NULL),
(106, 10, 'Scott', 'Analyst', 7565, '1991-12-09', 105),
(107, 30, 'King', 'President', 7000, '1994-01-17', NULL);



--------------------------------------------------

-- Q1) Add emp_address column in the emp table
ALTER TABLE emp
ADD emp_address VARCHAR(100);

-- Q2) Drop emp_address column from emp table
ALTER TABLE emp
DROP COLUMN emp_address;

-- Q3) Modify deposit table from ACTNO character(5)
ALTER TABLE deposit
MODIFY COLUMN actno CHARACTER(5);

-- Q4) update min_sal where the salary in blank.
-- https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench
UPDATE job
SET min_sal = 0
WHERE min_sal is NULL;

-- Q5) Retrieve all data from emp, job and deposit.
-- should be dept instead of deposit, might require JOIN.
SELECT * FROM emp;
SELECT * FROM job;
SELECT * FROM dept;

-- Q6) Give details of account no. and deposited rupees of customers having account opened between dates 01-01-96 and 31-08-96.
SELECT actno, amount FROM deposit
WHERE adate BETWEEN '1996-01-01' AND '1996-08-31';

-- Q7) Displays all jobs with minimum salary is greater than 4000
SELECT * FROM job
WHERE min_sal > 4000;

-- Q8) Display name and salary of employee whose depart no is 20. 
SELECT 
    e.name AS Employee_Name, 
    j.min_sal AS Minimum_Salary, 
    j.max_sal AS Maximum_Salary
FROM 
    emp e, dept d, job j
WHERE 
    e.dept_no = d.dept_no
    AND d.job_id = j.job_id 
    AND e.dept_no = 20;

-- Q9) Display employee no, name and department details of those employee whose department lies in (10,20)
SELECT 
    e.emp_no, e.name, 
    d.dept_no, d.dept_name, 
    d.dept_loc 
FROM 
    emp AS e, 
    dept AS d
WHERE 
    e.dept_no = d.dept_no 
    and d.DEPT_NO in (10, 20);