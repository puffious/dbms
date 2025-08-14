# **Database Management Systems**

---

## **Practical 1: Schema Creation and Data Insertion**

### **Context**
This practical covers creating a database schema and populating it with data for a simple bank.

### **Getting Started**
Your task is to write the `CREATE TABLE` and `INSERT INTO` statements to produce the four tables shown below. Infer the correct data types for each column.

#### `deposits`
| account\_number | customer\_name | branch\_name | amount | account\_date |
| :--- | :--- | :--- | :--- | :--- |
| 100 | ANIL | VRCE | 1000.00 | 1995-03-01 |
| 101 | SUNIL | AJNI | 5000.00 | 1996-01-04 |
| 102 | MEHUL | KAROLBAGH | 3500.00 | 1995-11-17 |
| 104 | MADHURI | CHANDI | 1200.00 | 1995-12-17 |
| 105 | PRAMOD | M.G.ROAD | 3000.00 | 1996-03-27 |
| 106 | SANDIP | ANDHERI | 2000.00 | 1996-03-31 |
| 107 | SHIVANI | VIRAR | 1000.00 | 1995-09-05 |
| 108 | KRANTI | NEHRU PLACE | 5000.00 | 1995-07-02 |
| 109 | MINU | POWAI | 7000.00 | 1995-08-10 |

#### `branches`
| branch\_name | city |
| :--- | :--- |
| VRCE | NAGPUR |
| AJNI | NAGPUR |
| KAROLBAGH | DELHI |
| CHANDI | DELHI |
| DHARAMPETH | NAGPUR |
| M.G.ROAD | BANGLORE |
| ANDHERI | BOMBAY |
| VIRAR | BOMBAY |
| NEHRU PLACE | DELHI |
| POWAI | BOMBAY |

#### `customers`
| customer\_name | city |
| :--- | :--- |
| ANIL | CALCUTTA |
| SUNIL | DELHI |
| MEHUL | BARODA |
| MADHURI | NAGPUR |
| PRAMOD | NAGPUR |
| SANDIP | SURAT |
| SHIVANI | BOMBAY |
| KRANTI | BOMBAY |
| NAREN | BOMBAY |
| MANDAR | PATNA |

#### `loans`
| loan\_number | customer\_name | branch\_name | amount |
| :--- | :--- | :--- | :--- |
| 201 | ANIL | VRCE | 1000.00 |
| 206 | MEHUL | AJNI | 5000.00 |
| 311 | SUNIL | DHARAMPETH | 3000.00 |
| 321 | MADHURI | ANDHERI | 2000.00 |
| 375 | PRAMOD | VIRAR | 8000.00 |
| 481 | KRANTI | NEHRU PLACE | 3000.00 |

### **Queries**
1.  Describe the structure of the `deposits` and `branches` tables.
2.  Describe the structure of the `loans` and `customers` tables.

---

## **Practical 2: Basic Data Retrieval (DML)**

### **Context**
This practical focuses on writing simple `SELECT` queries to retrieve data from the bank schema.

### **Queries**
*For these queries, you will use the tables from Practical 1.*

1.  List all data from the `deposits` table.
2.  List all data from the `loans` table.
3.  List the account number and amount for all depositors.
4.  List the names of depositors with an account `amount` greater than 4000.
5.  List the names of customers who opened their account after December 1st, 1995 (`1995-12-01`).

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 4</summary>
Use the `WHERE` clause with the greater than (`>`) operator to filter rows based on a numeric value.

**Expected Output:**
```
+---------------+
| customer_name |
+---------------+
| SUNIL         |
| KRANTI        |
| MINU          |
+---------------+
```
</details>

---

## **Practical 3: Data Constraints (DDL & DML)**

### **Context**
This practical introduces data integrity through constraints like `PRIMARY KEY` and `FOREIGN KEY` using a new HR schema.

### **Getting Started**
Write the `CREATE TABLE` statements for the schema below, ensuring you add the specified constraints. Then, `INSERT` the data.
*   **Constraints:** `employees.emp_no`, `departments.dept_no`, and `jobs.job_id` should be `PRIMARY KEY`s. `employees.dept_no` should be a `FOREIGN KEY` referencing `departments.dept_no`.

