-- Load another external file
-- not allowed in version 8.0
load data local infile 'C:\Users\sdw12_000\OneDrive - Ara Institute of Canterbury\BCPR203\Assignment\DummyData\ActualAttendanceBooking.csv'
into table AttendanceBooking
fields terminated by ','
lines terminated by '\n'
(attendanceID, attendanceDateTime, bookingDate, bookingTime,
  studentID, sessionID);
  
-- testing just for attendent one
-- checking students attendance in a certain period
SELECT
   Student.firstName, 
   attendance.attendanceCheck,
   enrolment.startDate
FROM Student
INNER JOIN attendance ON Student.studentID = attendance.studentID
INNER JOIN Enrolment ON attendance.studentID = Enrolment.studentID
WHERE (attendance.attendanceCheck = 'YES') AND (Student.studentID BETWEEN '0001' AND '9999') AND (enrolment.startDate between '2018-01-01' and '2018-04-09');

-- Query 1, Students that have not been engaged in the last week (or other time period)
-- DO NOT TOUCH
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(*) AS 'Total attendance between 2018-02-08 ~ 2018-02-15'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
WHERE (attendanceCheck = 'YES') 
	AND (Student.studentID BETWEEN '0001' AND '9999')
    -- by using sessionID to defines time frame
    AND (SessionID BETWEEN '1' AND '24')
GROUP BY firstName
having count(*) > 1 ;


-- Query 2, Students that are near the end of their course duration assumption, 75%
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(*) AS 'Total attendance between 2018-02-08 ~ 2018-02-15',
   ANY_VALUE(enrolmentKey),
   ANY_VALUE(course.numOfSessions) as 'noSessions'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
WHERE (attendanceCheck = 'YES') 
	AND (Student.studentID BETWEEN '0001' AND '9999')
    -- by using sessionID to defines time frame
    AND (SessionID BETWEEN '1' AND '24')
GROUP BY firstName
HAVING COUNT(attendanceCheck) >= (0.1 * noSessions);

-- Query 3, How many times have students attended their course

SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(*) AS 'Total attendance between 2018-02-08 ~ 2018-02-15',
   sessions.courseCode
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.SessionID = sessions.SessionID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
WHERE (attendanceCheck = 'YES') 
	AND (Student.studentID BETWEEN '0001' AND '9999')
    -- by using sessionID to defines time frame
    AND (attendance.SessionID BETWEEN '1' AND '24')
    AND (Sessions.courseCode = 'CFCB110')
GROUP BY firstName;

-- Query 4,

