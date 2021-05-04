/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Course Project.
*/

/* Part 2. Scripts and Database Diagram */

/*
A.) Scripts to create for database validation.
*/
/*
1.) Write SELECT statements to return all column names and data in each table. Sort by the primary key value in
ascending order.
*/
SELECT *
FROM Sections, Courses, Faculty, Rooms
ORDER BY Section# ASC, CourseID, FacultyID ASC, Room#;

/*
2.) Write a SELECT statement that joins the Sections table to the Rooms table and returns these columns:
Section#, ID, Instructor
	- Sort the result set by ID and then by Instructor in ascending order.
*/
SELECT Section#, ID, Instructor
FROM Sections
INNER JOIN Rooms ON Sections.Room# = Rooms.Room#;

/*
3.) Write a SELECT statement that returns these columns
	- The count of the number of rooms in the Rooms table
	- The maximum number of Seats in the Rooms table
*/
SELECT Room#, Seats
COUNT(Room#) AS RoomCount
MAX(Seats) AS SeatMax
FROM Rooms;

/*
4.) Write a SELECT statement that returns the Section#(s) and ID for the instructor Uddin
*/
SELECT Section#, ID
FROM Sections
WHERE Instructor = 'Uddin';

/*
5.) Write an INSERT statement that adds this row to the Faculty table:

FacultyID:555-55-5555
LName: Smith
FName: John
Address:2100 Southeast Parkway
City: Arlington
State: TX
ZipCode: 76018
Phone: 817-515-5555
*/
INSERT INTO Faculty (FacultyID,LName,FName,Street,City,State,ZipCode,Phone)
VALUES ('555-55-5555','Smith','John','2100 Southeast Parkway','Arlington','TX', 76018, '817-515-5555');

/*
- Write an UPDATE statement that modifies the Section table for Section# 44324. This statement should
change the FacultyID column to 555-55-5555.
*/
UPDATE Sections
SET FacultyID = '555-55-5555'
WHERE Section# = 44324;

/*
- Write a DELETE statement that deletes the row you updated in the previous step to the Section table. This
statement should use the Section# column and FacultyID column to identify the row.
*/
DELETE FROM Sections 
WHERE FacultyID = '555-55-5555' AND Section# = '44324';