#### `employees`
| emp\_no | dept\_no | name | role | role\_id | hire\_date | manager\_no |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 101 | 20 | Adam | Salesman | 7697 | 1995-02-22 | 102 |
| 102 | 20 | Jones | Manager | 7839 | 1990-06-15 | NULL |
| 103 | 20 | Martin | Salesman | 7697 | 1993-04-23 | 102 |
| 104 | 40 | Blake | Manager | 7839 | 1992-05-01 | NULL |
| 105 | 10 | Clark | Manager | 7839 | 1995-10-02 | NULL |
| 106 | 10 | Scott | Analyst | 7565 | 1991-12-09 | 105 |
| 107 | 30 | King | President | 7000 | 1994-01-17 | NULL |

#### `departments`
| dept\_no | dept\_name | job\_id | dept\_loc |
| :--- | :--- | :--- | :--- |
| 10 | Account | IT\_PROG | New York |
| 20 | Research | MK\_MGR | Delhi |
| 30 | Sales | FI\_MGR | Chicago |
| 40 | Operations | FI\_ACC | Boston |

#### `jobs`
| job\_id | job\_name | min\_sal | max\_sal |
| :--- | :--- | :--- | :--- |
| IT\_PROG | Programmer | 1500 | 4000 |
| MK\_MGR | Marketing manager| 9000 | 15000 |
| FI\_MGR | Finance manager | 8200 | 12000 |
| FI\_ACC | Account | 1800 | 4200 |
| LEC | Lecturer | 2500 | 6000 |
| COMP\_OP | Computer Operator| 1500 | 3000 |

### **Queries**
1.  Add a new column `emp_address` (e.g., `VARCHAR(30)`) to the `employees` table.
2.  Remove the `emp_address` column from the `employees` table.
3.  Display the `name` and `salary` of employees in department `20`. Give the `name` column an alias of `employee`.

---

## **Practical 4: Value and Pattern Matching**

### **Context**
This practical focuses on using the `LIKE` operator to find data that matches specific string patterns.

### **Queries**
*For these queries, you will use the HR schema tables from Practical 3.*

1.  Display all employees whose name starts with 'A' and has 'a' as the third character.
2.  Display the name and role of employees whose name is 5 characters long and starts with the letters 'Jo'.
3.  Display all non-null records of employees where the name has 'n' as the second character and is five characters long.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 1</summary>
The `LIKE` operator uses wildcards: `_` matches a single character, and `%` matches any sequence of characters. A pattern for a name starting with 'A' with 'a' as the third letter would look like `A_a%`.

**Expected Output:**
```
+------+
| name |
+------+
| Adam |
+------+
```
</details>

<details>
<summary>Hints for Question 2</summary>
Combine fixed characters with the `_` wildcard to specify a pattern of a fixed length.

**Expected Output:**
```
+-------+---------+
| name  | role    |
+-------+---------+
| Jones | Manager |
+-------+---------+
```
</details>

---

## **Practical 5: Data Manipulation Functions**

### **Context**
This practical explores SQL's rich set of built-in functions for performing calculations and transformations on data.

### **Queries**
*For these queries, use the Bank Schema (Practical 1) and HR Schema (Practical 3).*

1.  List the total `amount` from the `deposits` table.
2.  List the total loan `amount` from the 'KAROLBAGH' branch.
3.  Display the maximum loan `amount` from the 'VRCE' branch.
4.  Count the total number of customers.
5.  Count the number of distinct cities customers are from.
6.  Display each employee's name, their name in all uppercase, their name in all lowercase, and the length of their name.
7.  Display the `name`, current `salary` (from `employees` and `jobs`), and a `new_salary` increased by 15% for all employees.
8.  Display the name, hire date, and the day of the week the employee was hired.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 6</summary>
Look for SQL string functions like `UPPER()`, `LOWER()`, and `LENGTH()` (or `LEN()` depending on the SQL dialect). You can use multiple functions in the same `SELECT` statement.

**Expected Output:**
```
+--------+--------+--------+--------+
| name   | UPPER  | lower  | LENGTH |
+--------+--------+--------+--------+
| Adam   | ADAM   | adam   | 4      |
| Jones  | JONES  | jones  | 5      |
...
+--------+--------+--------+--------+
```
</details>

