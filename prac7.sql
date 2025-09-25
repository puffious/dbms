-- Q1) Write a query to display the last name and hire date of any employee in the same department as SCOTT. Exclude SCOTT
SELECT name AS "Last Name", hire_date AS "Hire Date"
FROM emp
WHERE dept_no = (SELECT dept_no FROM emp WHERE name = 'SCOTT')
    AND name != 'SCOTT';

-- Q2) Give name of customers who are depositors having same branch city of mr. sunil.
SELECT DISTINCT d.cname AS "Customer Name"
FROM deposit d
JOIN branch b1 ON d.bname = b1.bname
WHERE b1.city = (
    SELECT b2.city
    FROM deposit d2
    JOIN branch b2 ON d2.bname = b2.bname
    WHERE d2.cname = 'SUNIL'
);

-- Q3) Give deposit details and loan details of customer in same city where pramod is living.
SELECT 'DEPOSIT' AS "Type", d.actno AS "Account/Loan No", d.cname, d.bname, d.amount, d.adate AS "Date"
FROM deposit d
JOIN customers c ON d.cname = c.cname
WHERE c.city = (SELECT city FROM customers WHERE cname = 'PRAMOD')
UNION ALL
SELECT 'BORROW' AS "Type", b.loanno AS "Account/Loan No", b.cname, b.bname, b.amount, NULL AS "Date"
FROM borrow b
JOIN customers c ON b.cname = c.cname
WHERE c.city = (SELECT city FROM customers WHERE cname = 'PRAMOD');

-- Q4) Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
SELECT e.emp_no AS "Employee Number", e.name AS "Last Name", j.min_sal AS "Salary"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
JOIN job j ON d.job_id = j.job_id
WHERE j.min_sal > (
    SELECT AVG(j2.min_sal)
    FROM emp e2
    JOIN dept d2 ON e2.dept_no = d2.dept_no
    JOIN job j2 ON d2.job_id = j2.job_id
    WHERE j2.min_sal IS NOT NULL
)
AND j.min_sal IS NOT NULL
ORDER BY j.min_sal ASC;

-- Q5) Give names of depositors having same living city as mr. anil and having deposit amount greater than 2000
SELECT DISTINCT d.cname AS "Depositor Name"
FROM deposit d
JOIN customers c ON d.cname = c.cname
WHERE c.city = (SELECT city FROM customers WHERE cname = 'ANIL')
    AND d.amount > 2000;

-- Q6) Display the last name and salary of every employee who reports to ford.
SELECT e.name AS "Last Name", j.min_sal AS "Salary"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
JOIN job j ON d.job_id = j.job_id
WHERE e.manager_no = (SELECT emp_no FROM emp WHERE name = 'FORD');

-- Q7) Display the department number, name, and job for every employee in the accounting department.
SELECT e.dept_no AS "Department Number", e.name AS "Employee Name", j.job_name AS "Job"
FROM emp e
JOIN dept dt ON e.dept_no = dt.dept_no
JOIN job j ON dt.job_id = j.job_id
WHERE dt.dept_name = 'ACCOUNTING' OR dt.dept_name = 'Account';

-- Q8) List the name of branch having highest number of depositors.
SELECT bname AS "Branch Name"
FROM deposit
GROUP BY bname
HAVING COUNT(DISTINCT cname) = (
    SELECT MAX(depositor_count)
    FROM (
        SELECT COUNT(DISTINCT cname) AS depositor_count
        FROM deposit
        GROUP BY bname
    ) AS branch_counts
);

-- Q9) Give the name of cities where in which the maximum numbers of branches are located.
SELECT city AS "City Name"
FROM branch
GROUP BY city
HAVING COUNT(bname) = (
    SELECT MAX(branch_count)
    FROM (
        SELECT COUNT(bname) AS branch_count
        FROM branch
        GROUP BY city
    ) AS city_counts
);

-- Q10) Give name of customers living in same city where maximum depositors are located.
SELECT DISTINCT c.cname AS "Customer Name"
FROM customers c
WHERE c.city = (
    SELECT c2.city
    FROM customers c2
    JOIN deposit d ON c2.cname = d.cname
    GROUP BY c2.city
    HAVING COUNT(DISTINCT d.cname) = (
        SELECT MAX(depositor_count)
        FROM (
            SELECT COUNT(DISTINCT d2.cname) AS depositor_count
            FROM customers c3
            JOIN deposit d2 ON c3.cname = d2.cname
            GROUP BY c3.city
        ) AS city_depositor_counts
    )
);
