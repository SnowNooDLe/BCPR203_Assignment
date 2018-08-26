-- Make sure run this if you change PC
drop database if exists BCPR203 ;

create database BCPR203;

use bcpr203;

create table Course(
courseCode char(7) primary key,
numOfDays int,
numOfSessions int,
program ENUM('ACE', 'Level 3', 'Level 4')
)engine = InnoDB;

create table Branch(
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru') primary key
)engine = InnoDB;

create table Student(
studentID char(4) primary key,
firstName varchar(25),
lastName varchar(25)
)engine = InnoDB;

-- Session is already taken, for the safety purpuse, use Sessions
create table Sessions(
sessionID int NOT NULL AUTO_INCREMENT primary key,
sessionDate date,
sessionTime ENUM('Morning', 'Afternoon', 'Evening')
)engine = InnoDB;

create table AttendanceBooking(
attendanceDate date,
bookingDate date,
bookingTime time,
studentID char(4),
sessionID int,
primary key (studentID, sessionID),
foreign key (studentID) references Student (studentID),
foreign key (sessionID) references Sessions (sessionID)
)engine = InnoDB;


-- Update lastmoodle, lastattendence instaed of putting new rows
create table enrolment(
startDate date,
lastActiveMoodle date,
completed boolean,
note text,
studentID char(4),
courseCode char(7),
primary key (studentID, courseCode),
foreign key (studentID) references Student (studentID),
foreign key (courseCode) references Course (courseCode)
)engine = InnoDB;

create table SessionsBranchBridge(
sessionID int,
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru'),
primary key (sessionID, branchName),
foreign key (sessionID) references Sessions (sessionID),
foreign key (branchName) references Branch (branchName)
)engine = InnoDB;
