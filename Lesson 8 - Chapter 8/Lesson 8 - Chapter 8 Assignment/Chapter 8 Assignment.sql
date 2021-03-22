/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Lesson 8 - Chapter 8 Assignment.
*/

/*
Question 1 - Part 1:
Write a SELECT statement that returns these columns from the Products table:
	The ListPrice column
*/
SELECT ListPrice,
/*
Question 1 - Part 2:
	A column that uses the CAST function to return the ListPrice column with 1 digit to the
	right of the decimal point
*/
CAST (ListPrice AS DECIMAL (10,1)) AS CASTListPrice,
/*
Question 1 - Part 3:
	A column that uses the CONVERT function to return the ListPrice column as an integer
*/
CONVERT (INT, ListPrice) AS CONVERTListPrice,
/*
Question 1 - Part 4:
	A column that uses the CAST function to return the ListPrice column as an integer
*/
CAST (ListPrice AS INT) AS CASTListPriceAsInteger
FROM Products;

/*
Question 2 - Part 1:
Write a SELECT statement that returns these columns from the Products table:
	The DateAdded column
*/
SELECT DateAdded,
/*
Question 2 - Part 2:
	A column that uses the CAST function to return the DateAdded column with its date only
	(year, month, and day)
*/
CAST (DateAdded AS DATE) AS CASTDateAddedYearMonthAndDay,
/*
Question 2 - Part 3:
	A column that uses the CAST function to return the DateAdded column with its full time
	only (hour, minutes, seconds, and milliseconds)
*/
CAST (DateAdded AS TIME) AS CASTDateAddedFullTime,
/*
Question 2 - Part 4:
	A column that uses the CAST function to return the DateAdded column with just the month
	and day
*/
CAST (DateAdded AS varchar(6)) AS CASTDateAddedMonthAndDay
FROM Products;

/*
Question 3 - Part 1:
Write a SELECT statement that returns these columns from the Orders table:
	A column that uses the CONVERT function to return the OrderDate column in this format:
	MM/DD/YYYY. In other words, use 2-digit months and days and a 4-digit year, and
	separate each date component with slashes.
*/
SELECT CONVERT (varchar, OrderDate, 101) AS CONVERTOrderDateMMDDYYYY,
/*
Question 3 - Part 2:
	A column that uses the CONVERT function to return the OrderDate column with the date,
	and the hours and minutes on a 12-hour clock with an AM/PM indicator.
*/
CONVERT (varchar, OrderDate, 100) AS CONVERTOrderDatePlus12HourClock,
/*
Question 3 - Part 3:
	A column that uses the CONVERT function to return the OrderDate column with 2-digit
	hours, minutes, and seconds on a 24-hour clock. Use leading zeros for all date/time
	components.
*/
CONVERT (varchar, OrderDate, 114) AS CONVERTOrderDate2Digit24HourClock
FROM Orders;
