# DBMS Practical 6 - Aggregate Functions and GROUP BY Operations

## (1) List total deposit of customer having account date after 1-jan-96.

**SQL Query:**
```sql
SELECT SUM(amount) AS "Total Deposit"
FROM deposit
WHERE adate > '1996-01-01';
```

**Output:**
| Total Deposit |
|---------------|
| 10000         |

---

## (2) List total deposit of customers living in city Nagpur.

**SQL Query:**
```sql
SELECT SUM(d.amount) AS "Total Deposit"
FROM deposit d
JOIN customers c ON d.cname = c.cname
WHERE c.city = 'NAGPUR';
```

**Output:**
| Total Deposit |
|---------------|
| NULL          |

---

## (3) List maximum deposit of customers living in bombay.

**SQL Query:**
```sql
SELECT MAX(d.amount) AS "Maximum Deposit"
FROM deposit d
JOIN customers c ON d.cname = c.cname
WHERE c.city = 'BOMBAY';
```

**Output:**
| Maximum Deposit |
|-----------------|
| 5000            |

---

## (4) Display the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

**SQL Query:**
```sql
SELECT
    ROUND(MAX(j.max_sal), 0) AS "Maximum",
    ROUND(MIN(j.min_sal), 0) AS "Minimum",
    ROUND(SUM(j.min_sal), 0) AS "Sum",
    ROUND(AVG(j.min_sal), 0) AS "Average"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
JOIN job j ON d.job_id = j.job_id
WHERE j.min_sal IS NOT NULL;
```

**Output:**
| Maximum | Minimum | Sum   | Average |
|---------|---------|-------|---------|
| 15000   | 8200    | 35200 | 8800    |

---

## (5) Write a query that displays the difference between the highest and lowest salaries. Label the column DIFFERENCE.

**SQL Query:**
```sql
SELECT
    (MAX(j.max_sal) - MIN(j.min_sal)) AS "DIFFERENCE"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
JOIN job j ON d.job_id = j.job_id
WHERE j.min_sal IS NOT NULL;
```

**Output:**
| DIFFERENCE |
|------------|
| 6800       |

---

## (6) Create a query that will display the total number of employees and, of that total, the number of employees hired in 1995, 1996, 1997, and 1998

**SQL Query:**
```sql
SELECT
    COUNT(*) AS "Total Employees",
    SUM(CASE WHEN YEAR(hire_date) = 1995 THEN 1 ELSE 0 END) AS "Hired in 1995",
    SUM(CASE WHEN YEAR(hire_date) = 1996 THEN 1 ELSE 0 END) AS "Hired in 1996",
    SUM(CASE WHEN YEAR(hire_date) = 1997 THEN 1 ELSE 0 END) AS "Hired in 1997",
    SUM(CASE WHEN YEAR(hire_date) = 1998 THEN 1 ELSE 0 END) AS "Hired in 1998"
FROM emp;
```

**Output:**
| Total Employees | Hired in 1995 | Hired in 1996 | Hired in 1997 | Hired in 1998 |
|-----------------|---------------|---------------|---------------|---------------|
| 7               | 2             | 0             | 0             | 0             |

---

## (7) Find the average salaries for each department without displaying the respective department numbers.

**SQL Query:**
```sql
SELECT
    dt.dept_name,
    AVG(j.min_sal) AS "Average Salary"
FROM emp e
JOIN dept dt ON e.dept_no = dt.dept_no
JOIN job j ON dt.job_id = j.job_id
WHERE j.min_sal IS NOT NULL
GROUP BY dt.dept_name;
```

**Output:**
| dept_name | Average Salary |
|-----------|----------------|
| Research  | 9000.0000      |
| Sales     | 8200.0000      |

---

## (8) Write a query to display the total salary being paid to each job title, within each department.

**SQL Query:**
```sql
SELECT
    dt.dept_name,
    j.job_name,
    SUM(j.min_sal) AS "Total Salary"
FROM emp e
JOIN dept dt ON e.dept_no = dt.dept_no
JOIN job j ON dt.job_id = j.job_id
WHERE j.min_sal IS NOT NULL
GROUP BY dt.dept_name, j.job_name
ORDER BY dt.dept_name, j.job_name;
```

**Output:**
| dept_name | job_name          | Total Salary |
|-----------|-------------------|--------------|
| Research  | Marketing manager | 27000        |
| Sales     | Finance manager   | 8200         |

---

## (9) Find the average salaries > 2000 for each department without displaying the respective department numbers.

**SQL Query:**
```sql
SELECT
    dt.dept_name,
    AVG(j.min_sal) AS "Average Salary"
FROM emp e
JOIN dept dt ON e.dept_no = dt.dept_no
JOIN job j ON dt.job_id = j.job_id
WHERE j.min_sal IS NOT NULL
GROUP BY dt.dept_name
HAVING AVG(j.min_sal) > 2000;
```

**Output:**
| dept_name | Average Salary |
|-----------|----------------|
| Research  | 9000.0000      |
| Sales     | 8200.0000      |

---

## (10) Display the job and total salary for each job with a total salary amount exceeding 3000, in which excludes president and sorts the list by the total salary.

**SQL Query:**
```sql
SELECT
    j.job_name,
    SUM(j.min_sal) AS "Total Salary"
FROM emp e
JOIN dept dt ON e.dept_no = dt.dept_no
JOIN job j ON dt.job_id = j.job_id
WHERE j.min_sal IS NOT NULL
    AND j.job_name != 'President'
    AND e.role != 'President'
GROUP BY j.job_name
HAVING SUM(j.min_sal) > 3000
ORDER BY SUM(j.min_sal);
```

**Output:**
| job_name          | Total Salary |
|-------------------|--------------|
| Marketing manager | 27000        |

---

## (11) List the branches having sum of deposit more than 5000 and located in city bombay.

**SQL Query:**
```sql
SELECT
    b.bname,
    b.city,
    SUM(d.amount) AS "Total Deposit"
FROM deposit d
JOIN branch b ON d.bname = b.bname
WHERE b.city = 'BOMBAY'
GROUP BY b.bname, b.city
HAVING SUM(d.amount) > 5000;
```

**Output:**
| bname | city | Total Deposit |
|-------|------|---------------|
| (No results returned) |

---

## Summary

This practice focuses on:
- **Aggregate Functions**: SUM(), MAX(), MIN(), AVG(), COUNT()
- **GROUP BY Operations**: Grouping data by departments, job titles, and branches
- **HAVING Clause**: Filtering grouped results
- **JOIN Operations**: Combining data from multiple tables
- **Conditional Aggregation**: Using CASE statements within aggregate functions
- **Date Functions**: Working with hire dates and filtering by years
