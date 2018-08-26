-- Query 1, Students that have not been engaged in the last week (or other time period)
-- Depends on your taste, you can test with either BETWEEN with magic number of DATE_SUB
-- BUT if you want to make mine with DATE_SUB, make sure change dates from data.sql where i highlighted.
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   COUNT(attendanceDate) AS 'Total attendance in the last week'
   -- count(attendanceDate) AS 'Total attendance between 2018-02-08 and 2018-02-15'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Sessions ON attendance.sessionID = Sessions.sessionID
-- WHERE (attendanceDate BETWEEN DATE_SUB(curdate(), INTERVAL 7 DAY) AND curdate())
WHERE (attendanceDate BETWEEN '2018-02-08' AND '2018-02-15')
GROUP BY student.studentID
having count(attendanceDate) < 6
ORDER BY ANY_VALUE(COUNT(attendanceDate)) DESC;


-- Query 2, Students that are near the end of their course duration.
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name',
   ANY_VALUE(Enrolment.courseCode) as 'Course',
   ANY_VALUE(startDate) as startDate,
   ANY_VALUE(DATE_ADD(startDate, INTERVAL numOfDays DAY)) AS 'End Date',
   ANY_VALUE(MAX(attendanceDate)) AS 'Last Attend Date',
   ANY_VALUE((DATEDIFF(MAX(attendanceDate), startDate)) / numOfDays * 100) AS Percentage
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
WHERE (completed = 'FALSE')
GROUP BY student.studentID
HAVING Percentage < 75
ORDER BY Percentage DESC;



-- Query 3, How many times have students attended their course
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
   count(!ISNULL(attendanceDate)) AS 'Total attendance between their start date and today',
   ANY_VALUE(courseCode) AS 'Course Code',
   ANY_VALUE(startDate) AS 'Start Date',
   CURDATE() AS 'Today'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.SessionID = sessions.SessionID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
WHERE (!ISNULL(attendanceDate))
    -- by using sessionID to defines time frame
    AND (attendanceDate BETWEEN startDate AND CURDATE())
GROUP BY student.studentID ASC;


-- Query 4(A), Booking for a particular day at particular time.
SELECT
	ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
    ANY_VALUE(courseCode) AS 'Course',
    ANY_VALUE(sessionDate) AS 'Booked Date',
    ANY_VALUE(sessionTime) AS 'Booked Time',
    ANY_VALUE(branchName) AS 'Booked Branch'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.SessionID = sessions.SessionID
JOIN enrolment ON student.studentID = enrolment.studentID
-- choose specific date and time you want to check.
WHERE (sessionDate = '2018-02-09')
    AND (sessionTime = 'Morning')
ORDER BY student.studentID ASC;



-- Query 4(B), Booking for a particular session at a particular branch.
SELECT
	ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name', 
    ANY_VALUE(Enrolment.courseCode) AS 'Course',
    ANY_VALUE(sessionDate) AS 'Booked Date',
    ANY_VALUE(sessionTime) AS 'Booked Time',
    ANY_VALUE(branchName) AS 'Booked Branch'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.sessionID = sessions.sessionID
JOIN Enrolment ON student.studentID = Enrolment.studentID
-- choose branch you want to check
WHERE (branchName = 'City')
ORDER BY student.studentID ASC;


-- Query 5, Students that have not attended past the last withdrawal date
SELECT
   ANY_VALUE(CONCAT(firstName, ' ', lastName)) AS 'Full Name',
   ANY_VALUE(startDate) AS StartDate,
   ANY_VALUE(numOfDays) * 0.1 AS WithdrawalPoint,
   ANY_VALUE(DATE_ADD(startDate, Interval  numOfDays * 0.1 Day)) AS 'Last Withdrawal Date',
   MAX(attendanceDate) AS 'Last Attend Date'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
GROUP BY student.studentID
HAVING DATE_ADD(StartDate, INTERVAL WithdrawalPoint DAY) > MAX(attendanceDate) ;