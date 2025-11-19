# DBMS Practice 5 - SQL Queries with Aggregate Functions and Data Manipulation

## Q1) List total deposit from deposit.

**SQL Query:**
```sql
SELECT SUM(amount) FROM deposit;
```

**Output:**
| SUM(amount) |
|-------------|
| 28700       |

---

## Q2) List total loan from karolbagh branch.

**SQL Query:**
```sql
SELECT SUM(amount), bname FROM borrow
WHERE bname = 'KAROLBAGH';
```

**Output:**
| SUM(amount) | bname |
|-------------|-------|
| NULL        | NULL  |

---

## Q3) Give maximum loan from branch vrce.

**SQL Query:**
```sql
SELECT bname, MAX(amount) FROM borrow
WHERE bname = 'VRCE';
```

**Output:**
| bname | MAX(amount) |
|-------|-------------|
| VRCE  | 1000.00     |

---

## Q4) Count total number of customers

**SQL Query:**
```sql
SELECT COUNT(ACTNO) FROM deposit;
```

**Output:**
| COUNT(ACTNO) |
|--------------|
| 9            |

---

## Q5) Count total number of customer's cities.

**SQL Query:**
```sql
SELECT COUNT(DISTINCT bname) FROM deposit;
```

**Output:**
| COUNT(DISTINCT bname) |
|-----------------------|
| 9                     |

---

## Q6) Create table supplier from employee with all the columns.

**SQL Query:**
```sql
CREATE TABLE supplier AS SELECT * FROM emp;
```

**Output:** Success

---

## Q7) Create table sup1 from employee with first two columns.

**SQL Query:**
```sql
CREATE TABLE sup1 AS SELECT emp_no, name FROM emp;
```

**Output:** Success

---

## Q8) Create table sup2 from employee with no data

**SQL Query:**
```sql
CREATE TABLE sup2 LIKE emp;
```

**Output:** Success

---

## Q9) Insert the data into sup2 from employee whose second character should be 'n' and string should be 5 characters long in employee name field.

**SQL Query:**
```sql
INSERT INTO sup2
    SELECT * FROM emp
    WHERE name LIKE '_n___';
```

**Output:** Success, no records

---

## Q11) Delete all the rows from sup1.

**SQL Query:**
```sql
DELETE FROM sup1;
```

**Output:** 7 rows affected

---

## Q12) Delete the detail of supplier whose empno is 103.

**SQL Query:**
```sql
DELETE FROM supplier
WHERE emp_no = 103;
```

**Output:** 1 row affected

---

## Q13) Rename the table sup2.

**SQL Query:**
```sql
ALTER TABLE sup2 RENAME TO suptwo;
```

**Output:** Success

---

## Q14) Destroy table sup1 with all the data.

**SQL Query:**
```sql
DROP TABLE sup1;
```

**Output:** Success

---

## Q15) Update the value dept_no to 10 where second character of emp. name is 'm'.

**SQL Query:**
```sql
UPDATE emp
SET dept_no = 10
WHERE name LIKE "_m%";
```

**Output:** Success, no rows affected

---

## Q16) Update the value of employee name whose employee number is 103.

**SQL Query:**
```sql
UPDATE emp
SET name = 'Guy'
WHERE emp_no = 103;
```

**Output:** 1 row affected

---

## Q17) For each employee, display the employee number, job, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary.

**SQL Query:**
```sql
SELECT e.emp_no, j.job_name, j.min_sal, ROUND(j.min_sal * 1.15, 0) AS "New Salary"
FROM emp e, job j, dept d
WHERE e.dept_no = d.dept_no AND d.job_id = j.job_id;
```

**Output:**
| emp_no | job_name           | min_sal | New Salary |
|--------|--------------------|---------|------------|
| 104    | Account            | NULL    | NULL       |
| 107    | Finance manager    | 8200    | 9430       |
| 105    | Programmer         | NULL    | NULL       |
| 106    | Programmer         | NULL    | NULL       |
| 101    | Marketing manager  | 9000    | 10350      |
| 102    | Marketing manager  | 9000    | 10350      |
| 103    | Marketing manager  | 9000    | 10350      |

