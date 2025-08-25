
 ---- SECTION 3: TCL (Transaction Control Language) — [10 QUESTIONS on Employees Table ]
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