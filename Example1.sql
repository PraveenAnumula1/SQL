CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) DEFAULT 30000,
    DepartmentID INT,
    JoiningDate DATE
);
--display all records
use testing
Select * from Employees

--insert data
INSERT INTO Employees (FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) 
VALUES 
('Akash', 'Reddy', 25, 50000, 1, '2022-01-15'),
('Akshay', 'Tarudkar', 30, 60000, 2, '2021-06-20'),
('Mithun', 'Chakraborthy', 28, NULL, 1, '2023-02-10');

--change the salary based on Empid
UPDATE Employees
SET Salary = 65000
WHERE EmployeeID = 2;

--change the name of the column
ALTER TABLE Employees
ADD FullName AS (FirstName + ' ' + LastName);

--delete the record
DELETE FROM Employees
WHERE EmployeeID = 3;

--add more data into the columns
Insert into Employees (FirstName, LastName, Age, Salary, DepartmentID, JoiningDate) 
VALUES ('Mithun', 'Chakraborthy', 28, NULL, 1, '2023-02-10');

--display based on sorting
SELECT * FROM Employees
ORDER BY Salary DESC;

--display only particular column data
SELECT DISTINCT FirstName FROM Employees;

Alter table Employees 
Add Department Varchar(55)

ALTER TABLE Employees
ALTER COLUMN DepartmentID INT Identity(1,1);

Alter table Employees
Add NewDepartmentID INT NOT NULL IDENTITY(1,1)


UPDATE Employees
SET Department = CASE
    WHEN DepartmentID = 3 THEN 'Finance'
    ELSE Department  -- keeps existing value if no match
END;

update Employees
set DepartmentID=3
where EmployeeID=4



-- 1. BETWEEN: Employees with salary between 40000 and 60000
SELECT * FROM Employees 
WHERE Salary BETWEEN 40000 AND 60000;

-- 2. AND: Employees in HR department earning more than 50000
SELECT * FROM Employees 
WHERE Department = 'HR' AND Salary > 40000;

-- 3. IN: Employees from HR, IT, or Finance departments
SELECT * FROM Employees 
WHERE Department IN ('HR', 'IT', 'Finance');

-- 4. LIKE: Employees whose names start with 'A'
SELECT * FROM Employees 
WHERE FullName LIKE 'A%';

-- 5. LIKE (advanced): Employees whose second letter is 'a'
SELECT * FROM Employees 
WHERE FullName LIKE '_k%';

-- 6. IS NULL: Employees without a manager assigned
SELECT * FROM Employees 
WHERE Salary IS NULL;






