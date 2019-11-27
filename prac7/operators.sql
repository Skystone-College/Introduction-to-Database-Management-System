/*
Practical 4 (practical 2 in journal)
Implementation of DDL and DML commands of sql with examples

======================== DDL COMMANDS
DDL or Data Definition Language actually consists of SQL commands that can be used to define the databases schema. It simply deals with description of database schema and is used to create and modify the structure of database objects ins database.


    CREATE – is used to create the database or its objects (like table, index, function, views, store procedure and triggers).
    DROP – is used to delete objects from the database.
    ALTER-is used to alter the structure of the database.
    TRUNCATE–is used to remove all records from a table, including all spaces allocated for the records are removed.
    COMMENT –is used to add comments to the data dictionary.
    RENAME –is used to rename an object existing in the database.

*/

--show all databases
SHOW DATABASES;
SHOW TABLES;

--CREATE
CREATE DATABASE Auction;

USE Auction;

--DROP
CREATE TABLE students( roll_no int(3), name varchar(20), birth_time date, subject varchar(20) );
DROP TABLE students;

--ALTER
ALTER TABLE test 
	ADD (testColumn int(3), testColumn2 varchar(5));

ALTER TABLE test
	MODIFY testColumn2 int(10);
	
--TRUNCATE
TRUNCATE TABLE test;

--COMMENTS
-- this is a single line commant
/*
	this is 
	a multiline
	comment
*/

--RENAME WITH ALTER
ALTER TABLE test 
	RENAME  TO testRenamed;

-- GIVING ERROR
ALTER TABLE test
	CHANGE COLUMN name TO fullName;

	


/*
============================ DML COMMANDS
Data Manipulation Language. The SQL commands that deals with the manipulation of data present in database belong to DML and this includes most of the sql statements


    SELECT – is used to retrieve data from the a database.
    INSERT – is used to insert data into a table.
    UPDATE – is used to update existing data within a table.
    DELETE – is used to delete records from a database table.

*/

--SELECT
SELECT * FROM test;
SELECT name,subject FROM test;

--INSERT
CREATE TABLE test( roll_no int(3), name varchar(20),age int(2),birth_time date, subject varchar(20), marks int(5) );
INSERT INTO test VALUES (12,'aditya',	20,	'1996-09-26',	'english',	98);
INSERT INTO test VALUES (13,'sdf',		19,	'1994-03-06',	'math',		82);
INSERT INTO test VALUES (14,'vaishnavi',18,	'1998-05-12',	'history',	95);
INSERT INTO test VALUES (15,'aman',		24,	'1992-11-19',	'daa',		60);

--UPDATE
UPDATE test
	SET roll_no = 1413,name = 'newname',subject = 'DBMS' where roll_no = 12;
	
--DELETE RECORD
DELETE FROM test WHERE roll_no = 15; 


--AUCTION SYSTEM

CREATE TABLE Admin( id int(3), user_id int(3), status varchar(20));
CREATE TABLE Buyer( id int(3), user_id int(3), mobile int(10), status varchar(20), password varchar(20));
CREATE TABLE Bid_product( bid_id int(5), bid_pro_id int(5), bid_buyer_name varchar(20), bid_price int(20), status varchar(20));
CREATE TABLE Supplier( id int(3), user_id int(3), mobile int(10), status varchar(20), password varchar(20));
CREATE TABLE Product( pro_id int(3), pro_author varchar(20), pro_title varchar(20), pro_details varchar(100), pro_base_price int(10), pro_buyer varchar(20), pro_status varchar(20), pro_sold_price int(20));

INSERT INTO Admin VALUES (123,834,'pending');
INSERT INTO Buyer VALUES (123,234,23534535,'completed','password');
INSERT INTO Bid_product VALUES (432,365, 'aditya',50000,'completed');
INSERT INTO Supplier VALUES (342,563,34534564,'in process','password');
INSERT INTO Product VALUES (434, 'unsigned author' , 'book', 'Simple book for auction',10000,'aditya','in process',20000);

