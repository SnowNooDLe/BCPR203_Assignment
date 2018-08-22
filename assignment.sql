drop database BCPR203;

create database BCPR203;

use bcpr203;

create table Course(
courseCode char(7) primary key,
numOfDays int,
numOfSessions int,
program ENUM('ACE', 'Level 3', 'Level 4')
)engine = InnoDB;

-- testing code
insert into Course values ('CFCB110', 70, 20, 'ACE');
insert into Course values ('CFCF106', 42, 12, 'Level 3');
insert into Course values ('CFCS206', 35, 10, 'Level 3');
insert into Course values ('CFDB110', 56, 16, 'ACE');
insert into Course values ('CFDB306', 91, 26, 'Level 3');
insert into Course values ('CFDB310', 63, 18, 'ACE');

SELECT * FROM Course;



create table Branch(
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru') primary key
)engine = InnoDB;

-- testing for Branch.
insert into Branch values ('City');
insert into Branch values ('Bishopdale');
insert into Branch values ('Hornby');




create table Student(
studentID char(4) primary key,
firstName varchar(25),
lastName varchar(25)
)engine = InnoDB;

insert into Student Values ('0001', 'Tom', 'Son');
insert into Student Values ('0002', 'Thomas', 'Son');
insert into Student Values ('0003', 'Tim', 'Son');
insert into Student Values ('0004', 'Kim', 'Son');
insert into Student Values ('0005', 'Test', 'Test2');
insert into Student Values ('0006', 'Test1', 'Test3');

SELECT studentID FROM Student;



create table Staff(
staffNum char(4) primary key,
firstName varchar(25),
lastName varchar(25),
note text,
positions varchar(30),
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru'),
foreign key (branchName) references Branch (branchName)
)engine = InnoDB;

insert into Staff values('1234', 'Test1', 'Test2', 'This is just random', 'Manager', 'City');
insert into Staff values('2345', 'Test11', 'Test21', 'This is just random', 'Team Leader', 'City');
insert into Staff values('3456', 'Test12', 'Test22', 'This is just random', 'Team Leader', 'Bishopdale');
insert into Staff values('4312', 'Test13', 'Test23', 'This is just random', 'Admin', 'Bishopdale');
insert into Staff values('5432', 'Test14', 'Test24', 'This is just random', 'Manager', 'Hornby');
insert into Staff values('4325', 'Test15', 'Test25', 'This is just random', 'Admin', 'Hornby');



