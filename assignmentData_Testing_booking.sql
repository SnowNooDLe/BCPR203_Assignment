-- Load another external file
-- not allowed in version 8.0
-- load data local infile 'C:\Users\sdw12_000\OneDrive - Ara Institute of Canterbury\BCPR203\Assignment\DummyData\ActualAttendanceBooking.csv'
-- INTO table Attendance
-- fields terminated by ','
-- lines terminated by '\n'
-- (attendanceID, attendanceDateTime, bookingDate, bookingTime,
-- studentID, sessionID);
-- so had to create some dummy datas

-- dummy data for Course
INSERT INTO Course VALUES ('CFCB110', 70, 20, 'ACE');
INSERT INTO Course VALUES ('CFCF106', 42, 12, 'Level 3');
INSERT INTO Course VALUES ('CFCS206', 35, 10, 'Level 3');

SELECT * FROM COURSE;

-- dummy data for Student
INSERT INTO Student VALUES ('0001', 'Tom', 'Son');
INSERT INTO Student VALUES ('0002', 'Danny', 'Moon');
INSERT INTO Student VALUES ('0003', 'Danny', 'Jung');
INSERT INTO Student VALUES ('0004', 'Zisoo', 'Kim');
INSERT INTO Student VALUES ('0005', 'Peter', 'Ko');
INSERT INTO Student VALUES ('0006', 'Yuney', 'Lee');
INSERT INTO Student VALUES ('0007', 'Yejin', 'Lee');

SELECT * FROM Student;

-- dummy data for Queries
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-08', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-09', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-10', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-11', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-02-12', 'Evening', 'Hornby');



-- dummy data for Attendance
-- Student Tom Son & attends 5 in a week
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0001', '1', '2018-02-08');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0001', '10', '2018-02-09');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0001', '12', '2018-02-09');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0001', '20', '2018-02-10');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0001', '28', '2018-02-11');

-- Student Danny Moon & attends 3 in a week
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0002', '1', '2018-02-08');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0002', '6', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0002', '19', '2018-02-10');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0002', '25', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0002', '41', '2018-02-12');

-- Student Danny Jung & attends 1 in a week
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0003', '1', '2018-02-08');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0003', '16', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0003', '25', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0003', '35', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0003', '45', NULL);


-- special dummy data for Query 2 to find out who are almost end of their c8-22e
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-01', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-17', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-18', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-19', 'Evening', 'Hornby');

INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Morning', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Afternoon', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Evening', 'City');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Morning', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Afternoon', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Evening', 'Bishopdale');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Morning', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Afternoon', 'Hornby');
INSERT INTO Sessions (sessionDate, sessionTime, branchName) VALUES ('2018-09-20', 'Evening', 'Hornby');


SELECT * FROM Sessions;
-- Testing timediff (curdate, 7) and curdate between
-- When you need to test this coude, just change last values (2018-08....)
-- to the date you mark my assignment - 7, then you will see the correct value
-- Student Zisoo Kim  & attend more than two in a week
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0004', '46', '2018-08-22');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0004', '56', '2018-08-23');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0004', '68', '2018-08-24');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0004', '73', '2018-09-03');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0004', '78', '2018-09-12');
-- Student Peter Ko & attend less than two in a week
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0005', '49', '2018-08-21');
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0005', '55', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0005', '61', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0005', '68', NULL);
INSERT INTO Attendance (studentID, sessionID, attendanceDate) VALUES ('0005', '72', NULL);

Select * FROM attendance;

-- dummy data for Enrolment
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0001', 'CFCB110', '2018-02-02', '2018-02-10', FALSE, 'Anything');
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0002', 'CFCB110', '2018-02-07', '2018-02-11', FALSE, 'Anything');
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0003', 'CFCF106', '2018-02-07', '2018-02-15', FALSE, 'Anything');
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0004', 'CFCF106', '2018-08-10', '2018-08-22', FALSE, 'Anything');
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0005', 'CFCS206', '2018-08-15', '2018-08-22', FALSE, 'Anything');
INSERT INTO enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) VALUES ('0006', 'CFCS206', '2018-02-04', '2018-02-11', FALSE, 'Anything');

SELECT * FROM enrolment;
