-- Q1: CRUD Operations

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Students
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

INSERT INTO Courses
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

INSERT INTO Instructors
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 65000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 60000.00);

INSERT INTO Enrollments
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');

INSERT INTO Departments
VALUES (3, 'Physics');

INSERT INTO Students
VALUES (3, 'Mark', 'Taylor', 'mark.taylor@email.com',
        '2001-03-10', '2023-08-01');

INSERT INTO Courses
VALUES (103, 'Physics Basics', 3, 3);

INSERT INTO Instructors
VALUES (3, 'David', 'Brown', 'david.brown@univ.com', 3, 55000.00);

INSERT INTO Enrollments
VALUES (3, 3, 103, '2023-08-01');

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;

UPDATE Departments
SET DepartmentName = 'Physics and Science'
WHERE DepartmentID = 3;

UPDATE Students
SET FirstName = 'Mark Updated'
WHERE StudentID = 3;

UPDATE Courses
SET Credits = 4
WHERE CourseID = 103;

UPDATE Instructors
SET Salary = 58000.00
WHERE InstructorID = 3;

UPDATE Enrollments
SET EnrollmentDate = '2023-09-01'
WHERE EnrollmentID = 3;

DELETE FROM Enrollments WHERE EnrollmentID = 3;
DELETE FROM Courses WHERE CourseID = 103;
DELETE FROM Instructors WHERE InstructorID = 3;
DELETE FROM Students WHERE StudentID = 3;
DELETE FROM Departments WHERE DepartmentID = 3;


-- Q2: Students enrolled after 2022

SELECT
    StudentID,
    FirstName,
    LastName,
    Email,
    EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2022-12-31';


-- Q3: Mathematics courses, limit 5

SELECT
    c.CourseID,
    c.CourseName,
    c.DepartmentID,
    c.Credits
FROM Courses c
INNER JOIN Departments d
    ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;


-- Q4: Courses with more than 5 students

SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents
FROM Courses c
INNER JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;


-- Q5: Students in both courses

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;


-- Q6: Students in either course

SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');


-- Q7: Average course credits

SELECT AVG(Credits) AS AverageCredits
FROM Courses;


-- Q8: Maximum instructor salary

SELECT MAX(i.Salary) AS MaximumSalary
FROM Instructors i
INNER JOIN Departments d
    ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';


-- Q9: Students in each department

SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;


-- Q10: INNER JOIN students and courses

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;


-- Q11: LEFT JOIN students and courses

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID
ORDER BY s.StudentID;


-- Q12: Students in courses with more than 10 students

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
WHERE s.StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);


-- Q13: Extract enrollment year

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    EXTRACT(YEAR FROM EnrollmentDate) AS EnrollmentYear
FROM Students;


-- Q14: Concatenate instructor name

SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;


-- Q15: Running total of enrolled students

SELECT
    EnrollmentID,
    StudentID,
    CourseID,
    EnrollmentDate,
    COUNT(*) OVER (
        ORDER BY EnrollmentDate, EnrollmentID
    ) AS RunningTotalStudents
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;


-- Q16: Senior or Junior students

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        WHEN EnrollmentDate < CURRENT_DATE - INTERVAL '4 years'
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentStatus
FROM Students;