/*
================================================================================================
Practical 5 (Practical 3 in journal)
Implementation of functions in DBMS
	aggregate
	numeric
	date 
	character
	conversion
*/	

/*
1)Aggregate functions:
These functions are used to do operations from the values of the column and a single value is returned.
https://www.geeksforgeeks.org/database-management-system-aggregate-functions/

    AVG()
    COUNT()
    FIRST()
    LAST()
    MAX()
    MIN()
    SUM()
*/

--AVG(): It returns average value after calculating from values in a numeric column.
mysql> SELECT AVG(marks) AS AvgMarks FROM test;
+----------+
| AvgMarks |
+----------+
|  83.7500 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT AVG(age) AS AvgAge FROM test;

--COUNT()
mysql> SELECT COUNT(*) AS NumStudents FROM test;

mysql> SELECT COUNT(DISTINCT age) AS NumStudents FROM test;


--FIRST()


--LAST()


--MAX()
mysql> SELECT MAX(marks) AS MaxMarks FROM test;

--MIN()
mysql> SELECT MIN(marks) AS MinMarks FROM test;

--SUM()
mysql> SELECT SUM(marks) AS TotalMarks FROM test;

/*
2)Numeric Functions
Numeric Functions are used to perform operations on numbers and return numbers.
https://www.geeksforgeeks.org/sql-numeric-functions/
ABS()	ACOS()	ASIN()
ATAN()	CEIL()	CEILING()
COS()	COT()	DEGREES()
DIV()	EXP()	FLOOR()
GREATEST()		LEAST()
LN()	LOG10()	LOG2()
MOD()	PI()	POW()
RADIANS()		RAND()
ROUND()	SIGN()	SIN()
SQRT()	TAN()	ATAN2()
TRUNCATE()
*/

mysql> SELECT ABS(-243.5);
+-------------+
| ABS(-243.5) |
+-------------+
|       243.5 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT ACOS(0.25);

mysql> SELECT CEIL(25.75);

mysql> SELECT CEILING(25.75);

mysql>  SELECT DEGREES(1.5);

mysql> SELECT 10 DIV 5;

mysql> SELECT EXP(1);

mysql> SELECT GREATEST(30, 2, 36, 81, 125);
+------------------------------+
| GREATEST(30, 2, 36, 81, 125) |
+------------------------------+
|                          125 |
+------------------------------+
1 row in set (0.00 sec)

mysql> SELECT LN(2);

mysql> SELECT MOD(18, 4);

mysql> SELECT POW(4, 2);

mysql>  SELECT RAND();

mysql> SELECT SIGN(255.5);

mysql> SELECT SQRT(25);

mysql> SELECT ATAN2(7);

mysql> SELECT TRUNCATE(7.53635, 2);
+----------------------+
| TRUNCATE(7.53635, 2) |
+----------------------+
|                 7.53 |
+----------------------+
1 row in set (0.00 sec)

/*
3)Date functions
In SQL, dates are complicated for newbies, since while working with database, the format of the date in table must be matched with the input date in order to insert. In various scenarios instead of date, datetime (time is also involved with date) is used.
https://www.geeksforgeeks.org/sql-date-functions/
NOW()
CURDATE()
CURTIME()
DATE()
EXTRACT()
DATE_ADD()
DATE_SUB()
DATEDIFF()
DATE_FORMAT()
*/

mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2019-08-16 11:37:56 |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT CURDATE();

mysql> SELECT CURTIME();

mysql> SELECT name, Extract(YEAR FROM birth_time) AS BirthYear FROM test;
+-----------+-----------+
| name      | BirthYear |
+-----------+-----------+
| aditya    |      1996 |
| aditya    |      1996 |
| sdf       |      1994 |
| vaishnavi |      1998 |
| aman      |      1992 |
| aditya    |      1996 |
| sdf       |      1994 |
| vaishnavi |      1998 |
| aman      |      1992 |
+-----------+-----------+
9 rows in set (0.00 sec)

