
## Practical 10

### Aim:
To study and implement PL/SQL concepts in MySQL using cursors and triggers.

### Theory

**Cursors:** A cursor is a database object that allows you to retrieve and process rows from a result set one by one. While standard SQL commands operate on all rows in a result set at once, cursors provide a mechanism for row-by-row processing within stored procedures, functions, and triggers.

**Triggers:** A trigger is a stored program that is automatically executed in response to certain events on a particular table or view. These events can be `INSERT`, `UPDATE`, or `DELETE` operations. Triggers can be set to fire either `BEFORE` or `AFTER` the event. They are useful for enforcing business rules, maintaining data integrity, and creating audit trails.

### Steps

#### 1. Implementation of Cursors

**Create a log table:**

**Query:**

```sql
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Output:**

An empty `employee_log` table is created.

**Create a stored procedure with a cursor:**

**Query:**

```sql
DELIMITER //

CREATE PROCEDURE log_employee_names()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO employee_log (employee_name) VALUES (emp_name);
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;
```

**Output:**

The stored procedure `log_employee_names` is created.

**Execute the stored procedure and verify the result:**

**Query:**

```sql
CALL log_employee_names();
SELECT * FROM employee_log;
```

**Output:**

**employee_log**
| log_id | employee_name | log_time |
| :-- | :--- | :--- |
| 1 | Priya | 2025-11-05 16:20:15 |
| 2 | Rohan | 2025-11-05 16:20:15 |
| 3 | Arjun | 2025-11-05 16:20:15 |

#### 2. Implementation of Triggers

**Create an `AFTER INSERT` trigger:**

**Query:**

```sql
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (employee_name) VALUES (CONCAT('New employee added: ', NEW.name));
END //

DELIMITER ;
```

**Output:**

The trigger `after_employee_insert` is created.

**Test the trigger by inserting a new record:**

**Query:**

```sql
INSERT INTO employees VALUES (4, 'Vikram', 75000);
SELECT * FROM employees;
SELECT * FROM employee_log;
```

**Output:**

**employees**
| id | name | salary |
| :-- | :--- | :--- |
| 1 | Priya | 50000 |
| 2 | Rohan | 65000 |
| 3 | Arjun | 70000 |
| 4 | Vikram | 75000 |

**employee_log**
| log_id | employee_name | log_time |
| :-- | :--- | :--- |
| 1 | Priya | 2025-11-05 16:20:15 |
| 2 | Rohan | 2025-11-05 16:20:15 |
| 3 | Arjun | 2025-11-05 16:20:15 |
| 4 | New employee added: Vikram | 2025-11-05 16:22:30 |

### Conclusion

This practical has provided hands-on experience with advanced PL/SQL features in MySQL. We have learned how to use cursors to iterate through and process records on a row-by-row basis within a stored procedure. Additionally, we have implemented a trigger to automate an action in response to a data modification event, demonstrating a powerful tool for enforcing business logic and maintaining data integrity.
