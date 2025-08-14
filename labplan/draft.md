# **Database Management Systems: Problem Set**


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
| MINU | BOMBAY |

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
*   **1.** Describe the structure of the `deposits` and `branches` tables.
*   **2.** Describe the structure of the `loans` and `customers` tables.

---

## **Practical 2: Basic Data Retrieval (DML)**

### **Queries**
*For these queries, you will use the tables from Practical 1.*

*   **1.** List all data from the `deposits` table.
*   **2.** List all data from the `loans` table.
*   **3.** List all data from the `customers` table.
*   **4.** List the `account_number` and `amount` for all depositors.
*   **5.** List the names of depositors with an account `amount` greater than 4000.
    *   *(1 column, 3 rows)*
*   **6.** List the names of customers who opened their account after December 1st, 1995 (`1995-12-01`).
    *   *(1 column, 4 rows)*

---

## **Practical 3: Data Constraints and Alterations (DDL & DML)**

### **Context**
This practical introduces data integrity through constraints and altering table structures.

### **Getting Started**
Write the `CREATE TABLE` and `INSERT` statements for the HR schema below.
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
| 108 | 10 | Anish | Analyst | 7565 | 1996-05-12 | 105 |

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
| IT\_PROG | Programmer | NULL | 4000 |
| MK\_MGR | Marketing manager| 9000 | 15000 |
| FI\_MGR | Finance manager | 8200 | 12000 |
| FI\_ACC | Account | 1800 | 4200 |
| LEC | Lecturer | 2500 | 6000 |
| COMP\_OP | Computer Operator| 1500 | 3000 |

### **Queries**
*   **1.** Add a new column `emp_address` (`VARCHAR(30)`) to the `employees` table.
*   **2.** Remove the `emp_address` column from the `employees` table.
*   **3.** Modify the `deposits` table, changing the `account_number` data type to `CHARACTER(5)`.
*   **4.** Update the `jobs` table to set the `min_sal` to `1500` where it is currently `NULL`.
*   **5.** Display the account number and deposited amount for customers who opened accounts between '1996-01-01' and '1996-08-31'.
    *   *(2 columns, 3 rows)*
*   **6.** Display all job details where the `min_sal` is greater than 4000.
    *   *(all columns, 2 rows)*
*   **7.** Display the `emp_no`, `name`, and `dept_name` for employees in departments 10 and 20.
    *   *(3 columns, 6 rows)*

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 7 - Using `JOIN` and `IN`</summary>

You will need to `JOIN` the `employees` and `departments` tables on `dept_no`. Then, use a `WHERE` clause with the `IN` operator to filter for records where the `dept_no` is in the list `(10, 20)`.

**Expected Output:**
```
+--------+--------+------------+
| emp_no | name   | dept_name  |
+--------+--------+------------+
|    101 | Adam   | Research   |
|    102 | Jones  | Research   |
|    103 | Martin | Research   |
|    105 | Clark  | Account    |
|    106 | Scott  | Account    |
|    108 | Anish  | Account    |
+--------+--------+------------+
```
</details>

---

## **Practical 4: Value and Pattern Matching**

### **Queries**
*For these queries, use the HR schema tables from Practical 3.*

*   **1.** Display the `name` and `role` of employees whose name is 5 characters long and begins with 'An'.
    *   *(2 columns, 1 row)*
*   **2.** Display all records for employees where the name has 'a' as the third letter and the `manager_no` is `NULL`.
    *   *(all columns, 1 row)*
*   **3.** What is the purpose of the `ESCAPE` keyword when used with the `LIKE` operator, for example: `...WHERE name LIKE '%\_%' ESCAPE '\';`? Explain with an example.

---

## **Practical 5: Data Manipulation Functions**

### **Queries**
*Use the Bank and HR schemas.*
*   **1.** List the total `amount` from the `deposits` table.
*   **2.** Display each employee's `name`, `salary` (`max_sal`), and a `new_salary` increased by 15%.
    *   *(3 columns, 8 rows)*
*   **3.** Modify the previous query to also show the `increase_amount` (the difference between new and old salary).
    *   *(4 columns, 8 rows)*
*   **4.** Display the employee's name and salary in the format: `<employee name> earns <salary> monthly`.
    *   *(1 column, 8 rows)*
