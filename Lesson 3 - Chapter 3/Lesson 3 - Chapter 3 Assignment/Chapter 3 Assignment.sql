/* 
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 3 - Chapter 3 Assignment.
*/

/*
Question 1 - Part 1:
Write a SELECT statement that returns four columns from the Products table: ProductCode,
ProductName, ListPrice, and DiscountPercent. Then, run this statement to make sure it works
correctly.
*/
SELECT ProductCode, ProductName, ListPrice, DiscountPercent
FROM Products
/*
Question 1 - Part 2:
Add an ORDER BY clause to this statement that sorts the result set by list price in descending
sequence. Then, run this statement again to make sure it works correctly. This is a good way to
build and test a statement, one clause at a time.
*/
ORDER BY ListPrice DESC;

/* 
Question 2 - Part 1:
Write a SELECT statement that returns one column from the Customers table named FullName that
joins the LastName and FirstName columns.
Format this column with the last name, a comma, a space, and the first name like this:
Doe, John
*/
SELECT LastName + ', ' + FirstName as "FullName"
FROM Customers
/*
Question 2 - Part 2:
Return only the contacts whose last name begins with a letter from M to Z.
*/
WHERE LastName >= 'M' and LastName <= 'Z'
/*
Question 2 - Part 3:
Sort the result set by last name in ascending sequence.
*/
ORDER BY LastName ASC;

/*
Question 3 - Part 1:
Write a SELECT statement that returns these column names and data from the Products table:
ProductName			The ProductName column
ListPrice			The ListPrice column
DateAdded			The DateAdded column
*/
SELECT ProductName, ListPrice, DateAdded
FROM Products
/*
Question 3 - Part 2:
Return only the rows with a list price that's greater than 500 and less than 2000.
*/
WHERE ListPrice > 500 and ListPrice < 2000
/*
Question 3 - Part 3:
Sort the result set in descending sequence by the DataAdded column.
*/
ORDER by DateAdded DESC;

/*
Question 4 - Part 1:
Write a SELECT statement that returns these column names and data from the Products table:
ProductName			The ProductName column
ListPrice			The ListPrice column
DiscountPercent		The DiscountPercent column
DiscountAmount		A column that’s calculated from the previous two columns
DiscountPrice		A column that’s calculated from the previous three columns
*/
SELECT ProductName, ListPrice, DiscountPercent,
ListPrice * (DiscountPercent * .01) as DiscountAmount,
ListPrice - (ListPrice * DiscountPercent * .01) as DiscountPrice
FROM Products
/*
Question 4 - Part 2:
Sort the result set by discount price in descending sequence.
*/
ORDER BY DiscountPrice DESC;