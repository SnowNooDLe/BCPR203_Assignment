drop database BCPR203;

create database BCPR203;

use bcpr203;

create table Course(
courseCode char(7) primary key,
numOfDays int,
numOfSessions int,
program ENUM('ACE', 'Level 3', 'Level 4')
)engine = InnoDB;

create table Branch(
branchName varchar(25) primary key
)engine = InnoDB;

create table Student(
studentID char(4) primary key,
firstName varchar(25),
lastName varchar(25)
)engine = InnoDB;

create table Staff(
staffNum char(4) primary key,
firstName varchar(25),
lastName varchar(25),
note text,
position varchar(30),
branchName varchar(25),
foreign key (branchName) references Branch (branchName)
)engine = InnoDB;

create table Sessions(
sessionID int NOT NULL AUTO_INCREMENT primary key,
sessionDate date,
sessionTime time,
courseCode char(7),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

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

create table StudentStaffBridge(
staffNum char(4),
studentID char(4),
primary key (staffNum, studentID),
foreign key (staffNum) references Staff (staffNum),
foreign key (studentID) references Student (studentID)
)engine = InnoDB;

create table SessionsBranchBridge(
branchName varchar(25),
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