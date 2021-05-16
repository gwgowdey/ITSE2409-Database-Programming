/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 11 - Chapter 11 Assignment.
*/

/*
Question 1:
Write a script that adds an index to the MyGuitarShop database for the zip code field in the Addresses table.
*/
USE MyGuitarShop;
CREATE INDEX ZipCodeIndex ON Addresses(ZipCode);

/*
Question 2:
Write a script that implements the following design in a database named MyWebDB.

See assignment PDF for design.

In the Downloads table, the UserID and ProductID columns are the foreign keys.
*/
/*
Question 2 - Part 1:
Include a statement to drop the database if it already exists.
*/
DROP DATABASE MyWebDB;
/*
Question 2 - Part 2:
Include statements to create and select the database.
*/
CREATE DATABASE MyWebDB;
USE MyWebDB;
/*
Question 2 - Part 3:
Include any indexes that you think are necessary.
*/
CREATE TABLE Users
(
UserID INT PRIMARY KEY NOT NULL,
EmailAddress VARCHAR(100),
FirstName VARCHAR(45),
LastName VARCHAR(45)
);

CREATE TABLE Downloads
(
DownloadID INT PRIMARY KEY NOT NULL,
UserID INT REFERENCES Users(UserID),
DownloadDate DATETIME,
[Filename] VARCHAR(50),
ProductID INT REFERENCES Products(ProductID)
);

CREATE TABLE Products
(
ProductID INT PRIMARY KEY NOT NULL,
ProductName VARCHAR(20)
);

/*
Question 3:
Write a script that adds rows to the database that you created in exercise 2.
*/
/*
Question 3 - Part 1:
Add two rows to the Users and Products tables.
*/
INSERT INTO Users VALUES(1, 'johnsmith@gmail.com', 'John', 'Smith');
INSERT INTO Users VALUES(2, 'janedoe@gmail.com', 'Jane', 'Doe');
INSERT INTO Products VALUES(1, 'Local Music Vol 1');
INSERT INTO Products VALUES(2, 'Local Music Vol 2');
/*
Question 3 - Part 2:
Add three rows to the Downloads table: one row for user 1 and product 2; one for user 2 and product
1; and one for user 2 and product 2. Use the GETDATE function to insert the current date and time
into the DownloadDate column.
*/
INSERT INTO Downloads VALUES(1, 2, GETDATE(), 'pedals_are_falling.mp3', 3);
INSERT INTO Downloads VALUES(1, 2, GETDATE(), 'turn_signal.mp3', 3);
INSERT INTO Downloads VALUES(1, 2, GETDATE(), 'one_horse_town.mp3', 3);
/*
Question 3 - Part 3:
Write a SELECT statement that joins the three tables and retrieves the data from these tables like this:

See assignment PDF for design.
*/
SELECT EmailAddress, FirstName, LastName, DownloadDate, [Filename], ProductName
FROM Users, Products, Downloads 
WHERE Users.UserID = Downloads.UserID
AND Products.ProductID = Downloads.ProductID
/*
Question 3 - Part 4:
Sort the results by the email address in descending order and the product name in ascending order.
*/
ORDER BY EmailAddress DESC, 
ProductName ASC;

/*
Question 4:
Write an ALTER TABLE statement that adds two new columns to the Products table created in exercise 2.
*/
/*
Question 4 - Part 1:
Add one column for product price that provides for three digits to the left of the decimal point and
two to the right. This column should have a default value of 9.99.
*/
ALTER TABLE Products
ADD ProductPrice REAL(5, 2) DEFAULT 9.99;
/*
Question 4 - Part 2:
Add one column for the date and time that the product was added to the database.
*/
ALTER TABLE Products
ADD DateProductAdded DATETIME;

/*
Question 5 - Part 1:
Write an ALTER TABLE statement that modifies the Users table created in exercise 2 so the
FirstName column cannot store null values and can store a maximum of 20 characters.
*/
ALTER TABLE Users
ALTER COLUMN FirstName VARCHAR(20) NOT NULL;
/*
Question 5 - Part 2:
Code an UPDATE statement that attempts to insert a null value into this column. It should fail due to
the not null constraint.
*/
INSERT INTO Users VALUES(1,'gwgowdey@gmail.com', NULL, 'Griff');
/*
Question 5 - Part 3:
Code another UPDATE statement that attempts to insert a first name that’s longer than 20 characters.
It should fail due to the length of the column.
*/
INSERT INTO Users VALUES(2, 'griffin.gowdey@my.tccd.edu','Griffin William Gowdey', 'Junior');