---

## Q18) Modify your query no 17 to add a column that subtracts the old salary from the new salary. Label the column Increase.

**SQL Query:**
```sql
SELECT e.emp_no, j.job_name, j.min_sal,
       ROUND(j.min_sal * 1.15, 0) AS "New Salary",
       (ROUND(j.min_sal * 1.15, 0) - j.min_sal) AS "Increase"
FROM emp e, job j, dept d
WHERE e.dept_no = d.dept_no AND d.job_id = j.job_id;
```

**Output:**
| emp_no | job_name           | min_sal | New Salary | Increase |
|--------|--------------------|---------|------------|----------|
| 104    | Account            | NULL    | NULL       | NULL     |
| 107    | Finance manager    | 8200    | 9430       | 1230     |
| 105    | Programmer         | NULL    | NULL       | NULL     |
| 106    | Programmer         | NULL    | NULL       | NULL     |
| 101    | Marketing manager  | 9000    | 10350      | 1350     |
| 102    | Marketing manager  | 9000    | 10350      | 1350     |
| 103    | Marketing manager  | 9000    | 10350      | 1350     |

---

## Q19) Write a query that displays the employee's names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' names.

**SQL Query:**
```sql
SELECT CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS "Name",
       LENGTH(name) AS "Length"
FROM emp
WHERE name LIKE 'J%' OR name LIKE 'A%' OR name LIKE 'M%'
ORDER BY name;
```

**Output:**
| Name  | Length |
|-------|--------|
| Jones | 5      |

---

## Q20) Write a query to display the current date. Label the column Date.

**SQL Query:**
```sql
SELECT CURDATE() AS "Date";
```

**Output:**
| Date       |
|------------|
| 2025-09-30 |

---

## Q21) Write a query that produces the following for each employee: <employee name> earns <salary> monthly

**SQL Query:**
```sql
SELECT CONCAT(name, ' earns ', COALESCE(j.min_sal, 0), ' monthly') AS "Employee Earnings"
FROM emp e
LEFT JOIN dept d ON e.dept_no = d.dept_no
LEFT JOIN job j ON d.job_id = j.job_id;
```

**Output:**
| Employee Earnings          |
|----------------------------|
| Ward earns 9000 monthly    |
| Jones earns 9000 monthly   |
| Guy earns 9000 monthly |
| Blake earns 0 monthly      |
| Clark earns 0 monthly      |
| Scott earns 0 monthly      |
| King earns 8200 monthly    |

---

## Q22) Display the name, hire date, number of months employed and day of the week on which the employee has started. Order the results by the day of the week starting with Monday.

**SQL Query:**
```sql
SELECT name AS "Employee Name",
       hire_date AS "Hire Date",
       TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS "Months Employed",
       DAYNAME(hire_date) AS "Day of Week"
FROM emp
ORDER BY FIELD(DAYNAME(hire_date), 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```

**Output:**
| Employee Name | Hire Date  | Months Employed | Day of Week |
|---------------|------------|-----------------|-------------|
| Clark         | 1995-10-02 | 359             | Monday      |
| Scott         | 1991-12-09 | 405             | Monday      |
| King          | 1994-01-17 | 380             | Monday      |
| Ward          | 1995-02-22 | 367             | Wednesday   |
| Jones         | 1990-06-15 | 423             | Friday      |
| Guy  | 1993-04-23 | 389             | Friday      |
| Blake         | 1992-05-01 | 400             | Friday      |

---

## Q23) Display the hiredate of emp in a format that appears as "7th of June 1994 12:00:00 AM".

**SQL Query:**
```sql
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
```

