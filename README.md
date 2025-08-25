# 🗄️ Employee Management SQL Project  

This project demonstrates **SQL fundamentals to advanced concepts** using an `Employee Management` database.  
It covers **DDL, DML, TCL, Joins, Aggregates, Subqueries, CTEs, Window Functions, and Set Operators** with practical examples.  

---

## 📌 Project Overview  

- Created a **relational database** with 4 tables:  
  - Employees 👨‍💼  
  - Departments 🏢  
  - Projects 📊  
  - EmployeeSalaries 💰  
- Inserted **sample data** to simulate a real-world scenario.  
- Performed **60+ SQL queries** to practice and demonstrate different concepts.  

---

## 🏗️ Database Schema  

### 1. Create Database & Tables  
![Database and Employees Table](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Create%20databse%20and%20Table%201.png)  
- Defines the `EmployeeManagement` database.  
- Creates the **Employees** table with constraints.  

### 2. Departments Table  
![Departments Table](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Create%20Table%202%20and%203.png)  
- Stores department info like `DeptID`, `DeptName`, and `OfficeLocation`.  

### 3. Projects Table  
![Projects Table](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Create%20Table%202%20and%203.png)  
- Stores company projects with `StartDate` and `EndDate`.  

### 4. Employee Salaries Table  
![Salaries Table](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Create%20Table%204.png)  
- Maintains salary, bonus, and deduction details.  

---

## 🛠️ SQL Queries  

### 🔹 Section 1: DDL (Data Definition Language)  
![DDL Queries](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/DDl.png)  
- Add, drop, and rename columns/tables.  
- Apply **constraints** (NOT NULL, CHECK, DEFAULT).  
- Rename tables and drop columns.  

### 🔹 Section 2: DML (Data Manipulation Language)  
![DML Queries](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/DML.png)  
- Insert new employees.  
- Update emails and phone numbers.  
- Delete employees based on conditions.  

### 🔹 Section 3: TCL (Transaction Control Language)  
![TCL Queries](images/tcl.png)  
- Transactions with `COMMIT`, `ROLLBACK`, and `SAVEPOINT`.  
- Ensures **data consistency**.  

### 🔹 Section 4: Aggregate Functions  
![Aggregates](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Aggregate.png)  
- Count employees, average salary, max/min salary.  
- Group employees by department and gender.  

### 🔹 Section 5: Joins  
![Joins](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Joins.png)  
- INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN.  
- Employees with salaries, departments without employees, etc.  

### 🔹 Section 6: Subqueries & CTEs  
![Subqueries and CTEs](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Sub%20Queries.png)  
- Salary above average, second highest salary.  
- CTEs for ranking and net salary.  

### 🔹 Section 7: Window Functions  
![Window Functions](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Window%20Function.png)  
- RANK, LEAD, LAG, SUM OVER, MAX OVER.  
- Analyze salary distribution, cumulative salary, percent contribution.  

