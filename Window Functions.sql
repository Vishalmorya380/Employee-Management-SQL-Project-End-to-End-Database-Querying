
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

