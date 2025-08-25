
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
select  emp.FirstName,prj.ProjectName from Employees emp
left join Projects prj  on emp.DeptID=prj.DeptID where prj.StartDate > '2021-01-01'


