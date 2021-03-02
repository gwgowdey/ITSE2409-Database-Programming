/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 4 - Chapter 4 Assignment.
*/

/*
Question 1 - Part 1:
Write a SELECT statement that joins the Categories table to the Products table and returns these
columns: CategoryName, ProductName, ListPrice.
*/
SELECT CategoryName, ProductName, ListPrice
FROM Products JOIN Categories
ON Categories.CategoryID = Products.CategoryID
/*
Question 1 - Part 2:
Sort the result set by CategoryName and then by ProductName in ascending order.
*/
ORDER BY CategoryName, ProductName ASC;

/*
Question 2 - Part 1:
Write a SELECT statement that joins the Customers table to the Addresses table and returns these
columns: FirstName, LastName, Line1, City, State, ZipCode.
*/
SELECT FirstName, LastName, Line1, City, [State], ZipCode
FROM Customers JOIN Addresses
ON Customers.CustomerID = Addresses.CustomerID
/*
Question 2 - Part 2:
Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.
*/
WHERE Customers.EmailAddress = 'allan.sherwood@yahoo.com';

/*
Question 3 - Part 1:
Write a SELECT statement that joins the Customers table to the Addresses table and returns these
columns: FirstName, LastName, Line1, City, State, ZipCode.
*/
SELECT FirstName, LastName, Line1, City, [State], ZipCode
FROM Customers JOIN Addresses
ON Customers.CustomerID = Addresses.CustomerID
/*
Question 3 - Part 2:
Return one row for each customer, but only return addresses that are the shipping address for a customer.
*/
AND Customers.ShippingAddressID = Addresses.AddressID;

/*
Question 4 - Part 1:
Write a SELECT statement that joins the Customers, Orders, OrderItems, and Products tables. This
statement should return these columns: LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity.

Use aliases for the tables. CUS = Customers, ORD = Order, ORDItems = OrderItems, and PRO = Products.
*/
SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
FROM Customers AS CUS 
JOIN Orders AS ORD 
ON CUS.CustomerID = ORD.CustomerID
JOIN OrderItems AS ORDItems 
ON ORD.OrderID = ORDItems.OrderID
JOIN Products AS PRO
ON ORDItems.ProductID = PRO.ProductID
/*
Question 4 - Part 2:
Sort the final result set by LastName, OrderDate, and ProductName.
*/
ORDER BY LastName, OrderDate, ProductName;

/*
Question 5 - Part 1:
Write a SELECT statement that returns the ProductName and ListPrice columns from the Products table.
Return one row for each product that has the same list price as another product. (Hint: Use a self-join to
check that the ProductID columns aren’t equal but the ListPrice column is equal.)
*/
SELECT PRO1.ProductName, PRO2.ListPrice 
FROM Products AS PRO1
JOIN Products AS PRO2
ON PRO1.ListPrice = PRO2.ListPrice
WHERE PRO1.ProductID <> PRO2.ProductID
/*
Question 5 - Part 2:
Sort the result set by ProductName.
*/
ORDER BY PRO1.ProductName;