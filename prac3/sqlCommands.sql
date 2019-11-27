CREATE DATABASE Auction;

USE Auction;

--DROP
CREATE TABLE students( roll_no int(3), name varchar(20), subject varchar(20) );
DROP TABLE students;

--INSERT
CREATE TABLE test( roll_no int(3), name varchar(20), subject varchar(20) );
INSERT INTO test VALUES (12,'aditya','english');
INSERT INTO test VALUES (13,'sdf','math');
INSERT INTO test VALUES (14,'vaishnavi','history');
INSERT INTO test VALUES (15,'aman','daa');

--TRUNCATE
TRUNCATE TABLE test;

--ALTER
ALTER TABLE test 
	ADD (testColumn int(3), testColumn2 varchar(5));
ALTER TABLE test
	DROP COLUMN testColumn;
ALTER TABLE test
	MODIFY testColumn2 int(10);

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
