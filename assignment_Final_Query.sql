-- Query 1, Students that have not been engaged in the last week (or other time period)
-- Depends on your taste, you can test with either BETWEEN with magic number of DATE_SUB
-- BUT if you want to make mine with DATE_SUB, make sure change dates from data.sql where i highlighted.
SELECT
   CONCAT(firstName, ' ', lastName) AS 'Full Name',
   -- COUNT(attendanceDate) AS 'Total attendance in the last week'
   COUNT(attendanceDate) AS 'Total attendance between 2018-02-08 and 2018-02-15'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Sessions ON attendance.sessionID = Sessions.sessionID
-- WHERE (attendanceDate BETWEEN DATE_SUB(curdate(), INTERVAL 7 DAY) AND curdate())
WHERE (attendanceDate BETWEEN '2018-02-08' AND '2018-02-15')
GROUP BY (student.studentID)
-- where to count number of total attendance, business rule is minimum 2 per week, so anyone
-- who has only attended 0 or 1 will count as not engaged.
HAVING COUNT(attendanceDate) < 2
ORDER BY COUNT(attendanceDate) DESC;


-- Query 2, Students that are near the end of their course duration.
SELECT
   CONCAT(firstName, ' ', lastName) AS 'Full Name',
   ANY_VALUE(Enrolment.courseCode) AS 'Course',
   ANY_VALUE(startDate) AS startDate,
   ANY_VALUE(DATE_ADD(startDate, INTERVAL numOfDays DAY)) AS 'End Date',
   MAX(attendanceDate) AS 'Last Attend Date',
   ANY_VALUE((DATEDIFF(MAX(attendanceDate), startDate)) / numOfDays * 100) AS Percentage
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
-- only for those who hasnt finished yet.
WHERE (completed = 'FALSE')
GROUP BY (student.studentID)
-- as I wrote on report, assumption, i set a line with 75%
HAVING (Percentage >= 75)
ORDER BY (Percentage) DESC;



-- Query 3, How many times have students attended their course
SELECT
   CONCAT(firstName, ' ', lastName) AS 'Full Name',
   count(!ISNULL(attendanceDate)) AS 'Total attendance between their start date and today',
   ANY_VALUE(courseCode) AS 'Course Code',
   ANY_VALUE(startDate) AS 'Start Date',
   MAX(attendanceDate) AS 'Last Attend Date',
   CURDATE() AS 'Today'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.SessionID = sessions.SessionID
JOIN Enrolment ON Student.studentID = Enrolment.studentID
-- hence we need to find times have students atteneded,
-- we only count number of attended
WHERE (!ISNULL(attendanceDate))
    AND (attendanceDate BETWEEN startDate AND CURDATE())
GROUP BY (student.studentID) ASC;


-- Query 4(A), Booking for a particular day at particular time.
SELECT
	CONCAT(firstName, ' ', lastName) AS 'Full Name',
    courseCode AS Course,
    sessionDate AS 'Booked Date',
    sessionTime AS 'Booked Time',
    branchName AS 'Booked Branch'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.SessionID = sessions.SessionID
JOIN enrolment ON student.studentID = enrolment.studentID
-- choose specific date and time you want to check.
WHERE (sessionDate = '2018-02-10')
    AND (sessionTime = 'Morning')
-- unlike 4(B) we specify date and time, so i ordered by student ID
ORDER BY (student.studentID) ASC;



-- Query 4(B), Booking for a particular session at a particular branch.
SELECT
	CONCAT(firstName, ' ', lastName) AS 'Full Name',
    Enrolment.courseCode AS 'Course',
    sessionDate AS 'Booked Date',
    sessionTime AS 'Booked Time',
    branchName AS 'Booked Branch'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN sessions ON attendance.sessionID = sessions.sessionID
JOIN Enrolment ON student.studentID = Enrolment.studentID
-- choose branch you want to check
WHERE (branchName = 'City')
	-- I added this line to specify certain time period as with my dummy data
    -- doesnt look good to show booked sessions on Feb and Sept at the same time
	AND (sessionDate BETWEEN '2018-02-08' AND '2018-02-15')
-- order by sessionDate ASC as it makes more sense to see list by date.
ORDER BY sessionDate ASC;


-- Query 5, Students that have not attended past the last withdrawal date
SELECT
   CONCAT(firstName, ' ', lastName) AS 'Full Name',
   ANY_VALUE(startDate) AS StartDate,
   ANY_VALUE(numOfDays) * 0.1 AS WithdrawalPoint,
   ANY_VALUE(DATE_ADD(startDate, Interval  numOfDays * 0.1 Day)) AS 'Last Withdrawal Date',
   MAX(attendanceDate) AS 'Last Attend Date'
FROM Student
JOIN attendance ON Student.studentID = attendance.studentID
JOIN Enrolment ON student.studentID = Enrolment.studentID
JOIN Course ON Enrolment.courseCode = Course.courseCode
GROUP BY (student.studentID)
-- if last attend date is smaller than last withdrawal point, print them.
HAVING DATE_ADD(StartDate, INTERVAL WithdrawalPoint DAY) > MAX(attendanceDate) ;
