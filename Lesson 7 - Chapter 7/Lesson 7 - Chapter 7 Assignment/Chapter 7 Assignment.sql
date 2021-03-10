/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 7 - Chapter 7 Assignment.
*/

/*
Question 1 - Part 1:
Write an INSERT statement that adds this row to the Categories table:
CategoryName: Brass
Code the INSERT statement so SQL Server automatically generates the value for the CategoryID
column.
*/
INSERT INTO Categories (CategoryName) VALUES ('BRASS');

/*
Question 2:
Write an UPDATE statement that modifies the row you just added to the Categories table. This
statement should change the CategoryName column to “Woodwinds”, and it should use the CategoryID
column to identify the row.
*/
UPDATE Products SET ProductName = 'Woodwinds' WHERE CategoryID = 4;

/*
Question 3:
Write a DELETE statement that deletes the row you added to the Categories table in exercise 1. This
statement should use the CategoryID column to identify the row.
*/
DELETE FROM Categories WHERE CategoryID = 4;

/*
Question 4:
Write an INSERT statement that adds this row to the Products table:

ProductID: The next automatically generated ID
CategoryID: 4
ProductCode: dgx_640
ProductName: Yamaha DGX 640 88-Key Digital Piano
Description: Long description to come.
ListPrice: 799.99
DiscountPercent: 0
DateAdded: Today’s date/time.

Use a column list for this statement.
*/
INSERT INTO Products (CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
VALUES (4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, SYSDATETIME());

/*
Question 5:
Write an UPDATE statement that modifies the product you added in exercise 4. This statement should
change the DiscountPercent column from 0% to 35%.
*/
UPDATE Products SET ProductName = 'Yamaha DGX 88-Key Digital Piano' WHERE ProductID = 8;
UPDATE Products SET DiscountPercent = 0.35 WHERE ProductID = 8;

/*
Question 6:
Write a DELETE statement that deletes the row in the Categories table that has an ID of 4. When you
execute this statement, it will produce an error since the category has related rows in the Products table.
To fix that, precede the DELETE statement with another DELETE statement that deletes all products in
this category.
*/
DELETE FROM Products WHERE ProductID = 4;
DELETE FROM Categories WHERE CategoryID = 4;

/*
Question 7:
Write an INSERT statement that adds this row to the Customers table:
EmailAddress: rick@raven.com
Password: (empty string)
FirstName: Rick
LastName: Raven
Use a column list for this statement.
*/
INSERT INTO Customers (EmailAddress, Password, FirstName, LastName)
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

/*
Question 8:
Write an UPDATE statement that modifies the Customers table. Change the password column to
“secret” for the customer with an email address of rick@raven.com.
*/
UPDATE Customers SET PASSWORD = 'secret' WHERE EmailAddress = 'rick@raven.com';

/*
Question 9:
Write an UPDATE statement that modifies the Customers table. Change the password column to “reset”
for every customer in the table.
*/
UPDATE Customers SET PASSWORD = 'reset';

/*
Question 10:
Open the script named CreateMyGuitarShop.sql that’s in the Exercise Starts directory. Then, run this
script. That should restore the data that’s in the database.
*/