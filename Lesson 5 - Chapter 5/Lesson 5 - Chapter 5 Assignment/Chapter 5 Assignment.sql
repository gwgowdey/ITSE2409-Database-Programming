/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 5 - Chapter 5 Assignment.
*/

/*
Question 1 - Part 1:
Write a SELECT statement that returns these columns:
	The count of the number of orders in the Orders table
	The sum of the TaxAmount columns in the Orders table
*/
SELECT COUNT(OrderID) as OrderCount, SUM(TaxAmount) as TaxSum
FROM Orders;

/*
Question 2 - Part 1:
Write a SELECT statement that returns one row for each category that has products with these columns:
	The CategoryName column from the Categories table
	The count of the products in the Products table
	The list price of the most expensive product in the Products table
*/
SELECT CategoryName, COUNT(ProductID) as ProductCount, MAX(ListPrice) as TheMostExpensiveProduct
FROM Categories JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
/*
Question 2 - Part 2:
Sort the result set so the category with the most products appears first.
*/
ORDER BY COUNT(ProductID) DESC;

/*
Question 3 - Part 1:
Write a SELECT statement that returns one row for each customer that has orders with these columns:
	The EmailAddress column from the Customers table
	The sum of the item price in the OrderItems table multiplied by the quantiy in the OrderItems table
	The sum of the discount amount column in the OrderItems table multiplied by the quantiy in the OrderItems table
*/
Select EmailAddress, SUM(ItemPrice) * Quantity AS TotalSum, SUM(DiscountAmount) * Quantity AS TotalDiscount
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY EmailAddress, ItemPrice, Quantity
/*
Question 3 - Part 2:
Sort the result set in descending sequence by the item price total for each customer.
*/
ORDER BY TotalSum DESC;

/*
Question 4 - Part 1:
Write a SELECT statement that returns one row for each customer that has orders with these columns:
	The EmailAddress column from the Customers table
	A count of the number of orders
	The total amount for each order (Hint: First, subtract the discount amount from the price.
	Then, multiply by the quantity.)
*/
SELECT EmailAddress, COUNT(Orders.OrderID) as OrderCount, (SUM(ItemPrice) - SUM(DiscountAmount)) * SUM(Quantity) as TotalAmount
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
/*
Question 4 - Part 2:
Return only those rows where the customer has more than than 1 order.
*/
GROUP BY EmailAddress HAVING COUNT(Orders.OrderID) > 1

/*
Question 4 - Part 3:
Sort the result set in descending sequence by the sum of the line item amounts.
*/
ORDER BY SUM(ItemPrice) DESC;

/*
Question 5 - Part 1:
Modify the solution to exercise 4 so it only counts and totals line items that have an ItemPrice value
that’s greater than 400.
*/
SELECT EmailAddress, COUNT(Orders.OrderID) as OrderCount, (SUM(ItemPrice) - SUM(DiscountAmount)) * SUM(Quantity) as TotalAmount
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
WHERE ItemPrice > 400
GROUP BY EmailAddress HAVING COUNT(Orders.OrderID) > 1
ORDER BY SUM(ItemPrice) DESC;