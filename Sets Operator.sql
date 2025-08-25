

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
