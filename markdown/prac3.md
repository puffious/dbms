# DBMS Practice 3 - Table Modifications and ALTER/UPDATE Operations

## Q1) Add emp_address column in the emp table

**SQL Query:**
```sql
ALTER TABLE emp
ADD emp_address VARCHAR(100);
```

**Output:** Success

---

## Q2) Drop emp_address column from emp table

**SQL Query:**
```sql
ALTER TABLE emp
DROP COLUMN emp_address;
```

**Output:** Success

---

## Q3) Modify deposit table from ACTNO character(5)

**SQL Query:**
```sql
ALTER TABLE deposit
MODIFY COLUMN actno CHARACTER(5);
```

**Output:** Success

---

## Q4) Update min_sal where the salary is blank.

**SQL Query:**
```sql
UPDATE job
SET min_sal = 0
WHERE min_sal is NULL;
```

**Output:** 4 rows updated

---

## Q5) Retrieve all data from emp, job and dept.

**SQL Query:**
```sql
SELECT * FROM emp;
SELECT * FROM job;
SELECT * FROM dept;
```

**Output:**

### emp Table
| emp_no | dept_no | name   | role      | role_id | hire_date  | manager_no |
|--------|---------|--------|-----------|---------|------------|------------|
| 101    | 20      | Ward   | Salesman  | 7697    | 1995-02-22 | 102        |
| 102    | 20      | Jones  | Manager   | 7839    | 1990-06-15 | NULL       |
| 103    | 20      | Martin | Salesman  | 7697    | 1993-04-23 | 102        |
| 104    | 40      | Blake  | Manager   | 7839    | 1992-05-01 | NULL       |
| 105    | 10      | Clark  | Manager   | 7839    | 1995-10-02 | NULL       |
| 106    | 10      | Scott  | Analyst   | 7565    | 1991-12-09 | 105        |
| 107    | 30      | King   | President | 7000    | 1994-01-17 | NULL       |

### job Table
| job_id  | job_name              | min_sal | max_sal |
|---------|-----------------------|---------|---------|
| IT_PROG | Programmer            | 0       | 4000    |
| MK_MGR  | Marketing manager     | 9000    | 15000   |
| FI_MGR  | Finance manager       | 8200    | 12000   |
| FI_ACC  | Account               | 0       | 4200    |
| LEC     | Lecturer              | 0       | 6000    |
| COMP_OP | Computer Operator     | 1500    | 3000    |

### dept Table
| dept_no | dept_name | job_id  | dept_loc   |
|---------|-----------|---------|------------|
| 10      | Account   | IT_PROG | New York   |
| 20      | Research  | MK_MGR  | Delhi      |
| 30      | Sales     | FI_MGR  | Chicago    |
| 40      | Operations| FI_ACC  | Boston     |

---

## Q6) Give details of account no. and deposited rupees of customers having account opened between dates 01-01-96 and 31-08-96.

**SQL Query:**
```sql
SELECT actno, amount FROM deposit
WHERE adate BETWEEN '1996-01-01' AND '1996-08-31';
```

**Output:**
| actno | amount  |
|-------|---------|
| 101   | 5000.00 |
| 105   | 3000.00 |
| 106   | 2000.00 |

---

## Q7) Display all jobs with minimum salary greater than 4000

**SQL Query:**
```sql
SELECT * FROM job
WHERE min_sal > 4000;
```

**Output:**
| job_id | job_name          | min_sal | max_sal |
|--------|-------------------|---------|---------|
| MK_MGR | Marketing manager | 9000    | 15000   |
| FI_MGR | Finance manager   | 8200    | 12000   |

---

## Q8) Display name and salary of employee whose department no is 20.

**SQL Query:**
```sql
SELECT 
    e.name AS Employee_Name, 
    j.min_sal AS Minimum_Salary
FROM 
    emp AS e, job AS j, dept AS d
WHERE 
    e.dept_no = 20 
    AND e.dept_no = d.dept_no 
    AND d.job_id = j.job_id;
```

**Output:**
| Employee_Name | Minimum_Salary |
|---------------|----------------|
| Ward          | 9000           |
| Jones         | 9000           |
| Martin        | 9000           |
