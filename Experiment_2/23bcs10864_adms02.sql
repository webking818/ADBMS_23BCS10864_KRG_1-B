--MEDIUM LEVEL 
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    manager_id INT NULL,
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
);


INSERT INTO Employee (employee_id, employee_name, department, manager_id) VALUES
(1, 'Rajesh Kumar', 'Engineering', NULL),     
(2, 'Anita Sharma', 'Engineering', 1),
(3, 'Vikram Patel', 'HR', NULL),              
(4, 'Sneha Mehta', 'HR', 3),
(5, 'Aman Verma', 'Engineering', 1),
(6, 'Priya Iyer', 'Engineering', 2);          

SELECT 
    e.employee_name AS Employee_Name,
    e.department AS Employee_Department,
    m.employee_name AS Manager_Name,
    m.department AS Manager_Department
FROM 
    Employee e
LEFT JOIN 
    Employee m ON e.manager_id = m.employee_id;

--HARD LEVEL

CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV DECIMAL(18,2)
);

CREATE TABLE Queries_tbl (
    ID INT,
    YEAR INT
);

INSERT INTO Year_tbl (ID, YEAR, NPV) VALUES
(1, 2020, 100000.00),
(1, 2021, 120000.00),
(2, 2020, 95000.00),
(3, 2022, 110000.00);

INSERT INTO Queries_tbl (ID, YEAR) VALUES
(1, 2020),  
(1, 2021),  
(1, 2022),  
(2, 2020),  
(2, 2021),  
(3, 2022),  
(4, 2023);  

SELECT 
    q.ID,
    q.YEAR,
    ISNULL(y.NPV, 0) AS NPV
FROM 
    Queries_tbl q
LEFT JOIN 
    Year_tbl y ON q.ID = y.ID AND q.YEAR = y.YEAR
ORDER BY 
    q.ID, q.YEAR;