mysql> SELECT name, DATE_ADD(birth_time, INTERVAL 1 YEAR) AS BirthTimeModified FROM test;
+-----------+-------------------+
| name      | BirthTimeModified |
+-----------+-------------------+
| aditya    | 1997-09-26        |
| aditya    | 1997-09-26        |
| sdf       | 1995-03-06        |
| vaishnavi | 1999-05-12        |
| aman      | 1993-11-19        |
| aditya    | 1997-09-26        |
| sdf       | 1995-03-06        |
| vaishnavi | 1999-05-12        |
| aman      | 1993-11-19        |
+-----------+-------------------+
9 rows in set (0.00 sec)

/*
4)Character Functions
Character functions accept character inputs and can return either characters or number values as output. SQL provides a number of different character datatypes which includes – CHAR, VARCHAR, VARCHAR2, LONG, RAW, and LONG RAW. The various datatypes are categorized into three different datatypes :

    VARCHAR2 – A variable-length character datatype whose data is converted by the RDBMS.
    CHAR – The fixed-length datatype.
    RAW – A variable-length datatype whose data is not converted by the RDBMS, but left in “raw” form

https://www.geeksforgeeks.org/sql-character-functions-examples/
=============================================================
SQL provides a rich set of character functions that allow you to get information about strings and modify the contents of those strings in multiple ways. Character functions are of the following two types:
1. Case-Manipulative Functions (LOWER, UPPER and INITCAP)
2. Character-Manipulative Functions (CONCAT, LENGTH, SUBSTR, INSTR, LPAD, RPAD, TRIM and REPLACE)
=============================================================
1.Case-Manipulative Functions

    a)LOWER : This function converts alpha character values to lowercase. LOWER will actually return a fixed-length string if the incoming string is fixed-length. LOWER will not change any characters in the string that are not letters, since case is irrelevant for numbers and special characters, such as the dollar sign ( $ ) or modulus ( % ).
    Syntax: LOWER(SQL course)

    b)UPPER : This function converts alpha character values to uppercase. Also UPPER function too, will actually return a fixed-length string if the incoming string is fixed-length. UPPER will not change any characters in the string that are not letters, since case is irrelevant for numbers and special characters, such as the dollar sign ( $ ) or modulus ( % ).
    Syntax: UPPER(SQL course)

    c)INITCAP : This function converts alpha character values to uppercase for the first letter of each word and all others in lowercase. The words in the string is must be separated by either # or _ or space.
    Syntax: INITCAP(SQL course)
=============================================================
2.Character-Manipulative Functions

    d)CONCAT : This function always appends ( concatenates ) string2 to the end of string1. If either of the string is NULL, CONCAT function returns the non-NULL argument. If both strings are NULL, CONCAT returns NULL.
    Syntax: CONCAT('String1', 'String2')
 
    e)LENGTH : This function returns the length of the input string. If the input string is NULL, then LENGTH function returns NULL and not Zero. Also, if the input string contains extra spaces at the start, or in between or at the end of the string, then the LENGTH function includes the extra spaces too and returns the complete length of the string.
    Syntax:  LENGTH(Column|Expression)

    f)SUBSTR : This function returns a portion of a string from a given start point to an end point. If a substring length is not given, then SUBSTR returns all the characters till the end of string (from the starting position specified).
    Syntax: SUBSTR('String',start-index,length_of_extracted_string)

    g)INSTR : This function returns numeric position of a character or a string in a given string. Optionally, you can provide a position m to start searching, and the occurrence n of string. Also, if the starting position is not given, then it starts search from index 1, by default. If after searching in the string, no match is found then, INSTR function returns 0.

    Syntax: INSTR(Column|Expression, 'String', [,m], [n])

    h)LPAD and RPAD : These functions return the strings padded to the left or right ( as per the use ) ; hence the “L” in “LPAD” and the “R” in “RPAD” ; to a specified length, and with a specified pad string. If the pad string is not specified, then the given string is padded on the left or right ( as per the use ) with spaces.
    Syntax: LPAD(Column|Expression, n, 'String')
    Syntax: RPAD(Column|Expression, n, 'String')

    i)TRIM : This function trims the string input from the start or end (or both). If no string or char is specified to be trimmed from the string and there exists some extra space at start or end of the string, then those extra spaces are trimmed off.

    Syntax: TRIM(Leading|Trailing|Both, trim_character FROM trim_source)

    j)REPLACE : This function searches for a character string and, if found, replaces it with a given replacement string at all the occurrences of the string. REPLACE is useful for searching patterns of characters and then changing all instances of that pattern in a single function call.
    If a replacement string is not given, then REPLACE function removes all the occurrences of that character string in the input string. If neither a match string nor a replacement string is specified, then REPLACE returns NULL.

    Syntax: REPLACE(Text, search_string, replacement_string)

*/