*   **5.** Update the `employees` table: change the `dept_no` to `10` for any employee whose name has 'm' as its third letter.
*   **6.** Delete all depositors from branches that have between 1 and 3 customers.

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 4 - Using `CONCAT()`</summary>

The `CONCAT()` (or `CONCAT_WS()`) function allows you to combine multiple strings and columns into a single string.

**Expected Output:**
```
+---------------------------------+
| monthly_earnings                |
+---------------------------------+
| Adam earns 15000 monthly        |
| Jones earns 15000 monthly       |
...
+---------------------------------+
```
</details>

<details>
<summary>Hints for Question 6 - `DELETE` with a Subquery</summary>

This is a complex operation. You need to delete from `deposits` where the `branch_name` is in a list. That list of branches comes from a subquery that:
1.  `SELECT`s the `branch_name` from `deposits`.
2.  Uses `GROUP BY branch_name`.
3.  Uses `HAVING COUNT(*) BETWEEN 1 AND 3`.

**Always be careful with `DELETE`. It's wise to run the `SELECT` part of your subquery first to see which branches you *would* be deleting from.**
</details>

---

## **Practical 6: Aggregating Data**

### **Queries**
*Use the Bank and HR schemas.*
*   **1.** List the total deposit `amount` for customers who live in 'NAGPUR'.
*   **2.** Display the highest, lowest, sum, and average `max_sal` of all employee job roles.
*   **3.** Display the average `max_sal` for each `dept_no`.
*   **4.** List the branches located in 'BOMBAY' that have a sum of deposits greater than 5000.

---

## **Practical 7: Subqueries**

### **Queries**
*Use the Bank and HR schemas.*
*   **1.** Display the `name` and `hire_date` of any employee in the same department as 'Scott', excluding 'Scott'.
*   **2.** Display the last name and `max_sal` of every employee who reports to 'Jones'.
    *   *(2 columns, 2 rows)*
*   **3.** Display the deposit and loan details (`customer_name`, `amount`) for all customers who live in the same city as 'PRAMOD'.
    *   *(2 columns, 4 rows)*
*   **4.** List the name of the city (or cities) that has the maximum number of branches.
    *   *(1 column, 2 rows)*
*   **5.** List the names of customers who live in a city that contains the most depositors overall.
    *   *(1 column, 4 rows)*

### **Hints & Expected Outputs**
<details>
<summary>Hints for Question 3 - Using `UNION` with Subqueries</summary>

This query requires combining two separate result sets.
1.  Write a `SELECT` statement to get deposit details for customers `WHERE` city is `(SELECT city FROM customers WHERE customer_name = 'PRAMOD')`.
2.  Write a `SELECT` statement to get loan details for customers using the same subquery.
3.  Use the `UNION ALL` operator between these two statements to combine the results into one list.

**Expected Output:**
```
+---------------+---------+
| customer_name | amount  |
+---------------+---------+
| MADHURI       | 1200.00 |
| PRAMOD        | 3000.00 |
| MADHURI       | 2000.00 |
| PRAMOD        | 8000.00 |
+---------------+---------+
```
</details>

<details>
<summary>Hints for Question 5 - Using Nested Subqueries</summary>
This is a multi-level query.
1.  The outer query selects `customer_name` `WHERE` `city` is in a list `(...)`.
2.  That list comes from a subquery that finds the city with the most depositors. This subquery will need to `GROUP BY city`, `COUNT` depositors, `ORDER BY` the count `DESC`, and `LIMIT 1`.

**Expected Output:**
```
+---------------+
| customer_name |
+---------------+
| SHIVANI       |
| KRANTI        |
| NAREN         |
| MINU          |
+---------------+
```
</details>

---

## **Practical 8: Joining Multiple Tables**

### **Queries**
*Use the Bank and HR schemas.*
*   **1.** List the names of customers who are both borrowers and depositors and live in 'NAGPUR'.
*   **2.** List the city of customers who have a deposit in a branch located in their own city of residence.
    *   *(1 column, 4 rows)*
*   **3.** Display the `name` and `hire_date` of any employee hired after employee 'Blake'.
    *   *(2 columns, 4 rows)*
*   **4.** Display the `name`, `department_no`, and `department_name` for all employees who work in 'NEW YORK'.
    *   *(3 columns, 3 rows)*
*   **5.** Display the employee's `name` and `emp_no` alongside their manager's `name` and `emp_no`.