CREATE DATABASE sqlDB
use sqlDB
CREATE TABLE Students (
	Student_id INT NOT NULL PRIMARY KEY,
	Student_name VARCHAR(100),
	Age INT,
	Email VARCHAR(100),
	Gender CHAR(100)
);
CREATE TABLE Department (
	Department_id INT NOT NULL PRIMARY KEY,
	Department_name VARCHAR (150),
	Department_office VARCHAR (150)
);
CREATE TABLE Courses (
	Course_id INT NOT NULL PRIMARY KEY,
	Course_name VARCHAR(200),
	Course_duration TIMESTAMP,
	Course_description TEXT,
	Course_cost INT,
	Academic_level NVARCHAR(200),
	Department_id INT NOT NULL
);
CREATE TABLE Instructors (
	Instructor_id INT NOT NULL PRIMARY KEY,
	Instructor_name VARCHAR(100),
	Age INT,
	Gender CHAR,
	Email VARCHAR(100),
	Academic_level VARCHAR(100),
	Years_of_experience INT,
	Country_of_origin VARCHAR(200),
	Department_id INT NOT NULL
);
CREATE TABLE Enrollments (
	Student_id INT NOT NULL,
	Course_id INT NOT NULL
);
CREATE TABLE Course_Assignments (
	Course_id INT NOT NULL,
	Instructor_id INT NOT NULL
);


ALTER TABLE Enrollments ADD Enrollment_date DATE DEFAULT GETDATE();
ALTER TABLE Students ADD Department_id INT
ALTER TABLE Students DROP CONSTRAINT FK__Students__Depart__5070F446;
ALTER TABLE Students DROP COLUMN Department_id;


ALTER TABLE Course_Assignments ADD FOREIGN KEY (Course_id) REFERENCES Courses(Course_id);
ALTER TABLE Course_Assignments ADD FOREIGN KEY (Instructor_id) REFERENCES Instructors(Instructor_id);
ALTER TABLE Enrollments ADD FOREIGN KEY (Course_id) REFERENCES Courses(Course_id);
ALTER TABLE Enrollments ADD FOREIGN KEY (Student_id) REFERENCES Students(Student_id);
ALTER TABLE Courses ADD FOREIGN KEY (Department_id) REFERENCES Department(Department_id);
ALTER TABLE Instructors ADD FOREIGN KEY (Department_id) REFERENCES Department(Department_id);
ALTER TABLE Students ADD FOREIGN KEY (Department_id) REFERENCES Department(Department_id);
select * from Students



INSERT INTO Students Values ( 001, 'Paul Kimani', 29, 'paul@gomycode.ke', 'M');
INSERT INTO Students (Student_id, Student_name, Age, Email, Gender)
	Values (002, 'Shneider', 20, 'shneider@gomycode.ke', 'M')
INSERT INTO Students (Student_id, Student_name, Age, Email, Gender)
	values
		(003, 'Laura', 21, 'laura@gomycode.ke', 'F'),
		(004, 'Marion', 22, 'marion@gomycode.ke', 'F');
select * from Students
DELETE from Students;


								SELECT 
									f.name AS constraint_name,
									OBJECT_NAME(f.parent_object_id) AS table_name,
									COL_NAME(fc.parent_object_id, fc.parent_column_id) AS column_name
								FROM 
									sys.foreign_keys AS f
								INNER JOIN 
									sys.foreign_key_columns AS fc 
									ON f.object_id = fc.constraint_object_id
								WHERE 
									OBJECT_NAME(f.parent_object_id) = 'Enrollments'
									AND COL_NAME(fc.parent_object_id, fc.parent_column_id) = 'Student_id';


ALTER TABLE Enrollments DROP CONSTRAINT FK__Enrollmen__Stude__4D94879B;
DROP TABLE Students;
CREATE TABLE Students (
	Student_id INT IDENTITY(1,1) PRIMARY KEY,
	Student_name VARCHAR(100),
	Age INT,
	Email VARCHAR(100),
	Gender CHAR(100)
);
INSERT INTO Students (Student_name, Age, Email, Gender)
	values ('Paul Kimani', 29, 'paul@gomycode.ke', 'M');
INSERT INTO Students (Student_name, Age, Email, Gender)
	values
		('Shneider', 20, 'shneider@gomycode.ke', 'M'),
		('Marion Minda', 22,'MarionMA@students.gomycode.ke', 'F'),
		('Laura Akinyi', 21,'LKinyi@students.gomycode.ke', 'F'),
		('Mercy Mwova', 68,'MMwova@students.gomycode.ke', 'F'); 
select * from students

ALTER TABLE Students ADD Department_id INT
ALTER TABLE Students ADD FOREIGN KEY (Department_id) REFERENCES Department(Department_id);
ALTER TABLE Enrollments ADD FOREIGN KEY (Student_id) REFERENCES Students(Student_id);
