-- dummy data for Course
insert into Course values ('CFCB110', 70, 20, 'ACE');
insert into Course values ('CFCF106', 42, 12, 'Level 3');
insert into Course values ('CFCS206', 35, 10, 'Level 3');

SELECT * FROM COURSE; 


-- dummy data for Branch
insert into Branch values ('City');
insert into Branch values ('Bishopdale');
insert into Branch values ('Hornby');

SELECT * FROM Branch;


-- dummy data for Student
insert into Student Values ('0001', 'Tom', 'Son');
insert into Student Values ('0002', 'Thomas', 'Son');
insert into Student Values ('0003', 'Tim', 'Son');
insert into Student Values ('0004', 'Kim', 'Son');
insert into Student Values ('0005', 'Test', 'Test2');
insert into Student Values ('0006', 'Test1', 'Test3');

SELECT * FROM Student;

-- dummy data for Sessions
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-08', 'Morning', 'CFCB110'), ('2018-02-08',	'Afternoon', 'CFCB110'),	('2018-02-08',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-09', 'Morning', 'CFCB110'), ('2018-02-09',	'Afternoon', 'CFCB110'),	('2018-02-09',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-10', 'Morning', 'CFCB110'), ('2018-02-10',	'Afternoon', 'CFCB110'),	('2018-02-10',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-11', 'Morning', 'CFCB110'), ('2018-02-11',	'Afternoon', 'CFCB110'),	('2018-02-11',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-12', 'Morning', 'CFCB110'), ('2018-02-12',	'Afternoon', 'CFCB110'),	('2018-02-12',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-13', 'Morning', 'CFCB110'), ('2018-02-13',	'Afternoon', 'CFCB110'),	('2018-02-13',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-14', 'Morning', 'CFCB110'), ('2018-02-14',	'Afternoon', 'CFCB110'),	('2018-02-14',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-15', 'Morning', 'CFCB110'), ('2018-02-15',	'Afternoon', 'CFCB110'),	('2018-02-15',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-16', 'Morning', 'CFCB110'), ('2018-02-16',	'Afternoon', 'CFCB110'),	('2018-02-16',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-17', 'Morning', 'CFCB110'), ('2018-02-17',	'Afternoon', 'CFCB110'),	('2018-02-17',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-18', 'Morning', 'CFCB110'), ('2018-02-18',	'Afternoon', 'CFCB110'),	('2018-02-18',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-19', 'Morning', 'CFCB110'), ('2018-02-19',	'Afternoon', 'CFCB110'),	('2018-02-19',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-20', 'Morning', 'CFCB110'), ('2018-02-20',	'Afternoon', 'CFCB110'),	('2018-02-20',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-21', 'Morning', 'CFCB110'), ('2018-02-21',	'Afternoon', 'CFCB110'),	('2018-02-21',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-22', 'Morning', 'CFCB110'), ('2018-02-22',	'Afternoon', 'CFCB110'),	('2018-02-22',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-23', 'Morning', 'CFCB110'), ('2018-02-23',	'Afternoon', 'CFCB110'),	('2018-02-23',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-24', 'Morning', 'CFCB110'), ('2018-02-24',	'Afternoon', 'CFCB110'),	('2018-02-24',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-25', 'Morning', 'CFCB110'), ('2018-02-25',	'Afternoon', 'CFCB110'),	('2018-02-25',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-26', 'Morning', 'CFCB110'), ('2018-02-26',	'Afternoon', 'CFCB110'),	('2018-02-26',	'Evening', 'CFCB110');
INSERT INTO sessions (sessionDate, sessionTime, courseCode)	VALUES	('2018-02-27', 'Morning', 'CFCB110'), ('2018-02-27',	'Afternoon', 'CFCB110'),	('2018-02-27',	'Evening', 'CFCB110');

SELECT * FROM sessions;


-- dummy data for Attendance
-- Student Tom Son & CFCB110 & attends 5 in a week
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0001', '1', '2018-02-08', '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0001', '4', '2018-02-09', '2018-02-10', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0001', '7', '2018-02-09', '2018-02-11', '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0001', '10', '2018-02-10', '2018-02-11', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0001', '13', '2018-02-11', '2018-02-12', '9:25');

-- Student Thomas Son & CFCB110 & attends 3 in a week
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0002', '1', '2018-02-08', '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0002', '4', NULL, '2018-02-10', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0002', '7', '2018-02-09', '2018-02-11', '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0002', '10', NULL, '2018-02-11', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0002', '13', '2018-02-11', '2018-02-12', '9:25');

-- Student Tim Son & CFCB110 & attends 2 in a week
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0003', '1', '2018-02-08', '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0003', '4', NULL, '2018-02-10', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0003', '7', NULL, '2018-02-11', '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0003', '10', NULL, '2018-02-11', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0003', '13', '2018-02-11', '2018-02-12', '9:25');

-- Student Kim Son & CFCB110 & attends 1 in a week
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0004', '1', '2018-02-08', '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0004', '4', NULL, '2018-02-10', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0004', '7', NULL, '2018-02-11', '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0004', '10', NULL, '2018-02-11', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0004', '13', NULL, '2018-02-12', '9:25');

-- Student Test test2 & CFCB110 & attends 0 in a week
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '1', NULL, '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '4', NULL, '2018-02-10', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '7', NULL, '2018-02-11', '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '10', NULL, '2018-02-11', '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '13', NULL, '2018-02-12', '9:25');

SELECT * FROM AttendanceBooking;


-- dummy data for Enrolment
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0001', 'CFCB110', '2018-02-02', '2018-02-10', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0002', 'CFCB110', '2018-02-07', '2018-02-11', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0003', 'CFCB110', '2018-02-07', '2018-03-02', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0004', 'CFCB110', '2018-02-01', '2018-03-03', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0005', 'CFCB110', '2018-02-02', '2018-03-22', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0006', 'CFCB110', '2018-02-04', '2018-03-20', FALSE, 'Anything' );

SELECT * FROM enrolment;
-- just update the specific field based on their student ID with coursecode as they only do one course at a time, and dont think its efficient to make another table.
-- UPDATE Enrolment SET lastActiveMoodle = '2018-03-21' WHERE studentID = '0006' AND courseCode = 'CFCS206';

-- SELECT * FROM enrolment;
