SET SESSION sql_require_primary_key = 0;

-- create tables

create table deposit (
    ACTNO varchar(20), 
    CNAME varchar(18), 
    BNAME varchar(18), 
    AMOUNT float, 
    ADATE date
);

create table branch (
    BNAME varchar(18), 
    CITY varchar(18)
);

create table customers (
    CNAME varchar(19), 
    city varchar(18)
);

create table borrow (
    LOANNO varchar(5), 
    CNAME varchar(18), 
    BNAME varchar(18), 
    AMOUNT decimal(8,2)
);

-- insert data in tables

insert into deposit values 
('100', 'ANIL', 'VRCE', 1000.00, '1995-03-01'),
('101', 'SUNIL', 'AJNI', 5000.00, '1996-01-04'),
('102', 'MEHUL', 'KHAROLBAGH', 3500.00, '1995-11-17'),
('104', 'MADHURI', 'CHANDI', 1200.00, '1995-12-17'),
('105', 'PRMOD', 'M.G.ROAD', 3000, '1996-03-27'),
('106', 'SANDIP', 'ANDHERI', 2000, '1996-03-31'),
('107', 'SHIVANI', 'VIRAR', 1000, '1995-09-05'),
('108', 'KRANTI', 'NEHRU PLACE', 5000, '1995-07-02'),
('109', 'MINU', 'POWAI', 7000, '1995-08-10');

insert into branch values
('VRCE', 'NAGPUR'),
('AJNI', 'NAGPUR'),
('KHAROLBAGH', 'DELHI'),
('CHANDI', 'CHANDIGARH'),
('M.G.ROAD', 'BANGALORE'),
('ANDHERI', 'MUMBAI'),
('VIRAR', 'MUMBAI'),
('NEHRU PLACE', 'DELHI'),
('POWAI', 'MUMBAI');

INSERT INTO customers VALUES
('ANIL', 'CALCUTTA'), 
('SUNIL', 'DELHI'), 
('MEHUL', 'BARODA'), 
('MANDAR', 'PATNA'), 
('MANDHURI', 'NAGPUR'), 
('PRAMOD', 'NAGPUR'), 
('SANDIP', 'SURAT'), 
('SHIVANI', 'BOMBAY'), 
('KRANTI', 'BOMBAY'), 
('NAREN', 'BOMBAY');

insert into borrow values
(201, 'ANIL', 'VRCE', 1000.00),
(206, 'MEHUL', 'AJNI', 5000.00),
(311, 'SUNIL', 'DHARAMPETH', 3000.00),
(321, 'MADHURI', 'ANDHERI', 2000.00),
(375, 'PRMOD', 'VIRAR', 8000.00),
(481, 'KRANTI', 'NEHRU PLACE', 3000.00);

-- Q1) Describe deposit, branch
desc deposit;
desc branch;

-- Q2) Describe borrow, customers
desc borrow;
desc customers;

