CREATE TABLE A( 
EmpID int primary key, 
Ename varchar(50), 
Salary int 
); 
 
CREATE TABLE B( 
EmpID int primary key, 
Ename varchar(50), 
Salary int 
); 
 
INSERT INTO A VALUES 
(1,'AA',1000), 
(2,'BB',300); 
 
INSERT INTO B VALUES 
(2,'BB',400), (3,'CC',100); 
 
 
SELECT EmpID, Ename, min(Salary) as Min_Salary 
FROM 
(SELECT* FROM A 
UNION 
SELECT* FROM B) AS X 
GROUP BY EmpID, Ename;   
