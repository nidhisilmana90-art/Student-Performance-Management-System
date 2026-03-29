DROP DATABASE student_db;
CREATE DATABASE student_db;
USE student_db;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration VARCHAR(20)
);

CREATE TABLE Marks (
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Attendance (
    student_id INT,
    attendance_percentage INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Marks;
TRUNCATE TABLE Attendance;
TRUNCATE TABLE Students;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Students VALUES
(1,'Nidhi',21,'BCA','Dehradun'),
(2,'Rahul',22,'BCA','Delhi'),
(3,'Aman',20,'BBA','Mumbai'),
(4,'Priya',21,'BCA','Noida'),
(5,'Karan',23,'BBA','Pune'),
(6,'Simran',22,'BCA','Chandigarh'),
(7,'Rohit',21,'BBA','Delhi'),
(8,'Anjali',20,'BCA','Jaipur'),
(9,'Vikas',24,'BBA','Lucknow'),
(10,'Neha',21,'BCA','Dehradun'),
(11,'Arjun',22,'BBA','Delhi'),
(12,'Pooja',23,'BCA','Noida'),
(13,'Sahil',21,'BBA','Mumbai'),
(14,'Kriti',20,'BCA','Pune'),
(15,'Manish',24,'BBA','Delhi'),
(16,'Sneha',22,'BCA','Jaipur'),
(17,'Deepak',23,'BBA','Lucknow'),
(18,'Riya',21,'BCA','Chandigarh'),
(19,'Varun',22,'BBA','Delhi'),
(20,'Meena',20,'BCA','Dehradun'),
(21,'Ajay',23,'BBA','Mumbai'),
(22,'Kajal',22,'BCA','Noida'),
(23,'Nitin',24,'BBA','Pune'),
(24,'Tina',21,'BCA','Delhi'),
(25,'Yash',22,'BBA','Lucknow'),
(26,'Komal',20,'BCA','Jaipur'),
(27,'Rakesh',23,'BBA','Delhi'),
(28,'Sonia',21,'BCA','Chandigarh'),
(29,'Mohit',22,'BBA','Mumbai'),
(30,'Payal',20,'BCA','Dehradun'),
(31,'Tarun',23,'BBA','Delhi'),
(32,'Isha',21,'BCA','Noida'),
(33,'Gaurav',22,'BBA','Pune'),
(34,'Shreya',20,'BCA','Jaipur'),
(35,'Harsh',24,'BBA','Lucknow'),
(36,'Divya',21,'BCA','Chandigarh'),
(37,'Kunal',23,'BBA','Delhi'),
(38,'Ritu',22,'BCA','Dehradun'),
(39,'Abhishek',21,'BBA','Mumbai'),
(40,'Naina',20,'BCA','Noida'),
(41,'Lokesh',23,'BBA','Pune'),
(42,'Preeti',21,'BCA','Jaipur'),
(43,'Suresh',24,'BBA','Delhi'),
(44,'Pallavi',22,'BCA','Chandigarh'),
(45,'Ankit',23,'BBA','Lucknow'),
(46,'Monika',21,'BCA','Dehradun'),
(47,'Raj',22,'BBA','Delhi'),
(48,'Seema',20,'BCA','Noida'),
(49,'Vivek',23,'BBA','Mumbai'),
(50,'Rashmi',21,'BCA','Pune');

INSERT INTO Courses VALUES
(101,'BCA','3 Years'),
(102,'BBA','3 Years'),
(103,'MCA','2 Years'),
(104,'MBA','2 Years'),
(105,'BTech','4 Years'),
(106,'MTech','2 Years'),
(107,'BCom','3 Years'),
(108,'MCom','2 Years'),
(109,'BA','3 Years'),
(110,'MA','2 Years');


SELECT * FROM Courses;

INSERT INTO Marks VALUES
(1,101,88),(2,102,76),(3,103,69),(4,104,91),(5,105,72),
(6,106,85),(7,107,66),(8,108,95),(9,109,70),(10,110,82),
(11,101,74),(12,102,89),(13,103,67),(14,104,93),(15,105,71),
(16,106,84),(17,107,68),(18,108,90),(19,109,73),(20,110,86),
(21,101,65),(22,102,92),(23,103,69),(24,104,87),(25,105,75),
(26,106,94),(27,107,72),(28,108,88),(29,109,66),(30,110,91),
(31,101,74),(32,102,89),(33,103,70),(34,104,93),(35,105,71),
(36,106,85),(37,107,67),(38,108,90),(39,109,69),(40,110,86),
(41,101,75),(42,102,92),(43,103,68),(44,104,87),(45,105,73),
(46,106,84),(47,107,72),(48,108,91),(49,109,66),(50,110,95);

INSERT INTO Attendance VALUES
(1,85),(2,60),(3,78),(4,90),(5,72),
(6,88),(7,65),(8,92),(9,70),(10,80),
(11,68),(12,95),(13,66),(14,89),(15,75),
(16,82),(17,69),(18,91),(19,73),(20,87),
(21,64),(22,93),(23,71),(24,85),(25,76),
(26,90),(27,67),(28,88),(29,70),(30,92),
(31,74),(32,86),(33,69),(34,91),(35,72),
(36,88),(37,65),(38,90),(39,71),(40,87),
(41,75),(42,92),(43,68),(44,85),(45,73),
(46,89),(47,66),(48,91),(49,70),(50,93);

SELECT s.name, a.attendance_percentage
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
WHERE a.attendance_percentage < 75;

SELECT c.course_name, AVG(m.marks) AS avg_marks
FROM Marks m
JOIN Courses c ON m.course_id = c.course_id
GROUP BY c.course_name;

CREATE VIEW student_performance AS
SELECT s.name, c.course_name, m.marks, a.attendance_percentage
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id
JOIN Attendance a ON s.student_id = a.student_id;


 SELECT * FROM student_performance;
 
 DROP VIEW student_performance;

CREATE VIEW student_performance AS
SELECT s.name, c.course_name, m.marks, a.attendance_percentage
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id
JOIN Attendance a ON s.student_id = a.student_id;

SELECT * FROM student_performance;

DELIMITER //

CREATE PROCEDURE TopStudents()
BEGIN
    SELECT s.name, m.marks
    FROM Students s
    JOIN Marks m ON s.student_id = m.student_id
    ORDER BY m.marks DESC
    LIMIT 5;
END //

DELIMITER ;

CALL TopStudents();

DELIMITER //

CREATE TRIGGER check_marks
BEFORE INSERT ON Marks
FOR EACH ROW
BEGIN
    IF NEW.marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot exceed 100';
    END IF;
END //

DELIMITER ;

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Marks;

SELECT * FROM Attendance;

SELECT s.name, c.course_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON m.course_id = c.course_id
ORDER BY m.marks DESC
LIMIT 5;

SELECT s.name, a.attendance_percentage
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
WHERE a.attendance_percentage < 75;

SELECT c.course_name, AVG(m.marks) AS avg_marks
FROM Marks m
JOIN Courses c ON m.course_id = c.course_id
GROUP BY c.course_name;

SELECT * FROM student_performance;