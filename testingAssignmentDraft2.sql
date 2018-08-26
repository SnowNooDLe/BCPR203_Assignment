-- Load another external file
-- not allowed in version 8.0
load data local infile 'C:\Users\sdw12_000\OneDrive - Ara Institute of Canterbury\BCPR203\Assignment\DummyData\ActualAttendanceBooking.csv'
into table AttendanceBooking
fields terminated by ','
lines terminated by '\n'
(attendanceID, attendanceDateTime, bookingDate, bookingTime,
  studentID, sessionID);
  
-- Query 1, Students that have not been engaged in the last week (or other time period)
-- DO NOT TOUCH
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(attendanceDate) AS 'Total attendance between 2018-02-08 ~ 2018-02-15'
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN Sessions ON attendancebooking.sessionID = Sessions.sessionID
WHERE (!ISNULL(attendanceDate)) 
	AND (Student.studentID BETWEEN '0001' AND '9999')
    AND (sessionDate BETWEEN '2018-02-08' AND '2018-02-15')
GROUP BY firstName
having count(attendanceDate) > 1
ORDER BY ANY_VALUE(student.studentID);


-- Query 2, Students that are near the end of their course duration.
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   ANY_VALUE(MAX(attendanceDate) - startDate) as differences,
   ANY_VALUE(numOfDays) as numOfDays,
   ANY_VALUE(startDate) as startDate
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
WHERE (Student.studentID BETWEEN '0001' AND '9999')
GROUP BY firstName
HAVING numOfDays * 0.8 < differences;

-- Query 3, How many times have students attended their course

SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(*) AS 'Total attendance between their start date and today',
   sessions.courseCode
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN sessions ON attendancebooking.SessionID = sessions.SessionID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
WHERE (!ISNULL(attendanceDate)) 
	AND (Student.studentID BETWEEN '0001' AND '9999')
    -- by using sessionID to defines time frame
    AND (sessionDate BETWEEN startDate AND CURDATE())
    AND (Sessions.courseCode = 'CFCB110')
GROUP BY firstName;

-- Query 4, Bookings for a day/time/session

-- Query 5, Students that have not attended past the last withdrawal date
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   MAX(attendanceDate),
   ANY_VALUE(course.numOfSessions) as 'noSessions'
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN Enrolment ON student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
JOIN Sessions ON attendancebooking.sessionID = Sessions.sessionID
WHERE (!ISNULL(attendancebooking.attendanceDate)) 
	AND (Student.studentID BETWEEN '0001' AND '9999')
	AND (sessionDate between '2018-02-08' AND '2018-02-15')
GROUP BY firstName;

