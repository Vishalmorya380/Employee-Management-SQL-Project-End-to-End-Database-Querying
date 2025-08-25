
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
 