<details>
<summary>Hints for Question 7</summary>
You will need to `JOIN` `employees` and `jobs` to get salary info. You can perform arithmetic directly in the `SELECT` clause (e.g., `max_sal * 1.15`). Use a rounding function like `ROUND()` or `CEIL()` to handle decimals.

**Expected Output:**
```
+-------+---------+------------+
| name  | salary  | new_salary |
+-------+---------+------------+
| Adam  | 15000   | 17250      |
| Jones | 15000   | 17250      |
...
+-------+---------+------------+
```
</details>

---

## **Practical 6: Aggregating Data**

### **Context**
This practical focuses on using aggregate functions with `GROUP BY` to summarize data into meaningful groups.

### **Queries**
*Use the Bank and HR schemas.*
1.  List the total deposit `amount` for customers who live in 'NAGPUR'.
2.  Display the highest, lowest, sum, and average salary of all employees.
3.  Display the average salary for each `dept_no`.
4.  Display the job ID and total salary for each job, but only for jobs where the total salary exceeds 3000.
5.  List the branches located in 'BOMBAY' that have a sum of deposits greater than 5000.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 5</summary>
This query requires filtering both before and after grouping. Use `WHERE city = 'BOMBAY'` to filter rows first. Then, use `GROUP BY branch_name`. Finally, use `HAVING SUM(amount) > 5000` to filter the groups.

**Expected Output:**
```
+-------------+
| branch_name |
+-------------+
| POWAI       |
+-------------+
```</details>

---

## **Practical 7: Subqueries**

### **Context**
This practical introduces subqueries, which are queries nested inside another query, to solve complex, multi-step problems.

### **Queries**
*Use the Bank and HR schemas.*
1.  Display the last name and hire date of any employee in the same department as 'Scott', excluding 'Scott'.
2.  Display the `employee_no` and `name` of all employees who earn more than the average salary.
3.  List the name of the branch having the highest number of depositors.
4.  Give the names of depositors who live in the same city as 'ANIL' and have a deposit `amount` greater than 2000.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 2</summary>
In your `WHERE` clause, you will compare an employee's salary to a value. That value is not fixed; it's the result of another query. Write a subquery `(SELECT AVG(salary) FROM ...)` and use it in the `WHERE` clause.

**Expected Output:** (Note: Assumes salary is derived from `max_sal` in the `jobs` table via a join)
```
+---------+-------+
| emp_no  | name  |
+---------+-------+
| 102     | Jones |
| 104     | Blake |
| 105     | Clark |
| 107     | King  |
+---------+-------+
```
</details>

<details>
<summary>Hints for Question 3</summary>
This can be solved with `GROUP BY`, `ORDER BY`, and `LIMIT`. Group the `deposits` table by `branch_name`, count the customers in each group, order the results by the count in descending order, and take the top 1.

**Expected Output:**
```
+-------------+
| branch_name |
+-------------+
| VRCE        |
(or any other branch if data changes, as multiple can have 1 depositor)
+-------------+
```
</details>

---

## **Practical 8: Joining Multiple Tables**

### **Context**
This practical focuses on the `JOIN` clause, the primary mechanism for combining rows from two or more tables.

### **Queries**
*Use the Bank and HR schemas.*
1.  List the names of customers who are both borrowers and depositors and live in 'NAGPUR'.
2.  Display the `name`, `department_no`, and `department_name` for all employees.
3.  Display the `employee` last name and `emp_no` along with their `manager`'s last name and `manager_no`.
4.  Create a unique list of all job titles in department 30, including the department's location in the output.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 3</summary>
This requires a "self-join," where you join a table to itself. Use aliases to treat the table as two different entities (e.g., `FROM employees e JOIN employees m ON e.manager_no = m.emp_no`). `e` represents the employee, and `m` represents the manager.

**Expected Output:**
```
+----------+--------+---------+------------+
| Employee | Emp_No | Manager | Manager_No |
+----------+--------+---------+------------+
| Adam     | 101    | Jones   | 102        |
| Martin   | 103    | Jones   | 102        |
| Scott    | 106    | Clark   | 105        |
+----------+--------+---------+------------+
```
</details>
