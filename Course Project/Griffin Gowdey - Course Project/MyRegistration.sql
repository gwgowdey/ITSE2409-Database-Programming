/*
Student: Griffin Gowdey.
Instructor: James Gibbs.
Class Number: ITSE2409-86752.
Class Name: Database Programming.
Semester: Spring 2021.
Course Project.
*/

/*
Instructions: Design a database that stores information about a registration system. There are four tables in the
“Registration System” database.

- Create a Registration script named i.e. MyRegistration.sql
- Use what you have learned in the course.
- The database should include four (4) tables with data.
*/
USE master;
GO

IF  DB_ID('RegistrationSystem') IS NOT NULL
    DROP DATABASE RegistrationSystem;
GO

CREATE DATABASE RegistrationSystem;
GO

USE RegistrationSystem;
/* Part 1 */
/*
A.) The database includes 4 tables.
- Sections.
- Courses.
- Rooms.
- Faculty.
*/
/*
B.) Tables input information. See Assignment Instructions PDF.
*/
CREATE TABLE Sections 
(
  Section#        INT,
  ID              VARCHAR(9)     NOT NULL,
  ClassDay        VARCHAR(4)	 NULL,
  StartTime		  TIME	         NULL,
  EndTime		  TIME			 NULL,
  Room#           VARCHAR(9)	 NULL,	       
  Instructor      TEXT			 NULL,
  FacultyID		  VARCHAR(12)	 NULL,
  PRIMARY KEY (Section#),
  FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
  FOREIGN KEY (Room#) REFERENCES Rooms(Room#)
);

CREATE TABLE Courses 
(
  CourseID         VARCHAR(9),
  Description      TEXT          NOT NULL,
  Credit		   TINYINT	     NOT NULL,
  PRIMARY KEY (CourseID)
);

CREATE TABLE Faculty 
(
  FacultyID        VARCHAR(11),
  LName			   TEXT			 NOT NULL,
  FName            TEXT			 NOT NULL,
  Street           VARCHAR(30)   NOT NULL,
  City             VARCHAR(20)	 NOT NULL,
  State            TEXT		     NOT NULL,
  ZipCode          INT		     NOT NULL,
  Phone            VARCHAR(12)   NOT NULL,
  PRIMARY KEY (FacultyID)
);

CREATE TABLE Rooms 
(
  Room#            VARCHAR(9),
  Seats            TINYINT       NOT NULL,
  PRIMARY KEY (Room#)
);

INSERT INTO Sections (Section#,ID,ClassDay,StartTime,EndTime,Room#,Instructor,FacultyID)
VALUES (44320, 'ITCC-1401','T/TH','8:30AM','1:00PM','ESCT 2128','Uddin','111-11-1111'),
	   (44322, 'ITCC-1404','T/TH','1:00PM','5:30PM','ESCT 2100','Uddin','111-11-1111'),
	   (44324, 'ITSE-1450','','','','','',''),
	   (44287, 'COSC-1301','MWF','8:00AM','8:50AM','ESCT 2123','Chegwidden','222-22-2222'),
	   (44289, 'BCIS-1305','MWF','9:00AM','9:50AM','ESCT 2123','Desassure','333-33-3333'),
	   (44292, 'COSC-1436','DL','','','DL','Williams','444-44-4444'),
	   (44294, 'COSC-1437','DL','','','DL','Williams','444-44-4444'),
	   (44296, 'BCIS-1305','T/TH','8:30AM','10:55AM','ESCT 2125','Williams','444-44-4444');

INSERT INTO Courses (CourseID,Description,Credit)
VALUES ('ITCC-1410','CISCO I', 4),
	   ('ITCC-1404','CISCO II', 4),
	   ('ITSE-1450','Systems Analysis and Design', 4),
	   ('ITSW-1407','Introduction to Database', 4),
	   ('BCIS-1305','Business Computer Applications', 4),
	   ('COSC-1301','Introduction to Computing', 4),
	   ('COSC-1436','Fundamentals of Programming I', 4),
	   ('COSC-1437','Fundamentals of Programming II', 4);

INSERT INTO Faculty (FacultyID,LName,FName,Street,City,State,ZipCode,Phone)
VALUES ('111-11-1111','Uddin','MD','85 Halls Lane','Arlington','TX', 76018, '817-515-1111'),
	   ('222-22-2222','Chegwidden','James','2515 W. Abby Lane','Arlington','TX', 76018, '817-515-2222'),
	   ('333-33-3333','Deassure','Charles','658 Arbor Creek','Arlington','TX', 76018, '817-515-3333'),
	   ('444-44-4444','Williams','Gracie','15 Median Street','Arlington','TX', 76018, '817-515-4444');

INSERT INTO Rooms (Room#,Seats)
VALUES ('DL', 25),
	   ('ESCT 2100', 20),
	   ('ESCT 2123', 30),
	   ('ESCT 2125', 30),
	   ('ESCT 2128', 24);