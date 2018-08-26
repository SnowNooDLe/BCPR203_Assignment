-- Make sure run this if you change PC
drop database if exists BCPR203 ;
-- Create database called BCPR203
create database BCPR203;

-- using database called BCPR203 for future reference
use bcpr203;


-- Normal table
create table Student(
studentID char(4) NOT NULL primary key,
firstName varchar(25),
lastName varchar(25)
)engine = InnoDB;

create table Course(
courseCode char(7) NOT NULL primary key,
numOfDays int,
numOfSessions int,
program ENUM('ACE', 'Level 3', 'Level 4')
)engine = InnoDB;

-- Session is already taken, for the safety purpuse, use Sessions
create table Sessions(
sessionID int NOT NULL AUTO_INCREMENT primary key,
sessionDate date,
sessionTime ENUM('Morning', 'Afternoon', 'Evening'),
branchName ENUM('City', 'Bishopdale', 'Hornby', 'New Brighton', 'Rangiora', 'Timaru', 'Oamaru')
)engine = InnoDB;



-- Bridge tables
create table Attendance(
studentID char(4),
sessionID int,
attendanceDate date,
primary key (studentID, sessionID),
foreign key (studentID) references Student (studentID),
foreign key (sessionID) references Sessions (sessionID)
)engine = InnoDB;


-- Update lastmoodle, completed, note, courseCode as we cannot change studentID everytime we need to update.
create table Enrolment(
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
