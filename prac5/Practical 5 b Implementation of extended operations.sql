/*
	Practical 5 b
	Implementation of extended operations
	1)Natural Joins
	2)Group By  &  Having  Clause
	3)Order By Clause

*/

/*  
	1)Natural Joins
	Syntax
	TableExpression NATURAL [ { LEFT | RIGHT } [ OUTER ] | INNER ] JOIN { TableViewOrFunctionExpression | ( TableExpression ) }
*/

mysql> SELECT * FROM Orders NATURAL JOIN Shippers LIMIT 20;

mysql> SELECT * FROM Orders NATURAL JOIN OrderDetails LIMIT 20;

/*
	2)Group by 
	
	The SQL GROUP BY StatementThe GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

	The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columns.
	
	SYNTAX
	
	SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	ORDER BY column_name(s);
*/

mysql> SELECT COUNT(CustomerID), Country
    -> FROM Customers
    -> GROUP BY Country;

mysql> SELECT COUNT(CustomerID), Country
    -> FROM Customers
    -> GROUP BY Country
    -> ORDER BY COUNT(CustomerID) DESC;
    
/*
The SQL HAVING Clause
The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.

Syntax
	SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	HAVING condition
	ORDER BY column_name(s);
*/    

mysql> SELECT COUNT(CustomerID), Country
    -> FROM Customers
    -> GROUP BY Country
    -> HAVING COUNT(CustomerID) > 5;
    
/*
The SQL ORDER BY Keyword
The ORDER BY keyword is used to sort the result-set in ascending or descending order.

The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

ORDER BY Syntax
	SELECT column1, column2, ...
	FROM table_name
	ORDER BY column1, column2, ... ASC|DESC;
*/

mysql> SELECT * FROM Customers
    -> ORDER BY Country
    -> LIMIT 20;

mysql> SELECT * FROM Customers
    -> ORDER BY Country, CustomerName
    -> LIMIT 20;


