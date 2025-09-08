CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) DEFAULT 30000,
    DepartmentID INT,
    JoiningDate DATE
);

Select * from Employees

INSERT INTO Employees (FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) 
VALUES 
('Akash', 'Reddy', 25, 50000, 1, '2022-01-15'),
('Akshay', 'Tarudkar', 30, 60000, 2, '2021-06-20'),
('Mithun', 'Chakraborthy', 28, NULL, 1, '2023-02-10');

UPDATE Employees
SET Salary = 65000
WHERE EmployeeID = 2;


ALTER TABLE Employees
ADD FullName AS (FirstName + ' ' + LastName);


DELETE FROM Employees
WHERE EmployeeID = 3;

Insert into Employees (FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) 
VALUES ('Mithun', 'Chakraborthy', 28, NULL, 1, '2023-02-10');

SELECT * FROM Employees
ORDER BY Salary DESC;

SELECT DISTINCT FirstName FROM Employees;





