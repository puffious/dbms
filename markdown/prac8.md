# DBMS Practice 8 - Displaying Data from Multiple Tables (JOIN)

## (1) Give details of customers ANIL.

**SQL Query:**
```sql
SELECT c.cname, c.city, d.actno, d.amount AS "Deposit Amount", b.loanno, b.amount
AS "Loan Amount"
FROM customers c
LEFT JOIN deposit d ON c.cname = d.cname
LEFT JOIN borrow b ON c.cname = b.cname
WHERE c.cname = 'ANIL';
```

**Output:**
| cname | city     | actno | Deposit Amount | loanno | Loan Amount |
|-------|----------|-------|----------------|--------|-------------|
| ANIL  | CALCUTTA | 100   | 1000           | 201    | 1000        |

---

## (2) Give name of customer who are borrowers and depositors and having living city nagpur

**SQL Query:**
```sql
SELECT DISTINCT c.cname
FROM customers c
JOIN deposit d ON c.cname = d.cname
JOIN borrow b ON c.cname = b.cname
WHERE c.city = 'NAGPUR';
```

**Output:**
| cname |
|-------|
| (No results returned) |

---

## (3) Give city as their city name of customers having same living branch.

> **Note on the Question:** This question is ambiguous. The query below assumes it means "List customers who have a branch in their own city."

**SQL Query:**
```sql
SELECT c.cname, c.city AS "Customer City", b.bname AS "Branch Name", b.city AS "Branch City"
FROM customers c
JOIN deposit d ON c.cname = d.cname
JOIN branch b ON d.bname = b.bname
WHERE c.city = b.city;
```

**Output:**
| cname | Customer City | Branch Name | Branch City |
|-------|---------------|-------------|-------------|
| (No results returned) |

---

## (4) Write a query to display the last name, department number, and department name for all employees.

**SQL Query:**
```sql
SELECT e.name AS "Last Name", d.dept_no AS "Department Number", d.dept_name AS "Department Name"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no;
```

**Output:**
| Last Name    | Department Number | Department Name |
|--------------|-------------------|-----------------|
| Clark        | 10                | Account         |
| Scott        | 10                | Account         |
| Ward         | 20                | Research        |
| Jones        | 20                | Research        |
| Guy | 20                | Research        |
| King         | 30                | Sales           |
| Blake        | 40                | Operations      |

---

## (5) Create a unique listing of all jobs that are in department 30. Include the location of the department in the output

**SQL Query:**
```sql
SELECT DISTINCT j.job_name AS "Job", d.dept_loc AS "Location"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
JOIN job j ON d.job_id = j.job_id
WHERE e.dept_no = 30;
```

**Output:**
| Job             | Location |
|-----------------|----------|
| Finance manager | Chicago  |

---

## (6) Write a query to display the employee name, department number, and department name for all employees who work in NEW YORK.

**SQL Query:**
```sql
SELECT e.name AS "Employee Name", d.dept_no AS "Department Number", d.dept_name AS "Department Name"
FROM emp e
JOIN dept d ON e.dept_no = d.dept_no
WHERE d.dept_loc = 'New York';
```

**Output:**
| Employee Name | Department Number | Department Name |
|---------------|-------------------|-----------------|
| Clark         | 10                | Account         |
| Scott         | 10                | Account         |

---

## (7) Display the employee last name and employee number along with their manager's last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.

**SQL Query:**
```sql
SELECT e.name AS "Employee", e.emp_no AS "Emp#", m.name AS "Manager", m.emp_no AS "Mgr#"
FROM emp e
LEFT JOIN emp m ON e.manager_no = m.emp_no;
```

**Output:**
| Employee     | Emp# | Manager | Mgr# |
|--------------|------|---------|------|
| Ward         | 101  | Jones   | 102  |
| Jones        | 102  | NULL    | NULL |
| Guy | 103  | Jones   | 102  |
| Blake        | 104  | NULL    | NULL |
| Clark        | 105  | NULL    | NULL |
| Scott        | 106  | Clark   | 105  |
| King         | 107  | NULL    | NULL |

---

## (8) Create a query to display the name and hire date of any employee hired after employee SCOTT.

**SQL Query:**
```sql
SELECT name, hire_date
FROM emp
WHERE hire_date > (SELECT hire_date FROM emp WHERE name = 'SCOTT');
```

**Output:**
| name         | hire_date  |
|--------------|------------|
| Ward         | 1995-02-22 |
| Guy | 1993-04-23 |
| Blake        | 1992-05-01 |
| Clark        | 1995-10-02 |
| King         | 1994-01-17 |

---

## Summary

This practice focuses on retrieving data from multiple tables using various types of **SQL JOINs**. Key concepts covered include:
- **INNER JOIN**: Used implicitly and explicitly to combine rows from multiple tables where the join condition is met (Q2, Q4, Q5, Q6).
- **LEFT JOIN (or LEFT OUTER JOIN)**: Used to retrieve all rows from the left table and the matched rows from the right table. If there is no match, the columns from the right table will have `NULL` values (Q1, Q7).
- **Self Join**: A join where a table is joined with itself. This is particularly useful for querying hierarchical data, such as finding an employee's manager (Q7).
- **Combining Joins with Subqueries**: Using a subquery in the `WHERE` clause to filter the results of a joined table (Q8).
