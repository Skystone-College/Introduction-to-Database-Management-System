/*
	Practical 6 
	Study and implementation of 
	1)NULL function
	2)CHECK function
	3)AUTO INCREMENT

*/

/*
	1)NULL Function
	A field with a NULL value is a field with no value.

	If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value.
	.

IS NULL Syntax
	SELECT column_names
	FROM table_name
	WHERE column_name IS NULL;
	IS NOT NULL Syntax
	SELECT column_names
	FROM table_name
	WHERE column_name IS NOT NULL;
*/

mysql> SELECT CustomerName, ContactName, Address
    -> FROM Customers
    -> WHERE Address IS NOT NULL
    -> LIMIT 20;

mysql> SELECT CustomerName, ContactName, Address
    -> FROM Customers
    -> WHERE Address IS NULL;


/*
	2)SQL CHECK Constraint
The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a single column it allows only certain values for this column.

If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.

*/

-- Create table

mysql> CREATE TABLE Persons1 (
    ->     ID int NOT NULL,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int,
    ->     CHECK (Age>=18)
    -> );
    
-- Alter table
mysql> ALTER TABLE test 
	-> ADD CHECK (age>=18);
	
/*
	AUTO INCREMENT Field
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

Syntax for MySQL
The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);

*/

-- Create Table
mysql> CREATE TABLE Persons (
    ->     Personid int NOT NULL AUTO_INCREMENT,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int,
    ->     PRIMARY KEY (Personid)
    -> );


-- ALTER TABLE
mysql> ALTER TABLE Persons AUTO_INCREMENT=100;

-- Inserting
mysql> INSERT INTO Persons (FirstName,LastName)
    -> VALUES ('Aditya','Mahajan');


