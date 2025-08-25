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

-----SECTION 1: DDL (Data Definition Language) — [10 QUESTIONS]----
---Questions: 1 Add a new column PhoneNumber to Employees.
 Alter table Employees add PhoneNumber int
 ------2 Change data type of Email column to VARCHAR(150).
alter table Employees alter column Email VARCHAR(150)
--3 Rename column Location to OfficeLocation in Departments.
exec sp_rename 'Departments.Location', 'OfficeLocation'
----4 Add a default value 'Not Assigned' to column DeptName.
ALTER TABLE Departments ADD CONSTRAINT DF_DeptName DEFAULT 'Not Assigned' FOR DeptName;
-------5  Drop column Bonus from Salaries.
alter table Salaries drop column Bonus
-----6 Rename table Salaries to EmployeeSalaries.
exec sp_rename  'Salaries', 'EmployeeSalaries'
--7 Drop the Projects table
drop table Projects
--8  Add CHECK constraint on Gender to allow only 'M', 'F'.
alter table Employees add constraint chk_gender check (Gender in ('m','f'))
---9 Add NOT NULL constraint to HireDate.
alter table Employees alter column HireDate date not null
---10 Drop CHECK constraint on Gender.
alter table Employees drop constraint chk_gender 

--- SECTION 2: DML (Data Manipulation Language) — [10 QUESTIONS on Employees Table]
---Questions: 1 Insert 3 sample employees.

INSERT INTO Employees(EmpID,FirstName,LastName,Gender,Email,HireDate,DeptID) VALUES 
(111, 'John', 'Doe', 'M', 'john@example.com', '2018-06-01', 1),
(112, 'Jane', 'Smith', 'F', 'jane@example.com', '2021-01-15', 2),
(113, 'Mike', 'Brown', 'M', 'mike@example.com', '2019-09-23', 1);

-- 2 Update email of an employee.
update Employees set email='john.doe@company.com'where EmpID=101;
---3 Update all male employees' emails with suffix @company.com.
 update  Employees  set Email=concat(left(email ,CHARINDEX ('@', Email)-1), '@company.com') WHERE Gender = 'M';
 -- 4 Delete employee with EmpID = 113.
 delete from Employees where EmpID = 113.



 --5 Delete all employees from Department ID 2.
 delete from Employees where DeptID=2



 ---6  Increase all salaries by 10%.
 update EmployeeSalaries set BasicSalary=Basicsalary*1.10
 ---7 Set all null phone numbers to 'Not Provided'.
 alter table Employees alter column PhoneNumber varchar(50);
 update Employees set PhoneNumber= 'NotProvided' where PhoneNumber is null
 ---8 Change gender of employee 101 to 'F'.
 update Employees set Gender='f' where EmpID=101
 ---9 Copy data from one employee to another.
INSERT INTO Employees (EmpID, FirstName, LastName, Gender, Email, HireDate, DeptID)
SELECT 104, FirstName, LastName, Gender, Email, HireDate, DeptID FROM Employees WHERE EmpID = 101;
---10 Delete all employees hired before 2020.
delete from Employees where HireDate > '2020-01-01'
 




 ---- SECTION 3: TCL (Transaction Control Language) — [10 QUESTIONS]
 ---Questions: 1  Start a transaction.
 BEGIN TRAN;
---2 Insert a record inside a transaction.
INSERT INTO Employees(EmpID,FirstName,LastName,Gender,Email,HireDate,DeptID) VALUES 
(114, 'Sara', 'Lee', 'F', 'sara@example.com', '2022-02-10', 1);
---3 Rollback the insert.
ROLLBACK;



-- 4 Commit the transaction after insert.
BEGIN TRAN;
INSERT INTO Employees (EmpID,FirstName,LastName,Gender,Email,HireDate,DeptID)
VALUES (106, 'Tom', 'Cruise', 'M', 'tom@example.com', '2022-03-01', 1);
COMMIT;


--5  Combine UPDATE and DELETE inside a transaction.
BEGIN TRAN;
UPDATE Employees SET Email = 'updated@company.com' WHERE EmpID = 106;
DELETE FROM Employees WHERE EmpID = 102;
----6 Use SAVEPOINT.
SAVE TRAN SavePoint1;
---7  Rollback to SAVEPOINT.
ROLLBACK TRAN SavePoint1;
------8 Commit changes after SAVEPOINT.
 Commit
