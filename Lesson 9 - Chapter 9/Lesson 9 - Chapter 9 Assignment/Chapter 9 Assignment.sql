/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 9 - Chapter 9 Assignment.
*/

/*
Question 1:
Write a SELECT statement that returns these columns from the Products table:
*/
/*
Question 1 - Part 1:
	The ListPrice column
	The DiscountPercent column 
*/
SELECT ListPrice, DiscountPercent,
/*
Question 1 - Part 2:
	A column named DiscountAmount that uses the previous two columns to calculate the discount
	amount and uses the ROUND function to round the result to 2 decimal places.
*/
ROUND ((ListPrice * (DiscountPercent/100)), 2) AS DiscountAmount 
FROM Products;

/*
Question 2:
Write a SELECT statement that returns these columns from the Orders table:
*/
/*
Question 2 - Part 1:
	The OrderDate column
*/
SELECT OrderDate,
/*
Question 2 - Part 2:
	A column that returns the four-digit year that’s stored in the OrderDate column
*/
YEAR (OrderDate) AS OrderYear,
/*
Question 2 - Part 3:
	A column that returns only the day of the month that’s stored in the OrderDate column. 
*/
DAY (OrderDate) AS DayOnly,
/*
Question 2 - Part 4:
	A column that returns the result from adding thirty days to the OrderDate column
*/
DATEADD (DAY, 30, OrderDate) AS DueDate
FROM Orders;

/*
Question 3:
Write a SELECT statement that returns these columns from the Orders table:
*/
/*
Question 3 - Part 1:
	The CardNumber column
*/
SELECT CardNumber,
/*
Question 3 - Part 2:
	The length of the CardNumber column
*/
LEN (CardNumber) AS LengthOfCardNumber,
/*
Question 3 - Part 3:
	The last four digits of the CardNumber column

	When you get that working right, add the column that follows to the result set. This is more difficult
	because the column requires the use of functions within functions.

		A column that displays the last four digits of the CardNumber column in this format: XXXXXXXX-XXXX-1234. 
		In other words, use Xs for the first 12 digits of the card number and actual numbers for the last four 
		digits of the number.
*/
RIGHT (CardNumber, 4) AS LastFourDigitsOfCardNumber,
'XXXX-XXXX-XXXX-' + RIGHT (CardNumber, 4) AS NewFormatOfCardNumberColumn
FROM Orders;