-- Q1) List all data from table DEPOSIT.
select * from deposit;

-- Q2) List all data from table BORROW.
select * from borrow;

-- Q3) List all data from table CUSTOMERS.
select * from customers;

-- Q4) List all data from table BRANCH.
select * from branch;

-- Q5) give account no and amount of depositors.
select ACTNO, AMOUNT from deposit;

-- Q6) Give name of depositors having amount greater than 4000.
select CNAME from deposit
where AMOUNT > 4000;

-- Q7) Give name of customers who opened account after date '1-12-95'
select CNAME from deposit
where ADATE > '1995-12-1';

-- Q8) Describe customer table
desc customers;