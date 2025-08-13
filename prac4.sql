-- Q1) Display all employee whose name start with 'A' and third character is 'a'

SELECT name FROM emp
WHERE name LIKE 'A_a%';

-- Q2) Display name, number and salary of those employees whose name is 5 characters long and first three characters are 'Ani'

SELECT 
    e.name, e.emp_no, j.min_sal, j.max_sal 
FROM 
    emp AS e, job AS j, dept AS d
where 
    NAME like 'Ani__' 
    AND e.dept_no = d.dept_no 
    AND d.job_id = j.job_id;

-- Q3) Display the non-null values of employees and also employee name second character should be ‘n’ and string should be 5 character long.

SELECT * FROM emp
WHERE 
    name LIKE '_n___' 
    AND manager_no IS NOT NULL;

-- Q4) Display the null values of employee and also employee name’s third character should be ‘a’.

SELECT * FROM emp
WHERE 
    name LIKE '__a%'
    AND manager_no IS NULL;

-- Q5) What will be output if you are giving LIKE predicate as ‘%\_%’ ESCAPE ‘\’
-- assuming the like predicate is applied on job_id of dept table

SELECT * FROM dept
WHERE job_id LIKE '%\_%'; 

-- here, '\' is an ESCAPE character and _ after it signifies it indicates '_' as a literal character instead of a wildcard
