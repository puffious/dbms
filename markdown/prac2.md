# DBMS Practice 2 - Basic SELECT Queries

## Q1) List all data from table DEPOSIT.

**SQL Query:**
```sql
SELECT * FROM deposit;
```

**Output:**
| actno | cname    | bname       | amount  | adate      |
|-------|----------|-------------|---------|------------|
| 100   | ANIL     | VRCE        | 1000.00 | 1995-03-01 |
| 101   | SUNIL    | AJNI        | 5000.00 | 1996-01-04 |
| 102   | MEHUL    | KHAROLBAGH  | 3500.00 | 1995-11-17 |
| 104   | MADHURI  | CHANDI      | 1200.00 | 1995-12-17 |
| 105   | PRMOD    | M.G.ROAD    | 3000.00 | 1996-03-27 |
| 106   | SANDIP   | ANDHERI     | 2000.00 | 1996-03-31 |
| 107   | SHIVANI  | VIRAR       | 1000.00 | 1995-09-05 |
| 108   | KRANTI   | NEHRU PLACE | 5000.00 | 1995-07-02 |
| 109   | MINU     | POWAI       | 7000.00 | 1995-08-10 |

---

## Q2) List all data from table BORROW.

**SQL Query:**
```sql
SELECT * FROM borrow;
```

**Output:**
| loanno | cname   | bname        | amount   |
|--------|---------|--------------|----------|
| 201    | ANIL    | VRCE         | 1000.00  |
| 206    | MEHUL   | AJNI         | 5000.00  |
| 311    | SUNIL   | DHARAMPETH   | 3000.00  |
| 321    | MADHURI | ANDHERI      | 2000.00  |
| 375    | PRMOD   | VIRAR        | 8000.00  |
| 481    | KRANTI  | NEHRU PLACE  | 3000.00  |

---

## Q3) List all data from table CUSTOMERS.

**SQL Query:**
```sql
SELECT * FROM customers;
```

**Output:**
| cname    | city     |
|----------|----------|
| ANIL     | CALCUTTA |
| SUNIL    | DELHI    |
| MEHUL    | BARODA   |
| MANDAR   | PATNA    |
| MANDHURI | NAGPUR   |
| PRAMOD   | NAGPUR   |
| SANDIP   | SURAT    |
| SHIVANI  | BOMBAY   |
| KRANTI   | BOMBAY   |
| NAREN    | BOMBAY   |

---

## Q4) List all data from table BRANCH.

**SQL Query:**
```sql
SELECT * FROM branch;
```

**Output:**
| bname       | city        |
|-------------|-------------|
| VRCE        | NAGPUR      |
| AJNI        | NAGPUR      |
| KHAROLBAGH  | DELHI       |
| CHANDI      | CHANDIGARH  |
| M.G.ROAD    | BANGALORE   |
| ANDHERI     | MUMBAI      |
| VIRAR       | MUMBAI      |
| NEHRU PLACE | DELHI       |
| POWAI       | MUMBAI      |

---

## Q5) Give account no and amount of depositors.

**SQL Query:**
```sql
SELECT actno, amount FROM deposit;
```

**Output:**
| actno | amount  |
|-------|---------|
| 100   | 1000.00 |
| 101   | 5000.00 |
| 102   | 3500.00 |
| 104   | 1200.00 |
| 105   | 3000.00 |
| 106   | 2000.00 |
| 107   | 1000.00 |
| 108   | 5000.00 |
| 109   | 7000.00 |

---

## Q6) Give name of depositors having amount greater than 4000.

**SQL Query:**
```sql
SELECT cname FROM deposit
WHERE amount > 4000;
```

**Output:**
| cname  |
|--------|
| SUNIL  |
| KRANTI |
| MINU   |

---

## Q7) Give name of customers who opened account after date '1-12-95'

**SQL Query:**
```sql
SELECT cname FROM deposit
WHERE adate > '1995-12-01';
```

**Output:**
| cname  |
|--------|
| PRMOD  |
| SANDIP |
| MINU   |

---

## Q8) Describe customer table

**SQL Query:**
```sql
DESC customers;
```

**Output:**
Displays the structure of the customers table with column names, data types, and constraints.