### 🔹 Section 8: Set Operators  
![Set Operators](https://github.com/Vishalmorya380/Employee-Management-SQL-Project-End-to-End-Database-Querying/blob/main/Sets.png)  
- UNION, UNION ALL, INTERSECT, EXCEPT.  
- Compare employees, departments, and projects.

---

---

##  🏗 Database Schema

```sql
Employees Table
CREATE TABLE Employees (
  EmpID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender CHAR(1),
  Email VARCHAR(100),
  HireDate DATE,
  DeptID INT
);
```

---

# 🏗 Departments Table

```sql
CREATE TABLE Departments (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);
```

---

# 🏗 Projects Table

```sql
CREATE TABLE Projects (
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR(100),
  DeptID INT,
  StartDate DATE,
  EndDate DATE
);
```

---

#  EmployeeSalaries Table
```sql
CREATE TABLE EmployeeSalaries (
  EmpID INT,
  BasicSalary DECIMAL(10, 2),
  Bonus DECIMAL(10, 2),
  Deduction DECIMAL(10, 2),
  FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
```

---


#  in our queryies below we remane tha table from Salaries to EmployeeSalaries----
select * from Employees
select * from Departments
select * from Salaries
select * from Projects
select * from EmployeeSalaries

---

## 📝 SECTION 1: DDL (Data Definition Language) — [10 QUESTIONS]

```sql
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
```

---


## 📝 SECTION 2: DML (Data Manipulation Language) — [10 QUESTIONS]

```sql
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
 
```

---


## 📝  SECTION 3: TCL (Transaction Control Language) — [10 QUESTIONS]

```sql
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
```

---



## 📝  SECTION 4: Aggregate Functions  — [10 QUESTIONS]

```sql
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
```

---



## 📝 SECTION 5: JOINS — [10 QUESTIONS]

```sql
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
```

---

## 📝  SECTION 6: Subqueries & CTE — [8 QUESTIONS]

```sql
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
```

---



## 📝  SECTION 7: Window Functions — [8 QUESTIONS]

```sql
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
```

---



## 📝 SECTION 8: Sets Operator — [8 QUESTIONS]
```sql

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
```

---


# 📊 Query Outputs  

---

### 1️⃣ Count Employees  
**Query**  
```sql
SELECT COUNT(EmpID) AS total_employees FROM Employees;
Output

diff
Copy
Edit
+----------------+
| total_employees|
+----------------+
|       10       |
+----------------+
```

---

---

###
2️⃣ Average Salary of Employees
**Query**  
```sql
Copy
Edit
SELECT AVG(BasicSalary) AS avg_salary FROM EmployeeSalaries;
Output

diff
Copy
Edit
+------------+
| avg_salary |
+------------+
|  57500.00  |
+------------+
```

---

---

###
3️⃣ Employees Per Department

**Query**  
```sql

Copy
Edit
SELECT DeptID, COUNT(*) AS total_employees 
FROM Employees 
GROUP BY DeptID;
Output

diff
Copy
Edit
+--------+----------------+
| DeptID | total_employees|
+--------+----------------+
|   1    |       4        |
|   2    |       2        |
|   3    |       2        |
|   4    |       2        |
+--------+----------------+
```

---

---

###
4️⃣ Total Net Salary (Basic - Deduction)

**Query**  
```sql

Copy
Edit
SELECT SUM(BasicSalary - Deduction) AS total_net_salary 
FROM EmployeeSalaries;
Output

diff
Copy
Edit
+----------------+
| total_net_salary|
+----------------+
|    575050.00   |
+----------------+
```

---

---

###
5️⃣ Employees with Department Name

**Query**  
```sql

Copy
Edit
SELECT E.FirstName, D.DeptName 
FROM Employees E
INNER JOIN Departments D ON E.DeptID = D.DeptID;
Output

diff
Copy
Edit
+-----------+-----------+
| FirstName | DeptName  |
+-----------+-----------+
| John      | IT        |
| Mike      | IT        |
| Tom       | IT        |
| Sara      | IT        |
| Jane      | HR        |
| Ravi      | HR        |
| Emily     | Finance   |
| Nina      | Finance   |
| David     | Marketing |
| Lina      | Marketing |
+-----------+-----------+
```

---

---

###
6️⃣ Department with Highest Salary Cost

**Query**  
```sql

Copy
Edit
SELECT TOP 1 E.DeptID, SUM(S.BasicSalary) AS total_salary
FROM Employees E
INNER JOIN EmployeeSalaries S ON E.EmpID = S.EmpID
GROUP BY E.DeptID
ORDER BY total_salary DESC;
Output

diff
Copy
Edit
+--------+--------------+
| DeptID | total_salary |
+--------+--------------+
|   1    |   246000     |
+--------+--------------+
```

---

---

###
7️⃣ Employees Without Salary Record

**Query**  
```sql

Copy
Edit
SELECT * 
FROM Employees 
WHERE EmpID NOT IN (SELECT EmpID FROM EmployeeSalaries);
Output

pgsql
Copy
Edit
(No rows – All employees have salary record)
```

---

---

###
8️⃣ Employee Salary Rank

**Query**  
```sql

Copy
Edit
SELECT EmpID, BasicSalary,
RANK() OVER(ORDER BY BasicSalary DESC) AS salary_rank
FROM EmployeeSalaries;
Output

diff
Copy
Edit
+-------+-------------+-------------+
| EmpID | BasicSalary | salary_rank |
+-------+-------------+-------------+
|  104  |   70000     |      1      |
|  103  |   65000     |      2      |
|  105  |   62000     |      3      |
|  101  |   60000     |      4      |
|  106  |   59000     |      5      |
|  109  |   53000     |      6      |
|  108  |   52000     |      7      |
|  110  |   51000     |      8      |
|  102  |   55000     |      9      |
|  107  |   48000     |     10      |
+-------+-------------+-------------+
```

---

---

###
9️⃣ Departments with Avg Salary > 50,000

**Query**  
```sql

Copy
Edit
SELECT D.DeptName, AVG(S.BasicSalary) AS avg_salary
FROM Departments D
INNER JOIN Employees E ON D.DeptID = E.DeptID
INNER JOIN EmployeeSalaries S ON E.EmpID = S.EmpID
GROUP BY D.DeptName
HAVING AVG(S.BasicSalary) > 50000;
Output

diff
Copy
Edit
+-----------+------------+
| DeptName  | avg_salary |
+-----------+------------+
| IT        |  61500.00  |
| Finance   |  61000.00  |
+-----------+------------+
```

---

---

###
🔟 Employees with Salary Greater than John

**Query**  
```sql

Copy
Edit
SELECT E.FirstName, S.BasicSalary 
FROM Employees E
INNER JOIN EmployeeSalaries S ON E.EmpID = S.EmpID
WHERE S.BasicSalary > (
  SELECT S2.BasicSalary 
  FROM Employees E2
  JOIN EmployeeSalaries S2 ON E2.EmpID = S2.EmpID
  WHERE E2.FirstName = 'John'
);
Output

diff
Copy
Edit
+-----------+-------------+
| FirstName | BasicSalary |
+-----------+-------------+
| Mike      |   65000     |
| Emily     |   70000     |
| Tom       |   62000     |
+-----------+-------------+
```

---

---

## ⚙️ How to Run

1. Clone this repo:
   ```bash
   git clone https://github.com/your-username/sql-aggregate-groupby.git
   ```
2. Import the sample database (schema + data).
3. Open SQL Server / SSMS or any SQL client.
4. Run queries in order.

---

## 🛠️ Tech Stack
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

---

## 💡 Insights  

1. **Workforce Size**  
   - Found **total employees = 10** across the organization.  
   - Useful for **HR headcount analysis**.  
---
2. **Salary Distribution**  
   - Average employee salary ≈ **₹57,500**.  
   - Salary ranges from **₹48,000 (lowest)** to **₹70,000 (highest)**.  
   - Helps in **compensation benchmarking**.  
---
3. **Department Analysis**  
   - IT department has the **highest salary budget = ₹2,46,000**.  
   - HR and Finance show **lower headcounts but competitive avg salaries**.  
   - Finance & IT departments have **avg salaries > ₹60,000**, showing they are higher-paying units.  
---
4. **Top Earners**  
   - Employee **Emily (₹70,000)** ranks #1.  
   - Salary ranking query provides a **clear hierarchy of pay levels**.  
---
5. **Employee Comparison**  
   - Identified employees earning **more than John (₹60,000)** → Mike, Tom, and Emily.  
   - Helps managers spot **peer benchmarks**.  
---
6. **Data Integrity**  
   - No employees exist without salary records (validated via **EXCEPT query**).  
   - Confirms **clean database linkage**.  
---
7. **Set Operations**  
   - Compared Employee & Department datasets using **UNION, INTERSECT, EXCEPT**.  
   - Verified **consistency of DeptIDs** across multiple tables.  
---

8. **Business Decisions Enabled**  
   - **Compensation fairness check** across departments.  
   - **Resource allocation**: IT is salary-heavy, HR/Finance are leaner.  
   - **Retention risks**: salary gaps highlight potential employee dissatisfaction if not addressed.  
---

## 📌 Author
👤 **Your Name**  
📧 [Vishal](mailto:Vishalmorya380@gmail.com)  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/vishal-maurya-bb66b4378)  
```
