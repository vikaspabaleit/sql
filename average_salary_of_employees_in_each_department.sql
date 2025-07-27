# Write a SQL query to find the average salary of employees in each department? 
--Create the 'Departments' table 
CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) 
); --Create the 'Employees' table 
CREATE TABLE Employees ( 
EmployeeID INT PRIMARY KEY, 
EmployeeName VARCHAR(100), 
DepartmentID INT, 
Salary DECIMAL(10, 2), 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 
Question: 📊💼 
Write a SQL query to find the average salary of employees in each department? 
Answer-: 
SELECT  
d.DepartmentID, 
d.DepartmentName, 
AVG(e.Salary) AS AverageSalary 
FROM  
Departments d 
JOIN  
Employees e ON d.DepartmentID = e.DepartmentID 
GROUP BY  
d.DepartmentID, 
d.DepartmentName; 