------9 Begin transaction and check data consistency.
UPDATE Employees SET FirstName = 'Test' WHERE EmpID = 101;
---- 10 Rollback and verify if data is reverted.
Rollback


----- SECTION 4: Aggregate Functions — [10 QUESTIONS]
----Questions: 1 Count employees.
select count(EmpID) as count_emp from Employees
---2 Find average salary.
select AVG(BasicSalary) from EmployeeSalaries
---3 Total salary cost
select sum(BasicSalary) from EmployeeSalaries
--4 Max salary.
select max(BasicSalary) from EmployeeSalaries
--5 Min salary.
select min(BasicSalary) from EmployeeSalaries
--6 Number of employees per department.
select DeptID, count(*) as total from Employees group by DeptID
--7 Department with highest total salary.
select DeptID,sum(BasicSalary) as total_salary from EmployeeSalaries eps
inner join Employees emp on emp.EmpID=eps.EmpID group by DeptID order by total_salary asc
----8 Count male and female employees.
select Gender,count(*) as totalof_grnder from Employees group by Gender
---9 Average deduction.
select AVG(Deduction) as Average_deduction from EmployeeSalaries
---10 Total net salary (Basic + Bonus - Deduction).
select sum(BasicSalary- Deduction) as total_salary from EmployeeSalaries 
select EmpID,sum(BasicSalary- Deduction) as total_salary from EmployeeSalaries group by EmpID



----SECTION 5: JOINS — [10 QUESTIONS]
----Questions: 1 List employees with department name.
select dp.DeptName,emp.FirstName from Employees emp 
inner join Departments dp  on emp.DeptID=dp.DeptID 
---2 List employees with their salaries.
select emp.FirstName,eps.BasicSalary from Employees emp inner join EmployeeSalaries eps on eps.EmpID=emp.EmpID
---3 Inner join Employees and Departments.
select * from Employees emp inner join Departments dp on dp.DeptID=emp.DeptID
---4 Left join Employees with Salaries.
select * from Employees emp left join EmployeeSalaries emps on  emps.EmpID=emp.EmpID
---5 Right join Departments with Employees.
SELECT E.*, D.DeptName FROM Employees E INNER JOIN Departments D ON E.DeptID = D.DeptID;
---6 Full outer join Employees and Salaries.
select emp.FirstName, emps.BasicSalary from Employees emp full outer join EmployeeSalaries emps on  emps.EmpID=emp.EmpID
--7 Employees without salary.
SELECT * FROM Employees
---8 Departments with no employees.
SELECT D.* FROM Departments D LEFT JOIN Employees E ON D.DeptID = E.DeptID WHERE E.DeptID IS NULL;
--9 Employees and project names.
select  emp.FirstName,prj.ProjectName from Employees emp left join Projects prj  on emp.DeptID=prj.DeptID
-- 10 Employees working in projects started after 2021.
select  emp.FirstName,prj.ProjectName from Employees emp left join Projects prj  on emp.DeptID=prj.DeptID where prj.StartDate > '2021-01-01'




----- SECTION 6: Subqueries & CTE — [8 QUESTIONS]
---Questions: 1 Employees with salary above average.
select * from EmployeeSalaries where BasicSalary > (select AVG(BasicSalary) as Average_salary from EmployeeSalaries)
--2 Employee with second highest salary.
select top 1 * from EmployeeSalaries where BasicSalary <(select max(BasicSalary) from EmployeeSalaries) order by BasicSalary desc 
--3 Department with maximum employees.
SELECT DeptID FROM Employees GROUP BY DeptID ORDER BY COUNT(*) DESC;
--4 Count employees in each department using subquery.
select DeptId,(select count(*)from Employees e2 where e2.DeptID=e1.DeptID) As toatal_Employees from Employees e1 group by DeptID

---5 CTE to list all employees and their net salary.
with list_emp as
(select EmpId,( BasicSalary- Deduction) as net_salary from EmployeeSalaries)
select * from list_emp;
---6 CTE to get rank by salary.
with list_salary as
(
select EmpID,BasicSalary,rank() over(order by BasicSalary ) as  SalaryRank from EmployeeSalaries)
select * from list_salary
--- 7 Employees with higher salary than John.
select * from EmployeeSalaries where BasicSalary >
( select BasicSalary from Employees emp join EmployeeSalaries eps on eps.EmpID=emp.EmpID where emp.FirstName='John');


