-- Q1) List total deposit from deposit.
SELECT SUM(amount) FROM deposit;

-- Q2) List total loan from karolbagh branch.
SELECT SUM(amount), bname FROM borrow
WHERE bname = 'KAROLBAGH';

-- Q3) Give maximum loan from branch vrce.
SELECT bname, MAX(amount) FROM borrow
WHERE bname = 'VRCE';

-- Q4) Count total number of customers
SELECT COUNT(ACTNO) FROM deposit;

-- Q5) Count total number of customer's cities.
SELECT COUNT(DISTINCT bname) FROM deposit;

-- Q6) Create table supplier from employee with all the columns.
CREATE TABLE supplier AS SELECT * FROM employee;

-- Q7) Create table sup1 from employee with first two columns.
CREATE TABLE sup1 AS SELECT empno, ename FROM employee;

-- Q8) Create table sup2 from employee with no data
CREATE TABLE sup2 LIKE employee;

-- Q9) Insert the data into sup2 from employee whose second character should be 'n' and string should be 5 characters long in employee name field.
INSERT INTO sup2
    SELECT * FROM employee
    WHERE ename LIKE "_n___";

-- Q11) Delete all the rows from sup1.
DELETE FROM sup1;

-- Q12) Delete the detail of supplier whose empno is 103.
DELETE FROM supplier
WHERE empno = 103;

-- Q13) Rename the table sup2.
ALTER TABLE sup2 RENAME TO suptwo;

-- Q14) Destroy table sup1 with all the data.
DROP TABLE sup1;

-- Q15) Update the value dept_no to 10 where second character of emp. name is 'm'.
UPDATE emp
SET dept_no = 10
WHERE name LIKE "_m%";

-- Q16) Update the value of employee name whose employee number is 103.
UPDATE emp
SET name = 'Updated Name'
WHERE emp_no = 103;

-- Q17) For each employee, display the employee number, job, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary.
SELECT e.emp_no, j.job_name, j.min_sal, ROUND(j.min_sal * 1.15, 0) AS "New Salary"
FROM emp e, job j, dept d
WHERE e.dept_no = d.dept_no AND d.job_id = j.job_id;

-- Q18) Modify your query no 17 to add a column that subtracts the old salary from the new salary. Label the column Increase.
SELECT e.emp_no, j.job_name, j.min_sal,
       ROUND(j.min_sal * 1.15, 0) AS "New Salary",
       (ROUND(j.min_sal * 1.15, 0) - j.min_sal) AS "Increase"
FROM emp e, job j, dept d
WHERE e.dept_no = d.dept_no AND d.job_id = j.job_id;

-- Q19) Write a query that displays the employee's names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' names.
SELECT CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS "Formatted Name",
       LENGTH(name) AS "Name Length"
FROM emp
WHERE name LIKE 'J%' OR name LIKE 'A%' OR name LIKE 'M%'
ORDER BY name;

-- Q20) Write a query to display the current date. Label the column Date.
SELECT CURDATE() AS "Date";

-- Q21) Write a query that produces the following for each employee: <employee name> earns <salary> monthly
SELECT CONCAT(name, ' earns ', COALESCE(j.min_sal, 0), ' monthly') AS "Employee Earnings"
FROM emp e
LEFT JOIN dept d ON e.dept_no = d.dept_no
LEFT JOIN job j ON d.job_id = j.job_id;

-- Q22) Display the name, hire date, number of months employed and day of the week on which the employee has started. Order the results by the day of the week starting with Monday.
SELECT name AS "Employee Name",
       hire_date AS "Hire Date",
       TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS "Months Employed",
       DAYNAME(hire_date) AS "Day of Week"
FROM emp
ORDER BY FIELD(DAYNAME(hire_date), 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Q23) Display the hiredate of emp in a format that appears as "7th of June 1994 12:00:00 AM".
SELECT name AS "Employee Name",
       CONCAT(
           DAY(hire_date),
           CASE
               WHEN DAY(hire_date) IN (1, 21, 31) THEN 'st'
               WHEN DAY(hire_date) IN (2, 22) THEN 'nd'
               WHEN DAY(hire_date) IN (3, 23) THEN 'rd'
               ELSE 'th'
           END,
           ' of ',
           MONTHNAME(hire_date),
           ' ',
           YEAR(hire_date),
           ' 12:00:00 AM'
       ) AS "Formatted Hire Date"
FROM emp;

-- Q24) Write a query to calculate the annual compensation of all employees (sal+comm).
-- Assuming there might be a commission field or using min_sal as base salary
SELECT e.name AS "Employee Name",
       COALESCE(j.min_sal, 0) * 12 AS "Annual Salary",
       -- If there was a commission field: COALESCE(j.min_sal, 0) * 12 + COALESCE(commission, 0) AS "Annual Compensation"
       COALESCE(j.min_sal, 0) * 12 AS "Annual Compensation"
FROM emp e
LEFT JOIN dept d ON e.dept_no = d.dept_no
LEFT JOIN job j ON d.job_id = j.job_id;


-- Manipulating Data
-- (1) Give 10% interest to all depositors.

UPDATE deposit
SET amount = amount * 1.10;

-- (2) Give 10% interest to all depositors having branch vrce

UPDATE deposit
SET amount = amount * 1.10
WHERE bname = 'VRCE';

-- (3) Give 10% interest to all depositors living in nagpur and having branch city bombay.

UPDATE deposit d
JOIN customers c ON d.cname = c.cname
JOIN branch b ON d.bname = b.bname
SET d.amount = d.amount * 1.10
WHERE c.city = 'NAGPUR' AND b.city = 'BOMBAY';

-- (4) Write a query which changes the department number of all employees with empno 7788’s job to employee 7844’current department number.

UPDATE emp e1
SET dept_no = (SELECT dept_no FROM emp WHERE emp_no = 7844)
WHERE e1.role = (SELECT role FROM emp WHERE emp_no = 7788);

-- (5) Transfer 10 Rs from account of anil to sunil if both are having same branch.

UPDATE deposit d1
JOIN deposit d2 ON d1.bname = d2.bname
SET d1.amount = d1.amount - 10, d2.amount = d2.amount + 10
WHERE d1.cname = 'ANIL' AND d2.cname = 'SUNIL';

-- (6) Give 100 Rs more to all depositors if they are maximum depositors in their respective branch.

UPDATE deposit d1
SET amount = amount + 100
WHERE amount = (SELECT MAX(amount) FROM (SELECT * FROM deposit) d2 WHERE d2.bname = d1.bname);


-- (7) Delete depositors of branches having number of customers between 1 to 3.

DELETE FROM deposit
WHERE bname IN (
    SELECT bname FROM (
        SELECT bname FROM deposit
        GROUP BY bname
        HAVING COUNT(DISTINCT cname) BETWEEN 1 AND 3
    ) AS branch_counts
);

-- (8) Delete deposit of vijay.

DELETE FROM deposit
WHERE cname = 'VIJAY';

-- (9) Delete borrower of branches having average loan less than 1000.

DELETE FROM borrow
WHERE bname IN (
    SELECT bname FROM (
        SELECT bname FROM borrow
        GROUP BY bname
        HAVING AVG(amount) < 1000
    ) AS low_avg_branches
);
