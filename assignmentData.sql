-- Load another external file
-- not allowed in version 8.0
-- load data local infile 'C:\Users\sdw12_000\OneDrive - Ara Institute of Canterbury\BCPR203\Assignment\DummyData\ActualAttendanceBooking.csv'
-- into table AttendanceBooking
-- fields terminated by ','
-- lines terminated by '\n'
-- (attendanceID, attendanceDateTime, bookingDate, bookingTime,
-- studentID, sessionID);
  
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
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-08', 'Morning'), ('2018-02-08',	'Afternoon'),	('2018-02-08',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-09', 'Morning'), ('2018-02-09',	'Afternoon'),	('2018-02-09',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-10', 'Morning'), ('2018-02-10',	'Afternoon'),	('2018-02-10',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-11', 'Morning'), ('2018-02-11',	'Afternoon'),	('2018-02-11',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-12', 'Morning'), ('2018-02-12',	'Afternoon'),	('2018-02-12',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-13', 'Morning'), ('2018-02-13',	'Afternoon'),	('2018-02-13',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-14', 'Morning'), ('2018-02-14',	'Afternoon'),	('2018-02-14',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-15', 'Morning'), ('2018-02-15',	'Afternoon'),	('2018-02-15',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-16', 'Morning'), ('2018-02-16',	'Afternoon'),	('2018-02-16',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-17', 'Morning'), ('2018-02-17',	'Afternoon'),	('2018-02-17',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-18', 'Morning'), ('2018-02-18',	'Afternoon'),	('2018-02-18',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-19', 'Morning'), ('2018-02-19',	'Afternoon'),	('2018-02-19',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-20', 'Morning'), ('2018-02-20',	'Afternoon'),	('2018-02-20',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-21', 'Morning'), ('2018-02-21',	'Afternoon'),	('2018-02-21',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-22', 'Morning'), ('2018-02-22',	'Afternoon'),	('2018-02-22',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-23', 'Morning'), ('2018-02-23',	'Afternoon'),	('2018-02-23',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-24', 'Morning'), ('2018-02-24',	'Afternoon'),	('2018-02-24',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-25', 'Morning'), ('2018-02-25',	'Afternoon'),	('2018-02-25',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-26', 'Morning'), ('2018-02-26',	'Afternoon'),	('2018-02-26',	'Evening');
INSERT INTO sessions (sessionDate, sessionTime)	VALUES	('2018-02-27', 'Morning'), ('2018-02-27',	'Afternoon'),	('2018-02-27',	'Evening');

SELECT * FROM sessions;

-- dummy data for SessionBranchBridge
insert into sessionsbranchbridge value ('1', 'City');
insert into sessionsbranchbridge value ('1', 'Bishopdale');
insert into sessionsbranchbridge value ('1', 'Hornby');

insert into sessionsbranchbridge value ('4', 'City');
insert into sessionsbranchbridge value ('4', 'Bishopdale');
insert into sessionsbranchbridge value ('4', 'Hornby');

insert into sessionsbranchbridge value ('7', 'City');
insert into sessionsbranchbridge value ('7', 'Bishopdale');
insert into sessionsbranchbridge value ('7', 'Hornby');

insert into sessionsbranchbridge value ('10', 'City');
insert into sessionsbranchbridge value ('10', 'Bishopdale');
insert into sessionsbranchbridge value ('10', 'Hornby');

insert into sessionsbranchbridge value ('13', 'City');
insert into sessionsbranchbridge value ('13', 'Bishopdale');
insert into sessionsbranchbridge value ('13', 'Hornby');



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


-- Testing timediff (curdate, 7) and curdate between
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '1', '2018-08-22', '2018-02-09', '9:00');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '4', '2018-08-23',NULL,  '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '7', '2018-08-24',NULL,  '9:40');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '10', '2018-08-25',NULL,  '9:30');
insert into AttendanceBooking (studentID, sessionID, attendanceDate, bookingDate, bookingTime) values ('0005', '13', '2018-08-26',NULL,  '9:25');


SELECT * FROM AttendanceBooking;


-- dummy data for Enrolment
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0001', 'CFCB110', '2018-02-02', '2018-02-10', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0002', 'CFCB110', '2018-02-07', '2018-02-11', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0003', 'CFCB110', '2018-02-07', '2018-03-02', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0004', 'CFCB110', '2018-02-01', '2018-03-03', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0005', 'CFCB110', '2018-02-02', '2018-03-22', FALSE, 'Anything' );
insert into enrolment (studentID, courseCode, startDate, lastActiveMoodle, completed, note) values ('0006', 'CFCB110', '2018-02-04', '2018-03-20', FALSE, 'Anything' );

SELECT * FROM enrolment;