create table Sessions(
sessionID int NOT NULL AUTO_INCREMENT primary key,
sessionDate date,
sessionTime time,
courseCode char(7),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

-- testing code
insert into Sessions values (1, '2018-07-22', '9:03:03', 'CFCB110');
insert into Sessions values (2, '2018-07-22', '11:00', 'CFCB110');
insert into Sessions values (3, '2018-07-22', '13:00:03', 'CFCB110');
insert into Sessions values (4, '2018-07-22', '15:00:03', 'CFCB110');

SELECT * FROM Sessions;

-- query to get data from two tables by using foreign key
-- from this, course has only primary key, sessions has a foreign key
SELECT course.courseCode, course.numOfSessions, course.program, sessions.sessionDate, sessions.sessionTime
FROM course
INNER JOIN Sessions ON course.courseCode=Sessions.courseCode;



create table AttendanceBooking(
attendanceID int NOT NULL AUTO_INCREMENT primary key,
attendanceDateTime datetime,
bookingDate date,
bookingTime time,
studentID char(4),
sessionID int,
foreign key (sessionID) references Sessions (sessionID),
foreign key (studentID) references Student (studentID)
)engine = InnoDB;

DELETE FROM AttendanceBooking where sessionID = 1;

insert into AttendanceBooking values ('1', '2018-02-09 09:05:05', '2018-02-19', '1:00', '0001', 1);
update AttendanceBooking set attendanceDateTime = NULL where attendanceId = 1;
insert into AttendanceBooking values ('2', '2018-02-19 09:05:05', '2018-02-21', '1:00', '0001', 1);
insert into AttendanceBooking values ('3', '2018-02-21 09:05:05', '2018-02-25', '1:00', '0001', 1);
insert into AttendanceBooking values ('4', '2018-02-25 09:05:05', '2018-02-27', '1:00', '0001', 1);
insert into AttendanceBooking values ('5', '2018-03-10 09:05:05', '2018-03-12', '1:00', '0002', 1);
insert into AttendanceBooking values ('6', '2018-03-03 09:06:05', '2018-03-05', '1:00', '0003', 1);
update AttendanceBooking set attendanceDateTime = NULL where attendanceId = 6;
insert into AttendanceBooking values ('7', '2018-07-22 09:07:05', '2019-08-19', '1:00', '0004', 1);
insert into AttendanceBooking values ('9', null, '2019-08-19', '1:00', '0005', 1);
insert into AttendanceBooking values ('10', null, '2019-08-19', '1:00', '0005', 1);
insert into AttendanceBooking values ('11', null, '2019-08-19', '1:00', '0005', 1);
insert into AttendanceBooking values ('12', null, '2019-08-19', '1:00', '0003', 1);

SELECT * FROM AttendanceBooking;
-- testing
SELECT studentID from AttendanceBooking
where attendanceDateTime IS NULL;

-- another testing
SELECT studentID, COUNT(studentID) as NoOfSessions, SUM(ISNULL(attendanceDateTime)) As not_attended,
SUM(!ISNULL(attendanceDateTime)) As attended FROM AttendanceBooking
GROUP BY studentID;

-- final testing Query 1 !!!
SELECT studentID
From (
SELECT studentID,
 COUNT(studentID) as NoOfSessions, 
 SUM(ISNULL(attendanceDateTime)) As not_attended,
SUM(!ISNULL(attendanceDateTime)) As attended FROM AttendanceBooking
GROUP BY studentID
)X
WHERE COALESCE(not_attended,0) > 2;


-- Load another external file
-- not allowed in version 8.0
load data local infile 'C:\Users\sdw12_000\OneDrive - Ara Institute of Canterbury\BCPR203\Assignment\DummyData\ActualAttendanceBooking.csv'
into table AttendanceBooking
fields terminated by ','
lines terminated by '\n'
(attendanceID, attendanceDateTime, bookingDate, bookingTime,
  studentID, sessionID);
  
  

create table AttendanceStaffBridge(
attendanceID int,
staffNum char(4),
Primary key(attendanceID, staffNum),
foreign key (attendanceID) references AttendanceBooking (attendanceID),
foreign key (staffNum) references Staff (staffNum)
)engine = InnoDB;




create table enrolment(
enrolmentKey int NOT NULL AUTO_INCREMENT Primary Key,
startDate date,
studentID char(4),
courseCode char(7),
foreign key (studentID) references Student (studentID),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

insert into enrolment values (1, '2018-02-08', '0001', 'CFCB110');
insert into enrolment values (2, '2018-03-08', '0002', 'CFCB110');
insert into enrolment values (3, '2018-03-02', '0003', 'CFCF106');
insert into enrolment values (4, '2018-03-05', '0004', 'CFCS206');
insert into enrolment values (5, '2018-04-05', '0005', 'CFDB110');
insert into enrolment values (6, '2018-05-05', '0006', 'CFDB306');

SELECT course.courseCode, course.numOfSessions, course.program, sessions.sessionDate, sessions.sessionTime
FROM course
INNER JOIN Sessions ON course.courseCode=Sessions.courseCode;

SELECT studentID, firstName from Student;
SELECT attendanceDateTime from attendanceBooking;
SELECT startDate FROM Enrolment;


-- Finding each student's start date and attendance date. working one
SELECT 
   Student.studentID, 
   Student.firstName, 
   AttendanceBooking.attendanceDateTime, 
   enrolment.startDate
FROM Student
INNER JOIN attendanceBooking ON Student.studentID = attendanceBooking.studentID
INNER JOIN Enrolment ON attendanceBooking.studentID = Enrolment.studentID
WHERE Student.studentID BETWEEN '0001' AND '9999';

-- testing just for attendent one
-- checking students attendance in a certain period
SELECT 
   Student.studentID, 
   Student.firstName, 
   (!ISNULL(AttendanceBooking.attendanceDateTime)) as Attendance, 
   enrolment.startDate
FROM Student
INNER JOIN attendanceBooking ON Student.studentID = attendanceBooking.studentID
INNER JOIN Enrolment ON attendanceBooking.studentID = Enrolment.studentID
WHERE (Student.studentID BETWEEN '0001' AND '9999') AND (enrolment.startDate between '2018-02-08' and '2018-03-09');

-- testing for reduce duplication.
SELECT COUNT(*)
FROM(
SELECT 
   Student.studentID, 
   Student.firstName, 
   (!ISNULL(AttendanceBooking.attendanceDateTime)) as Attendance, 
   enrolment.startDate
FROM Student
INNER JOIN attendanceBooking ON Student.studentID = attendanceBooking.studentID
INNER JOIN Enrolment ON attendanceBooking.studentID = Enrolment.studentID
WHERE (Student.studentID BETWEEN '0001' AND '9999') AND (enrolment.startDate between '2018-02-08' and '2018-03-09')
) GROUP BY attendanceBooking.attendanceDateTime
HAVING COUNT(attendanceBooking.attendanceDateTime) > 1;


-- Do i really need this table ?
create table StudentStaffBridge(
staffNum char(4),
studentID char(4),
primary key (staffNum, studentID),
foreign key (staffNum) references Staff (staffNum),
foreign key (studentID) references Student (studentID)
)engine = InnoDB;

create table SessionsBranchBridge(
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru'),
sessionID int,
courseCode char(7),
primary key (branchName, sessionID, courseCode),
foreign key (branchName) references Branch (branchName),
foreign key (sessionID) references Sessions (sessionID),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

create table StaffCourseBridge(
staffNum char(4),
courseCode char(7),
primary key (staffNum, courseCode),
foreign key (staffNum) references Staff (staffNum),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

create table StaffEnrolmentBridge(
enrolmentKey int,
staffNum char(4),
primary key (enrolmentKey, staffNum),
foreign key (enrolmentKey) references enrolment (enrolmentKey),
foreign key (staffNum) references Staff (staffNum)
)engine = InnoDB;