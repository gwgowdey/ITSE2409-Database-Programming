/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 14 - Chapter 14 Assignment.
*/

/*
Question 1:
Write a script that declares a variable and sets it to the count of all products in the Products table. If
the count is greater than or equal to 7, the script should display a message that says, “The number of
products is greater than or equal to 7”. Otherwise, it should say, “The number of products is less than
7”.
*/
DECLARE @CountOfAllProductsPart1 INT;
SELECT @CountOfAllProductsPart1 = COUNT(*) 
FROM Products;

IF @CountOfAllProductsPart1 >= 7

BEGIN
PRINT N'The number of products is greater than or equal to 7';
END

ELSE

BEGIN
PRINT N'The number of products is less than 7';
END

/*
Question 2:
Write a script that uses two variables to store (1) the count of all of the products in the Products table
and (2) the average list price for those products. If the product count is greater than or equal to 7, the
script should print a message that displays the values of both variables. Otherwise, the script should
print a message that says, “The number of products is less than 7”
*/
SELECT AVG(Price) FROM Products;
DROP PROCEDURE IF EXISTS Test;                ;
CREATE PROCEDURE Test AS

BEGIN
DECLARE @CountOfAllProductsPart2 INT;                                   
DECLARE @AverageListPriceOfProducts DECIMAL(10,8);

SELECT COUNT(*) INTO @CountOfAllProductsPart2
FROM Products;

SELECT AVG(Price) into @AverageListPriceOfProducts
FROM Products;

IF @CountOfAllProductsPart2 >= 7 THEN
SELECT @CountOfAllProductsPart2, @AverageListPriceOfProducts AS DisplayColumnWithValues

ELSE
PRINT N'The number of products is less than 7';

END
/*
Question 3:
Write a script that calculates the common factors between 10 and 20. To find a common factor, you
can use the modulo operator (%) to check whether a number can be evenly divided into both
numbers. Then, this script should print lines that display the common factors like this:
Common factors of 10 and 20
1
2
5
*/
CREATE PROCEDURE Test AS

BEGIN
DECLARE @Count INT
DECLARE @FactorOf10 INT
DECLARE @FactorOf20 INT
DECLARE @Factors VARCHAR (100)

SET @FactorOf10 = 10;
SET @FactorOf20 = 20;
SET @Count = 1;
SET @Factors = 'Factors of 10 and 20: ' + char(13);

WHILE (@Count <= 10)

BEGIN
IF (@FactorOf10 %  @Count = 0 AND @FactorOf20 % @Count = 0)
SET @Factors = CONCAT (@Factors, @Count, ' ', char(13));
SET @Count = @Count + 1;
END

SELECT @Factors
END

/*
Question 4:
Write a script that attempts to insert a new category named “Guitars” into the Categories table. If the
insert is successful, the script should display this message:
SUCCESS: Record was inserted.

If the update is unsuccessful, the script should display a message something like this:
FAILURE: Record was not inserted.
Error 2627: Violation of UNIQUE KEY constraint
'UQ__Categori__8517B2E0A87CE853'. Cannot insert duplicate key in object
'dbo.Categories'. The duplicate key value is (Guitars).
*/
USE MyGuitarShop;

BEGIN TRY
INSERT INTO Categories(CategoryName)
VALUES('Guitars')
PRINT N'SUCCESS: Record was inserted'
END TRY

BEGIN CATCH
PRINT N'FAILURE: Record was not inserted.';
PRINT N'ERROR'+CONVERT(varchar,ERROR_NUMBER(),1)+': '+ERROR_MESSAGE()
END