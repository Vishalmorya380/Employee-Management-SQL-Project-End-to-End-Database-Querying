
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
