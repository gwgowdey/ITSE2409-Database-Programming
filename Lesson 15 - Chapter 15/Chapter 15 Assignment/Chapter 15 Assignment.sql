/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 15 - Chapter 15 Assignment.
*/

/*
Question 1:
Write a script that creates and calls a stored procedure named spInsertCategory. First, code a
statement that creates a procedure that adds a new row to the Categories table. To do that, this
procedure should have one parameter for the category name.

Code at least two EXEC statements that test this procedure. (Note that this table doesn’t allow
duplicate category names.)
*/
CREATE PROCEDURE spInsertCategory
@CategoryName VARCHAR(255)
AS
INSERT INTO Categories (CategoryName)
VALUES (@CategoryName);
GO
/* Test 1 - Fail. */
EXEC spInsertCategory 'Guitars';
GO
/* Test 2 - Success. */
EXEC spInsertCategory 'Saxophone';
GO

/*
Question 2:
Write a script that creates and calls a function named fnDiscountPrice that calculates the discount
price of an item in the OrderItems table (discount amount subtracted from item price). To do that, this
function should accept one parameter for the item ID, and it should return the value of the discount
price for that item.
*/
CREATE FUNCTION fnDiscountPrice
(@ItemID INT)
RETURNS MONEY

BEGIN
DECLARE @DiscountPrice MONEY;
SELECT @DiscountPrice = (ItemPrice - DiscountAmount)
FROM OrderItems
WHERE ItemID = @ItemID;

RETURN @DiscountPrice;
END;

GO
SELECT ItemID, ItemPrice, DiscountAmount, dbo.fnDiscountPrice(ItemID) AS DiscountPrice
FROM OrderItems;

/*
Question 3:
Write a script that creates and calls a function named fnItemTotal that calculates the total amount of
an item in the OrderItems table (discount price multiplied by quantity). To do that, this function
should accept one parameter for the item ID, it should use the DiscountPrice function that you created
in exercise 2, and it should return the value of the total for that item.
*/
CREATE FUNCTION fnItemTotal
(@ItemID INT)
RETURNS MONEY

BEGIN
DECLARE @ItemTotal MONEY;

SELECT @ItemTotal = dbo.fnDiscountPrice(ItemID) * Quantity
FROM OrderItems
WHERE @ItemID = @ItemID;

RETURN @ItemTotal
END;
GO

SELECT ItemID, ItemPrice, DiscountAmount,
dbo.fnDiscountPrice(ItemID) AS DiscountPrice, Quantity,
dbo.fnItemTotal(ItemID) AS ItemTotal
FROM OrderItems;