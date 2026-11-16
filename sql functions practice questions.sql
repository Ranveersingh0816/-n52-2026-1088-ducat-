
DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(1, 'Rahul', 'Sharma', 'Python', 15000.00, '2025-01-10', '2025-06-10'),
(2, 'Priya', 'Singh', 'Java', 18000.00, '2025-02-15', '2025-07-15'),
(3, 'Amit', 'Kumar', 'Web Development', 20000.00, '2025-03-01', '2025-08-01'),
(4, 'Neha', 'Verma', 'Data Science', 25000.00, '2025-03-20', '2025-09-20'),
(5, 'Rohit', 'Meena', 'SQL', 12000.00, '2025-04-05', '2025-07-05'),
(6, 'Ankit', 'Jain', 'Python', 15000.00, '2025-05-10', NULL),
(7, 'Pooja', 'Sharma', 'JavaScript', 16000.00, '2025-06-15', NULL),
(8, 'Vikas', 'Gupta', 'React JS', 18000.00, '2025-07-01', NULL),
(9, 'Sneha', 'Patel', 'MySQL', 13000.00, '2025-08-10', '2025-11-10'),
(10, 'Karan', 'Singh', 'Django', 19000.00, '2025-09-05', NULL);

SELECT * FROM CourseEnrollments;

#Display each student’s full name in uppercase with a single space between the first and last names using CONCAT() and UPPER().
select concat(upper(firstname),' ',upper(lastname)) as full_name
from CourseEnrollments;

#Display each student’s full name with the first letter of FirstName in uppercase and the remaining letters unchanged, using CONCAT(), UPPER() and SUBSTRING().

select concat(upper(substring(firstname,1,1)),substring(firstname,2),' ',lastname) as fullname
from CourseEnrollments;

/*Create a student code consisting of the first three letters of CourseName in uppercase, a
hyphen, and StudentID using LEFT(), UPPER() and CONCAT().*/

select concat(upper(substring(CourseName,1,3)),'_',StudentID) as studentcode
from CourseEnrollments;

/*Display FirstName reversed and also display its original character count using REVERSE() and
CHAR_LENGTH().*/

select reverse(firstname) ,char_length(firstname)
from CourseEnrollments ;

#Display the position of the letter a in FirstName using LOCATE(), along with FirstName.

select locate('a', firstname) as locate
from CourseEnrollments;

/*Replace every letter a in FirstName with o, then convert the result to uppercase using
REPLACE() and UPPER().*/

select replace(firstname,'a','o')
from CourseEnrollments;

#Display FirstName padded on the left with zeroes to a total length of 12 characters using LPAD().
select lpad(firstname,12,0) 
from CourseEnrollments;

/*Display a course label made of the last two letters of CourseName, a hyphen, and the first two
letters of FirstName using RIGHT(), LEFT() and CONCAT().*/

select concat(left(CourseName,2),'_',right(firstname,2))
from courseEnrollments;

/*Display the first three letters of FirstName in uppercase followed by the last two letters of
LastName in lowercase using SUBSTRING(), RIGHT(), UPPER(), LOWER() and CONCAT().*/

select concat( upper(left(firstname,3) ),lower(right(lastname,2)) )as fname
from CourseEnrollments;

#NUMERIC FUNCTIONS 

/*Display Fee rounded to one decimal place and also Fee rounded to the nearest whole
number using ROUND().*/

select round(fee,1) 
from CourseEnrollments;

/*Display Fee rounded upward and downward to whole numbers in separate columns using
CEIL() and FLOOR().*/

select fee, ceil(fee) as upward ,floor(fee) as downward_fees
from CourseEnrollments;

#Display the remainder when Fee is divided by 500 using MOD(), alongside the original Fee.

select mod(fee,500) as remainder_fees
from courseEnrollments;

#Display the absolute difference between Fee and 10000 using ABS().
select abs(fee-10000) as value 
from CourseEnrollments;

#Display Fee multiplied by 1.18 and rounded to two decimal places using ROUND().
select round((fee*1.18),2)
from CourseEnrollments;

#Display Fee formatted with a thousands separator and exactly two decimal places using FORMAT().
select format(fee,2) 
from courseEnrollments;

#DATE FUNCTIONS

/*Display the enrollment year, enrollment month name and enrollment day name in separate
columns using YEAR(), MONTHNAME() and DAYNAME().*/
select year(EnrollmentDate),monthname(EnrollmentDate),dayname(EnrollmentDate)
from CourseEnrollments;

#Display EnrollmentDate in DD/MM/YYYY format and CompletionDate in Month ,DD, YYYY format using DATE_FORMAT().
select date_format(EnrollmentDate,'%d/%m/%y') ,date_format(completionDate,'%m/%d/%y')
FROM CourseEnrollments;

#Calculate the number of days between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
select timestampdiff(day,EnrollmentDate,CompletionDate) 
from CourseEnrollments;

#Display the date 1 month and 10 days after EnrollmentDate using nested DATE_ADD() calls.
select date_add(EnrollmentDate, interval 40 day)
from CourseEnrollments;

#Display the date exactly 7 days before CompletionDate using DATE_ADD() with a negative interval.
select date_add(CompletionDate, interval -7 day)
from CourseEnrollments;

#Display the number of complete months between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
select timestampdiff(month,EnrollmentDate,CompletionDate)
from CourseEnrollments;

#Display the enrollment date shifted forward by 1 year, 2 months and 5 days using nested DATE_ADD() calls.

select date_add(EnrollmentDate,interval 5 day),
date_add(EnrollmentDate,interval 2 month),
date_add(EnrollmentDate,interval 1 year)
from CourseEnrollments; 

#Display EnrollmentDate and CompletionDate with their weekday names using DAYNAME().
select dayname(EnrollmentDate),dayname(CompletionDate) 
from CourseEnrollments;

 #Display the number of days from EnrollmentDate until the current date using TIMESTAMPDIFF() and CURDATE().
select timestampdiff(day,EnrollmentDate,curdate())
from CourseEnrollments;

/*Display the original CompletionDate and its date after adding 15 days, formatted as
DD/MM/YYYY using DATE_ADD() and DATE_FORMAT().*/

select CompletionDate,date_format(date_add(completionDate,interval 15 day),'%d%m%y')
from CourseEnrollments;