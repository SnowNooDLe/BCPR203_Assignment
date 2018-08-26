-- Query 1, Students that have not been engaged in the last week (or other time period)
-- DO NOT TOUCH
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(attendanceDate) AS 'Total attendance in the last week'
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN Sessions ON attendancebooking.sessionID = Sessions.sessionID
WHERE (attendanceDate BETWEEN DATE_SUB(curdate(), INTERVAL 7 DAY) AND curdate())
GROUP BY firstName
having count(attendanceDate) > 2
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
GROUP BY firstName
HAVING numOfDays * 0.8 > differences;



-- Query 3, How many times have students attended their course
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(!ISNULL(attendanceDate)) AS 'Total attendance between their start date and today',
   ANY_VALUE(courseCode) AS 'Course Code',
   ANY_VALUE(startDate) AS 'Start Date'
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN sessions ON attendancebooking.SessionID = sessions.SessionID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
WHERE (!ISNULL(attendanceDate))
    -- by using sessionID to defines time frame
    AND (sessionDate BETWEEN startDate AND CURDATE())
    -- AND (courseCode = 'CFCB110')
GROUP BY firstName;

-- Query 4(A), Booking for a particular day at particular time.
SELECT
	ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
    ANY_VALUE(bookingDate),
    ANY_VALUE(bookingTime)
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN sessions ON attendancebooking.SessionID = sessions.SessionID
WHERE (!ISNULL(bookingDate))
	AND (bookingDate = '2018-02-09')
    AND (bookingTime between '8:30' AND '12:00')
ORDER BY student.studentID ASC;



-- Query 4(B), Booking for a particular session at a particular branch.
SELECT
	ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
    ANY_VALUE(courseCode) AS 'Course',
    ANY_VALUE(sessionsbranchbridge.branchName) AS Branch,
    ANY_VALUE(bookingDate) AS 'Booking Date',
    ANY_VALUE(bookingTime) AS 'Booking Time'
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN sessions ON attendancebooking.SessionID = sessions.SessionID
JOIN sessionsbranchbridge ON sessions.sessionID = sessionsbranchbridge.sessionID
JOIN Branch ON sessionsbranchbridge.branchName = Branch.branchName
WHERE (!ISNULL(bookingDate))
	AND (sessionsbranchbridge.sessionID = '1')
ORDER BY student.studentID ASC;


-- Query 5, Students that have not attended past the last withdrawal date
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   MAX(attendanceDate) AS 'Last Attend Date',
   ANY_VALUE(startDate) AS StartDate,
   ANY_VALUE(numOfDays) AS 'No of Days for Course ',
   ANY_VALUE(numOfDays) * 0.1 AS WithdrawlPoint
FROM Student
JOIN attendancebooking ON Student.studentID = attendancebooking.studentID
JOIN Enrolment ON student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
GROUP BY firstName
HAVING DATE_ADD(StartDate, INTERVAL WithdrawlPoint DAY) < MAX(attendanceDate) ;