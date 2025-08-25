
-----SECTION 1: DDL (Data Definition Language) — [10 QUESTIONS on Employees Table]----
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