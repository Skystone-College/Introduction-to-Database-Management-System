/*
SQL JOIN
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
*/

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

/*
===========================================================================================
Different Types of SQL JOINs

Here are the different types of the JOINs in SQL:

    1) (INNER) JOIN: Returns records that have matching values in both tables
    2) LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
    3) RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
    4) FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
===============================================================================================
*/


/*
1)SQL INNER JOIN Keyword
The INNER JOIN keyword selects records that have matching values in both tables.
*/

/* Syntax */
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

/* Example */
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 

/*  JOIN Three Tables */
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID); 

/*
==========================================================================================
2)SQL LEFT JOIN Keyword

The LEFT JOIN keyword returns all records from the left table (table1),
and the matched records from the right table (table2). The result is NULL from the 
right side, if there is no match.
*/

/* Syntax */ 
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

/* Example */
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

/*
=========================================================================================
3)SQL RIGHT JOIN Keyword

The RIGHT JOIN keyword returns all records from the right table (table2),
and the matched records from the left table (table1). The result is NULL 
from the left side, when there is no match.
*/

/* Syntax */
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

/* Example */
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; 


/*
==========================================================================================
4)SQL FULL OUTER JOIN Keyword

The FULL OUTER JOIN keyword return all records when there is a match in left (table1) or right (table2) table records.
Note: FULL OUTER JOIN can potentially return very large result-sets!
Tip: FULL OUTER JOIN and FULL JOIN are the same.

/* Syntax */
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition; 

/* Example */
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

/*
===============================================================================================
5)SQL Self JOIN

A self JOIN is a regular join, but the table is joined with itself.

/* Syntax */
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

/* Example */
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;