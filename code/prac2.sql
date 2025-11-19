-- Q1) List all data from table DEPOSIT.
SELECT * FROM deposit;

-- Q2) List all data from table BORROW.
SELECT * FROM borrow;

-- Q3) List all data from table CUSTOMERS.
SELECT * FROM customers;

-- Q4) List all data from table BRANCH.
SELECT * FROM branch;

-- Q5) give account no and amount of depositors.
SELECT actno, amount FROM deposit;

-- Q6) Give name of depositors having amount greater than 4000.
SELECT cname FROM deposit
WHERE amount > 4000;

-- Q7) Give name of customers who opened account after date '1-12-95'
SELECT cname FROM deposit
WHERE adate > '1995-12-1';

-- Q8) Describe customer table
DESC customers;