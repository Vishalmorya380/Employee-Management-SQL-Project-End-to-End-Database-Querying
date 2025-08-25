create database EmployeeManagement

---------------1 tableEmployees----------

create table Employees( EmpID INT PRIMARY KEY, FirstName VARCHAR(50),LastName VARCHAR(50), Gender CHAR(1),
Email VARCHAR(100), HireDate DATE, DeptID INT)

select * from Employees

insert into Employees (EmpID,FirstName,LastName,Gender,Email,HireDate,DeptID) values
(101, 'John', 'Doe', 'M', 'john@example.com', '2018-06-01', 1),
(102, 'Jane', 'Smith', 'F', 'jane@example.com', '2021-01-15', 2),
(103, 'Mike', 'Brown', 'M', 'mike@example.com', '2019-09-23', 1),
(104, 'Emily', 'Clark', 'F', 'emily@example.com', '2020-11-10', 3),
(105, 'Tom', 'Cruise', 'M', 'tom@example.com', '2022-03-01', 1),
(106, 'Sara', 'Lee', 'F', 'sara@example.com', '2022-02-10', 1),
(107, 'David', 'Kim', 'M', 'david@example.com', '2023-01-20', 4),
(108, 'Nina', 'Sharma', 'F', 'nina@example.com', '2020-12-15', 3),
(109, 'Ravi', 'Mehta', 'M', 'ravi@example.com', '2023-07-01', 2),
(110, 'Lina', 'Patel', 'F', 'lina@example.com', '2024-02-18', 4)


----------2 nd table Department----------

CREATE TABLE Departments ( DeptID INT PRIMARY KEY, DeptName VARCHAR(50), Location VARCHAR(50));

-----------Insert into Departments--------
INSERT INTO Departments (DeptID, DeptName, Location) VALUES 
(1, 'IT', 'New York'),
(2, 'HR', 'Chicago'),
(3, 'Finance', 'Dallas'),
(4, 'Marketing', 'San Francisco')


-----------3d table  Projects---------


CREATE TABLE Projects ( ProjectID INT PRIMARY KEY, ProjectName VARCHAR(100), DeptID INT, StartDate DATE, EndDate DATE);


------------Insert into Projects------

INSERT INTO Projects (ProjectID, ProjectName, DeptID, StartDate, EndDate)VALUES 
(201, 'AI Migration', 1, '2022-01-01', '2023-06-01'),
(202, 'HRMS Upgrade', 2, '2021-05-01', '2022-01-15'),
(203, 'Finance Tracker', 3, '2023-02-15', NULL),
(204, 'Digital Marketing', 4, '2023-09-01', NULL),
(205, 'Data Lake Setup', 1, '2024-03-10', NULL),
(206, 'Recruitment Portal', 2, '2022-07-01', '2023-01-01');


-- Table 4: Salaries


CREATE TABLE Salaries (EmpID INT,BasicSalary DECIMAL(10, 2),Bonus DECIMAL(10, 2),Deduction DECIMAL(10, 2),FOREIGN KEY (EmpID) REFERENCES Employees(EmpID));

----------Insert into Salaries------

INSERT INTO Salaries (EmpID, BasicSalary, Bonus, Deduction) VALUES
(101, 60000, 5000, 2000),
(102, 55000, 4000, 1800),
(103, 65000, 6000, 2500),
(104, 70000, 7000, 3000),
(105, 62000, 5500, 2200),
(106, 59000, 5000, 2100),
(107, 48000, 3500, 1600),
(108, 52000, 4000, 1900),
(109, 53000, 4100, 1850),
(110, 51000, 3900, 1750)


---- in our queryies below we remane tha table from Salaries to EmployeeSalaries----
select * from Employees
select * from Departments
select * from Salaries
select * from Projects
select * from EmployeeSalaries