**Output:**
| Employee Name | Formatted Hire Date               |
|---------------|-----------------------------------|
| Ward          | 22nd of February 1995 12:00:00 AM |
| Jones         | 15th of June 1990 12:00:00 AM     |
| Guy  | 23rd of April 1993 12:00:00 AM    |
| Blake         | 1st of May 1992 12:00:00 AM       |
| Clark         | 2nd of October 1995 12:00:00 AM   |
| Scott         | 9th of December 1991 12:00:00 AM  |
| King          | 17th of January 1994 12:00:00 AM  |

---

## Q24) Write a query to calculate the annual compensation of all employees (sal+comm).

**SQL Query:**
```sql
SELECT e.name AS "Employee Name",
       COALESCE(j.min_sal, 0) * 12 AS "Annual Salary",
       COALESCE(j.min_sal, 0) * 12 AS "Annual Compensation"
FROM emp e
LEFT JOIN dept d ON e.dept_no = d.dept_no
LEFT JOIN job j ON d.job_id = j.job_id;
```

**Output:**
| Employee Name | Annual Salary | Annual Compensation |
|---------------|---------------|---------------------|
| Ward          | 108000        | 108000              |
| Jones         | 108000        | 108000              |
| Guy  | 108000        | 108000              |
| Blake         | 0             | 0                   |
| Clark         | 0             | 0                   |
| Scott         | 0             | 0                   |
| King          | 98400         | 98400               |

---

# Data Manipulation Queries

## (1) Give 10% interest to all depositors.

**SQL Query:**
```sql
UPDATE deposit
SET amount = amount * 1.10;
```

---

## (2) Give 10% interest to all depositors having branch vrce

**SQL Query:**
```sql
UPDATE deposit
SET amount = amount * 1.10
WHERE bname = 'VRCE';
```

---

## (3) Give 10% interest to all depositors living in nagpur and having branch city bombay.

**SQL Query:**
```sql
UPDATE deposit d
JOIN customers c ON d.cname = c.cname
JOIN branch b ON d.bname = b.bname
SET d.amount = d.amount * 1.10
WHERE c.city = 'NAGPUR' AND b.city = 'BOMBAY';
```

---

## (4) Write a query which changes the department number of all employees with empno 7788's job to employee 7844'current department number.

**SQL Query:**
```sql
UPDATE emp e1
SET dept_no = (SELECT dept_no FROM emp WHERE emp_no = 7844)
WHERE e1.role = (SELECT role FROM emp WHERE emp_no = 7788);
```

---

## (5) Transfer 10 Rs from account of anil to sunil if both are having same branch.

**SQL Query:**
```sql
UPDATE deposit d1
JOIN deposit d2 ON d1.bname = d2.bname
SET d1.amount = d1.amount - 10, d2.amount = d2.amount + 10
WHERE d1.cname = 'ANIL' AND d2.cname = 'SUNIL';
```

---

## (6) Give 100 Rs more to all depositors if they are maximum depositors in their respective branch.

**SQL Query:**
```sql
UPDATE deposit d1
SET amount = amount + 100
WHERE amount = (SELECT MAX(amount) FROM (SELECT * FROM deposit) d2 WHERE d2.bname = d1.bname);
```

---

## (7) Delete depositors of branches having number of customers between 1 to 3.

**SQL Query:**
```sql
DELETE FROM deposit
WHERE bname IN (
    SELECT bname FROM (
        SELECT bname FROM deposit
        GROUP BY bname
        HAVING COUNT(DISTINCT cname) BETWEEN 1 AND 3
    ) AS branch_counts
);
```

---

## (8) Delete deposit of vijay.

**SQL Query:**
```sql
DELETE FROM deposit
WHERE cname = 'VIJAY';
```

---

## (9) Delete borrower of branches having average loan less than 1000.

**SQL Query:**
```sql
DELETE FROM borrow
WHERE bname IN (
    SELECT bname FROM (
        SELECT bname FROM borrow
        GROUP BY bname
        HAVING AVG(amount) < 1000
    ) AS low_avg_branches
);
```
