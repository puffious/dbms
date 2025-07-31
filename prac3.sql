-- 3) Create table job having fields like job_id primary key, job_name,min_sal and max_sal.
create table job (
    JOB_ID varchar(10), 
    JOB_NAME varchar(30), 
    MIN_SAL int, 
    MAX_SAL int,
    PRIMARY KEY (JOB_ID)
);

-- 2) create table dept having fields – deptno PRIMARY KEY, dept name, dept loc, job_id as foreign key.

create table dept (
    DEPT_NO int, 
    DEPT_NAME varchar(10), 
    JOB_ID varchar(10),
    DEPT_LOC varchar(15),
    PRIMARY KEY (DEPT_NO)
);

-- 1) create table Emp with the following fields and constraints.
-- Empno as primary key, deptno as foreign key, empname, role, role id, hire date, manager no.


create table emp (
    EMP_NO int,
    DEPT_NO int,
    NAME varchar(18), 
    ROLE varchar(12), 
    ROLE_ID int, 
    HIRE_DATE DATE,
    MANAGER_NO int,
    PRIMARY KEY (EMP_NO),
    FOREIGN KEY (DEPT_NO) REFERENCES dept(DEPT_NO)
);

-- 4) Insert Records in all the tables as follows.

insert into emp values
(101, 20, 'Ward', 'Salesman', 7697, '1995-02-22', 102),
(102, 20, 'Jones', 'Manager', 7839, '1990-06-15', NULL),
(103, 20, 'Martin', 'Salesman', 7697, '1993-04-23', 102),
(104, 40, 'Blake', 'Manager', 7839, '1992-05-01', NULL),
(105, 10, 'Clark', 'Manager', 7839, '1995-10-02', NULL),
(106, 10, 'Scott', 'Analyst', 7565, '1991-12-09', 105),
(107, 30, 'King', 'President', 7000, '1994-01-17', NULL);

insert into dept values
(10, 'Account', 'IT_PROG', 'New York'),
(20, 'Research', 'MK_MGR', 'Delhi'),
(30, 'Sales', 'FI_MGR', 'Chicago'),
(40, 'Operations', 'FI_ACC', 'Boston');

insert into job values
('IT_PROG', 'Programmer', NULL, 4000),
('MK_MGR', 'Marketing manager', 9000, 15000),
('FI_MGR', 'Finance manager', 8200, 12000),
('FI_ACC', 'Account', NULL, 4200),
('LEC', 'Lecturer', NULL, 6000),
('COMP_OP', 'Computer Operator', 1500, 3000);

-- Q1) Add emp_address column in the emp table
alter table emp
add emp_address varchar(100);

-- Q2) Drop emp_address column from emp table
alter table emp
drop column emp_address;

-- Q3) Modify deposit table from ACTNO character(5)
alter table deposit
modify column ACTNO character(5);

-- Q4) update min_sal where the salary in blank.
-- https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench
update job
set min_sal = 0
where min_sal is NULL;

-- Q5) Retrieve all data from emp, job and deposit.
-- should be dept instead of deposit, and also requires JOIN.
select * from emp, job, deposit;

-- Q6) Give details of account no. and deposited rupees of customers having account opened between dates 01-01-96 and 31-08-96.
select ACTNO, AMOUNT from deposit
where ADATE between '1996-01-01' and '1996-08-31';

-- Q7) Displays all jobs with minimum salary is greater than 4000
select * from job
where min_sal > 4000;

-- Q8) Display name and salary of employee whose depart no is 20. 
SELECT 
    e.NAME AS Employee_Name, 
    j.MIN_SAL AS Minimum_Salary, 
    j.MAX_SAL AS Maximum_Salary
FROM 
    emp e, dept d, job j
WHERE 
    e.DEPT_NO = d.DEPT_NO
    AND d.JOD_ID = j.JOB_ID 
    AND e.DEPT_NO = 20;

-- Q9) Display employee no, name and department details of those employee whose department lies in (10,20)
select e.EMP_NO, e.NAME, d.DEPT_NO, d.DEPT_NAME, d.DEPT_LOC from emp as e, dept as d
where e.DEPT_NO = d.DEPT_NO;