
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