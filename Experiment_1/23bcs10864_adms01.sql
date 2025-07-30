--EASY PROBLEM

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);


CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


INSERT INTO authors (author_id, author_name, country) VALUES
(1, 'George Orwell', 'United Kingdom'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'Chinua Achebe', 'Nigeria');


INSERT INTO books (book_id, title, author_id) VALUES
(101, '1984', 1),
(102, 'Norwegian Wood', 2),
(103, 'Things Fall Apart', 3);


SELECT 
    b.title AS book_title,
    a.author_name,
    a.country
FROM 
    books b
INNER JOIN 
    authors a ON b.author_id = a.author_id;

--MEDIUM PROBLEM
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biology'),
(5, 'Chemistry');


INSERT INTO courses (course_id, course_name, department_id) VALUES
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Databases', 1),
(201, 'Linear Algebra', 2),
(202, 'Calculus', 2),
(301, 'Quantum Mechanics', 3),
(302, 'Electrodynamics', 3),
(303, 'Thermodynamics', 3),
(401, 'Genetics', 4),
(501, 'Organic Chemistry', 5);


SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM courses
    GROUP BY department_id
    HAVING COUNT(*) > 2
);

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'student_user')
BEGIN
    CREATE LOGIN student_user WITH PASSWORD = 'StrongPass123!';
END;


IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'student_user')
BEGIN
    CREATE USER student_user FOR LOGIN student_user;
END;

GRANT SELECT ON courses TO student_user;