--- by Join 
select emp.EmpID,emp.FirstName,eps.BasicSalary,eps.Deduction from Employees emp 
inner join EmployeeSalaries eps  on eps.EmpID=emp.EmpID where eps.BasicSalary>66000 order by EmpID
--- 8 Departments with average salary > 50000.
select dep.DeptID,AVG(eps.BasicSalary) AS AvgSalary
from Departments dep
inner join Employees emp on emp.DeptID=dep.DeptID
inner join  EmployeeSalaries eps on eps.EmpID=emp.EmpID 
group by dep.DeptID
having AVG(eps.BasicSalary) > 50000

-- 8 by subuery
SELECT DeptID ,avg(BasicSalary) as Average_salary FROM EmployeeSalaries S JOIN Employees E ON S.EmpID = E.EmpID 
GROUP BY E.DeptID HAVING AVG(BasicSalary) > 50000;


----- SECTION 7: Window Functions — [8 QUESTIONS]

--- 1: Find each employee’s salary rank (highest to lowest).
select EmpID,BasicSalary,RANK() over(order by EmpID)as salary_rank from EmployeeSalaries

--- 2: Show each employee’s salary along with the average salary of their department.
select dpm.DeptID,emp.EmpID,emp.FirstName,avg(BasicSalary) from  EmployeeSalaries emps 
inner join  Employees emp on emp.EmpID=emps.EmpID
inner join Departments dpm on dpm.DeptID=emp.DeptID
group by dpm.DeptID,emp.EmpID,emp.FirstName,emps.BasicSalary
order by emp.EmpID

--- 3 Get cumulative salary of employees ordered by HireDate.
select emp.EmpID,emp.FirstName,emp.HireDate,
sum(BasicSalary) over(order by emp.HireDate) as cum_salary
from EmployeeSalaries es
inner join Employees emp on emp.EmpID=es.EmpID
order by emp.HireDate;

--- 4: Find salary difference from avg salary of all employees.
select emp.EmpID,emp.FirstName,es.BasicSalary,
es.BasicSalary-avg(BasicSalary) over() as sal_diff
from EmployeeSalaries es
inner join Employees emp on emp.EmpID=es.EmpID;

---- 5: List employees with salary and max salary in their dept.
select dpm.DeptID,emp.EmpID,emp.FirstName,es.BasicSalary,
max(BasicSalary) over(partition by dpm.DeptID) as max_sal
from EmployeeSalaries es
inner join Employees emp on emp.EmpID=es.EmpID
inner join Departments dpm on dpm.DeptID=emp.DeptID;

---- 6: Show next hire date for each emp (lead).
select emp.EmpID,emp.FirstName,emp.HireDate,
lead(emp.HireDate) over(order by emp.HireDate) as next_hire
from Employees emp;

----- 7: Show previous hire date for each emp (lag).
select emp.EmpID,emp.FirstName,emp.HireDate,
lag(emp.HireDate) over(order by emp.HireDate) as prev_hire
from Employees emp;

----- 8: Find salary percent share of each employee.
select emp.EmpID,emp.FirstName,es.BasicSalary,
cast(es.BasicSalary*100.0/sum(BasicSalary) over() as decimal(5,2)) as sal_percent
from EmployeeSalaries es
inner join Employees emp on emp.EmpID=es.EmpID;



----- SECTION 8: Sets Operator — [8 QUESTIONS]

--- 1: UNION → List all Department names and Project names (no duplicates).
select DeptName as Name from Departments union select ProjectName as Name from Projects;

----2: UNION ALL → List all Department names and Project names (with duplicates).
select DeptName as Name from Departments union all select ProjectName as Name from Projects;

----3: INTERSECT → Dept IDs that exist in both Employees and Projects.
select DeptID from Employees intersect select DeptID from Projects;

----4: EXCEPT → Departments with no projects.
select DeptID from Departments except select DeptID from Projects;

----5: UNION → List all Employee first names and Department names together.
select FirstName as Name from Employees union select DeptName as Name from Departments;

----6: INTERSECT → Dept IDs that have both Employees and Salaries recorded.
select DeptID from Employees intersect select DeptID from Departments;

----7: EXCEPT → Employees in company but not assigned to any Department (hypothetical).
select DeptID from Employees except select DeptID from Departments;




select * from Employees
select * from Departments
select * from Projects
select * from EmployeeSalaries
