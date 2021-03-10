/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 6 - Chapter 6 Assignment.
*/

/*
Question 1:
Write a SELECT statement that returns the same result set as this SELECT statement, but don’t use a
join. Instead, use a subquery in a WHERE clause that uses the IN keyword.

	SELECT DISTINCT CategoryName
	FROM Categories c JOIN Products p
		ON c.CategoryID = p.CategoryID
	ORDER BY CategoryName
*/
SELECT DISTINCT CategoryName
FROM Categories 
WHERE CategoryID IN (SELECT CategoryID FROM Products)
ORDER BY CategoryName;

/*
Question 2 - Part 1:
Write a SELECT statement that answers this question: Which products have a list price that’s greater
than the average list price for all products? Return the ProductName and ListPrice columns for each product.
*/
SELECT ProductName, ListPrice
FROM Products
WHERE ListPrice > (SELECT AVG (ListPrice) FROM Products)
/*
Question 2 - Part 3:
Sort the results by the ListPrice column in descending sequence.
*/
ORDER BY ListPrice DESC;

/*
Question 3 - Part 1:
Write a SELECT statement that returns the CategoryName column from the Categories table.
*/
SELECT Categories.CategoryName
FROM Categories
/*
Question 3 - Part 2:
Return one row for each category that has never been assigned to any product in the Products table. To
do that, use a subquery introduced with the NOT EXISTS operator.
*/
WHERE NOT EXISTS (SELECT 1 FROM Products 
WHERE Products.CategoryID = Categories.CategoryID);

/*
Question 4 - Part 1:
Write a SELECT statement that returns three columns: EmailAddress, OrderID, and the order total for
each customer. To do this, you can group the result set by the EmailAddress and OrderID columns. In
addition, you must calculate the order total from the columns in the OrderItems table.
*/
SELECT Customers.EmailAddress, OrderItems.OrderID, SUM ((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal 
FROM OrderItems JOIN Orders ON OrderItems.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY EmailAddress, OrderItems.OrderID;
/*
Question 4 - Part 2:
Write a second SELECT statement that uses the first SELECT statement in its FROM clause. The main
query should return two columns: the customer’s email address and the largest order for that customer.
To do this, you can group the result set by the EmailAddress column.
*/
SELECT EmailOrders.EmailAddress, MAX(EmailOrders.OrderTotal) AS CustomerLargestOrder
FROM (SELECT Customers.EmailAddress, OrderItems.OrderID, 
SUM ((OrderItems.ItemPrice - OrderItems.DiscountAmount) * OrderItems.Quantity) as OrderTotal
FROM OrderItems join Orders ON OrderItems.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.EmailAddress, OrderItems.OrderID) as EmailOrders
GROUP BY EmailOrders.EmailAddress;