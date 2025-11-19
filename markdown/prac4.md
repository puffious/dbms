# DBMS Practice 4 - Pattern Matching with LIKE Predicate

## Q1) Display all employee whose name start with 'A' and third character is 'a'

**SQL Query:**
```sql
SELECT name FROM emp
WHERE name LIKE 'A_a%';
```

**Output:**
| name |
|------|

(No results - no employee name matches this pattern)

---

## Q2) Display name, number and salary of those employees whose name is 5 characters long and first three characters are 'Ani'

**SQL Query:**
```sql
SELECT 
    e.name, e.emp_no, j.min_sal, j.max_sal 
FROM 
    emp AS e, job AS j, dept AS d
WHERE 
    NAME like 'Ani__' 
    AND e.dept_no = d.dept_no 
    AND d.job_id = j.job_id;
```

**Output:**
| name | emp_no | min_sal | max_sal |
|------|--------|---------|---------|

(No results - no employee name matches this pattern)

---

## Q3) Display the non-null values of employees and also employee name second character should be 'n' and string should be 5 character long.

**SQL Query:**
```sql
SELECT * FROM emp
WHERE 
    name LIKE '_n___' 
    AND manager_no IS NOT NULL;
```

**Output:**
| emp_no | dept_no | name   | role     | role_id | hire_date  | manager_no |
|--------|---------|--------|----------|---------|------------|------------|
| 101    | 20      | Ward   | Salesman | 7697    | 1995-02-22 | 102        |
| 103    | 20      | Martin | Salesman | 7697    | 1993-04-23 | 102        |

---

## Q4) Display the null values of employee and also employee name's third character should be 'a'.

**SQL Query:**
```sql
SELECT * FROM emp
WHERE 
    name LIKE '__a%'
    AND manager_no IS NULL;
```

**Output:**
| emp_no | dept_no | name  | role      | role_id | hire_date  | manager_no |
|--------|---------|-------|-----------|---------|------------|------------|
| 102    | 20      | Jones | Manager   | 7839    | 1990-06-15 | NULL       |
| 104    | 40      | Blake | Manager   | 7839    | 1992-05-01 | NULL       |
| 105    | 10      | Clark | Manager   | 7839    | 1995-10-02 | NULL       |
| 107    | 30      | King  | President | 7000    | 1994-01-17 | NULL       |

---

## Q5) What will be output if you are giving LIKE predicate as '%\_%' ESCAPE '\'

**SQL Query:**
```sql
SELECT * FROM dept
WHERE job_id LIKE '%\_%'; 
```

**Explanation:**
The backslash '\' is an ESCAPE character and the underscore '_' after it signifies that '_' should be treated as a literal character instead of a wildcard. This query will find all records where job_id contains a literal underscore character.

**Output:**
| dept_no | dept_name | job_id  | dept_loc   |
|---------|-----------|---------|------------|
| 10      | Account   | IT_PROG | New York   |
| 20      | Research  | MK_MGR  | Delhi      |
| 30      | Sales     | FI_MGR  | Chicago    |
| 40      | Operations| FI_ACC  | Boston     |

(All records, as all job_ids contain the literal underscore character)