mysql> SELECT LOWER('GEEKSFORGEEKS') FROM DUAL;
+------------------------+
| LOWER('GEEKSFORGEEKS') |
+------------------------+
| geeksforgeeks          |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT UPPER('geeksforgeeks') FROM DUAL;
+------------------------+
| UPPER('geeksforgeeks') |
+------------------------+
| GEEKSFORGEEKS          |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT INITCAP('geeksforgeeks is a computer science portal for geeks') FROM DUAL;
ERROR 1305 (42000): FUNCTION Auction.INITCAP does not exist
mysql> SELECT INITCAP('PRACTICE_CODING_FOR_EFFICIENCY') FROM DUAL;
ERROR 1305 (42000): FUNCTION Auction.INITCAP does not exist
mysql> SELECT CONCAT( NULL ,'Android') FROM DUAL;
+--------------------------+
| CONCAT( NULL ,'Android') |
+--------------------------+
| NULL                     |
+--------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('computer' ,'science') FROM DUAL;
+-------------------------------+
| CONCAT('computer' ,'science') |
+-------------------------------+
| computerscience               |
+-------------------------------+
1 row in set (0.00 sec)

mysql> SELECT LENGTH('') FROM DUAL; or SELECT LENGTH( NULL ) FROM DUAL;
+------------+
| LENGTH('') |
+------------+
|          0 |
+------------+
1 row in set (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'or SELECT LENGTH( NULL ) FROM DUAL' at line 1
mysql> SELECT LENGTH('Learning Is Fun') FROM DUAL;
+---------------------------+
| LENGTH('Learning Is Fun') |
+---------------------------+
|                        15 |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTR('Database Management System', 9) FROM DUAL;
+-----------------------------------------+
| SUBSTR('Database Management System', 9) |
+-----------------------------------------+
|  Management System                      |
+-----------------------------------------+
1 row in set (0.00 sec)

mysql>  SELECT INSTR('Google apps are great applications','app',1,2) FROM DUAL;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'INSTR'
mysql> SELECT LPAD('hello', 21, 'geek') FROM DUAL;
+---------------------------+
| LPAD('hello', 21, 'geek') |
+---------------------------+
| geekgeekgeekgeekhello     |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT TRIM('G' FROM 'GEEKS') FROM DUAL;
+------------------------+
| TRIM('G' FROM 'GEEKS') |
+------------------------+
| EEKS                   |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT REPLACE('DATA MANAGEMENT', 'DATA','DATABASE') FROM DUAL;
+-----------------------------------------------+
| REPLACE('DATA MANAGEMENT', 'DATA','DATABASE') |
+-----------------------------------------------+
| DATABASE MANAGEMENT                           |
+-----------------------------------------------+
1 row in set (0.00 sec)



/*
5)SQL | Conversion Function
In some cases, the Server uses data of one type where it expects data of a different data type. This can happen when the Server can automatically convert the data to the expected data type. This data type conversion can be done implicitly by the Server, or explicitly by the user.
https://www.geeksforgeeks.org/sql-conversion-function/

a)Implicit Data-Type Conversion :
In this type of conversion the data is converted from one type to another implicitly (by itself/automatically).

b)Explicit Data-Type Conversion :

TO_CHAR Function :
	TO_CHAR function is used to typecast a numeric or date input to character type with a format model (optional).
	SYNTAX : TO_CHAR(number1, [format], [nls_parameter])

TO_NUMBER  Functions :
	Convert a character string to a number format using the TO_NUMBER function :
	TO_NUMBER(char[, ’format_model’])

TO_DATE Functions :
	Convert a character string to a date format using the TO_DATE function:
	TO_DATE(char[, ’format_model’])

These functions have an fx modifier. This modifier specifies the exact matching for the character argument and date format model of a TO_DATE function.



*/



--1)Implicit data-type conversion

mysql> SELECT roll_no,name,age FROM test WHERE age > 19 ;
+---------+--------+------+
| roll_no | name   | age  |
+---------+--------+------+
|      12 | aditya |   20 |
|      12 | aditya |   20 |
|      15 | aman   |   24 |
|      12 | aditya |   20 |
|      15 | aman   |   24 |
+---------+--------+------+
5 rows in set (0.00 sec)

-- here below we used char but it converted it to int
mysql> SELECT roll_no,name,age FROM test WHERE age > '19' ;
+---------+--------+------+
| roll_no | name   | age  |
+---------+--------+------+
|      12 | aditya |   20 |
|      12 | aditya |   20 |
|      15 | aman   |   24 |
|      12 | aditya |   20 |
|      15 | aman   |   24 |
+---------+--------+------+
5 rows in set (0.01 sec)




/*
================================================================================================
Practical 6 (4 in journal)
Operators
	1)SQL Arithmetic Operators
	Operator 	Description 	
	+ 			Add 	
	- 			Subtract 	
	* 			Multiply 	
	/ 			Divide 	
	% 			Modulo 	
	
	2)SQL Bitwise Operators
	Operator 	Description
	& 			Bitwise AND
	| 			Bitwise OR
	^ 			Bitwise exclusive OR
	
	3)SQL Comparison Operators
	Operator 	Description 	
	= 			Equal to 	
	> 			Greater than 	
	< 			Less than 	
	>= 			Greater than or equal to 	
	<= 			Less than or equal to 	
	<> 			Not equal to 	
	
	4)SQL Compound Operators
	Operator 	Description
	+= 			Add equals
	-= 			Subtract equals
	*= 			Multiply equals
	/= 			Divide equals
	%= 			Modulo equals
	&= 			Bitwise AND equals
	^-= 		Bitwise exclusive equals
	|*= 		Bitwise OR equals
	
	5)SQL Logical Operators
	Operator 	Description 	
	ALL 		TRUE if all of the subquery values meet the condition 	
	AND 		TRUE if all the conditions separated by AND is TRUE 	
	ANY 		TRUE if any of the subquery values meet the condition 	
	BETWEEN 	TRUE if the operand is within the range of comparisons 	
	EXISTS 		TRUE if the subquery returns one or more records 	
	IN 			TRUE if the operand is equal to one of a list of expressions 	
	LIKE 		TRUE if the operand matches a pattern 	
	NOT 		Displays a record if the condition(s) is NOT TRUE 	
	OR 			TRUE if any of the conditions separated by OR is TRUE 	
	SOME 		TRUE if any of the subquery values meet the condition 	

	6)SQL Set Operator
	IN 			TRUE if the operand is equal to one of a list of expressions
*/

=====================================
1)Arithmetic operator

mysql> SELECT 30 + 20;
+---------+
| 30 + 20 |
+---------+
|      50 |
+---------+
1 row in set (0.00 sec)

mysql> SELECT 30 - 20;


mysql> SELECT 30 * 20;


mysql> SELECT 30 / 20;
+---------+
| 30 / 20 |
+---------+
|  1.5000 |
+---------+
1 row in set (0.00 sec)

mysql> SELECT 30 % 20;

=================================================
2) Comparision Operator

mysql> SELECT * FROM test WHERE age = 20;
+---------+--------+------+------------+---------+-------+
| roll_no | name   | age  | birth_time | subject | marks |
+---------+--------+------+------------+---------+-------+
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
+---------+--------+------+------------+---------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE marks > 60;
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
+---------+-----------+------+------------+---------+-------+
7 rows in set (0.01 sec)

mysql> SELECT * FROM test WHERE marks < 90;
+---------+------+------+------------+---------+-------+
| roll_no | name | age  | birth_time | subject | marks |
+---------+------+------+------------+---------+-------+
|      13 | sdf  |   19 | 1994-03-06 | math    |    82 |
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
|      13 | sdf  |   19 | 1994-03-06 | math    |    82 |
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
+---------+------+------+------------+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE age >= 21;
+---------+------+------+------------+---------+-------+
| roll_no | name | age  | birth_time | subject | marks |
+---------+------+------+------------+---------+-------+
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
+---------+------+------+------------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE age <= 20;
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
+---------+-----------+------+------------+---------+-------+
7 rows in set (0.01 sec)

mysql> SELECT * FROM test WHERE age <> 20;
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
+---------+-----------+------+------------+---------+-------+
6 rows in set (0.00 sec)


======================================
3) Logical Operators


mysql> SELECT * FROM test WHERE name LIKE 'a%';
+---------+--------+------+------------+---------+-------+
| roll_no | name   | age  | birth_time | subject | marks |
+---------+--------+------+------------+---------+-------+
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      15 | aman   |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      15 | aman   |   24 | 1992-11-19 | daa     |    60 |
+---------+--------+------+------------+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE name NOT LIKE 'a%';
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
+---------+-----------+------+------------+---------+-------+
4 rows in set (0.00 sec)


mysql> SELECT * FROM test WHERE marks > 70 AND age > 19 ;
+---------+--------+------+------------+---------+-------+
| roll_no | name   | age  | birth_time | subject | marks |
+---------+--------+------+------------+---------+-------+
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
+---------+--------+------+------------+---------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE subject IN ('english','daa');
+---------+--------+------+------------+---------+-------+
| roll_no | name   | age  | birth_time | subject | marks |
+---------+--------+------+------------+---------+-------+
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      15 | aman   |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya |   20 | 1996-09-26 | english |    98 |
|      15 | aman   |   24 | 1992-11-19 | daa     |    60 |
+---------+--------+------+------------+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM test WHERE marks < 70 OR age > 21 ;
+---------+------+------+------------+---------+-------+
| roll_no | name | age  | birth_time | subject | marks |
+---------+------+------+------------+---------+-------+
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
|      15 | aman |   24 | 1992-11-19 | daa     |    60 |
+---------+------+------+------------+---------+-------+
2 rows in set (0.00 sec)


mysql> SELECT * FROM test WHERE marks BETWEEN 70 AND 90 ;
+---------+------+------+------------+---------+-------+
| roll_no | name | age  | birth_time | subject | marks |
+---------+------+------+------------+---------+-------+
|      13 | sdf  |   19 | 1994-03-06 | math    |    82 |
|      13 | sdf  |   19 | 1994-03-06 | math    |    82 |
+---------+------+------+------------+---------+-------+
2 rows in set (0.01 sec)

--DOUBT
mysql> SELECT * FROM test WHERE EXISTS (SELECT age FROM test WHERE age > 20);
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
+---------+-----------+------+------------+---------+-------+
9 rows in set (0.00 sec)

--DOUBT
mysql> SELECT * FROM test WHERE marks > ALL (SELECT age FROM test WHERE age > 20);
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
+---------+-----------+------+------------+---------+-------+
9 rows in set (0.00 sec)

--DOUBT
mysql> SELECT * FROM test WHERE marks > ANY (SELECT age FROM test WHERE age > 20);
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
+---------+-----------+------+------------+---------+-------+
9 rows in set (0.00 sec)


mysql> SELECT * FROM test WHERE marks > SOME (SELECT age FROM test WHERE age > 20);
+---------+-----------+------+------------+---------+-------+
| roll_no | name      | age  | birth_time | subject | marks |
+---------+-----------+------+------------+---------+-------+
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
|      12 | aditya    |   20 | 1996-09-26 | english |    98 |
|      13 | sdf       |   19 | 1994-03-06 | math    |    82 |
|      14 | vaishnavi |   18 | 1998-05-12 | history |    95 |
|      15 | aman      |   24 | 1992-11-19 | daa     |    60 |
+---------+-----------+------+------------+---------+-------+
9 rows in set (0.00 sec)









