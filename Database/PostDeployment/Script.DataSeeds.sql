GO

IF NOT EXISTS (SELECT * FROM dbo.Company WHERE CompanyId = 1)
BEGIN

	SET IDENTITY_INSERT dbo.Company ON

	INSERT INTO dbo.Company (CompanyId, CompanyName) VALUES (1, 'Test Company')

	SET IDENTITY_INSERT dbo.Company OFF


	SET IDENTITY_INSERT dbo.Employee ON

	INSERT INTO dbo.Employee (CompanyId, EmployeeId, FirstName, LastName) VALUES (1, 1, 'Bob', 'Smith')
	INSERT INTO dbo.Employee (CompanyId, EmployeeId, FirstName, LastName) VALUES (1, 2, 'Jane', 'Jones')
	INSERT INTO dbo.Employee (CompanyId, EmployeeId, FirstName, LastName) VALUES (1, 3, 'Sam', 'Peters')

	SET IDENTITY_INSERT dbo.Employee OFF

	INSERT INTO dbo.EmployeePayroll (CompanyId, EmployeeId, DateEffective, SalaryAmount) VALUES (1, 1, '01/07/2019', 1000)
	INSERT INTO dbo.EmployeePayroll (CompanyId, EmployeeId, DateEffective, SalaryAmount) VALUES (1, 1, '01/07/2020', 1500)
	INSERT INTO dbo.EmployeePayroll (CompanyId, EmployeeId, DateEffective, SalaryAmount) VALUES (1, 1, '01/07/2021', 2000)

	INSERT INTO dbo.EmployeePayroll (CompanyId, EmployeeId, DateEffective, SalaryAmount) VALUES (1, 2, '01/07/2020', 1100)

	INSERT INTO dbo.EmployeePayroll (CompanyId, EmployeeId, DateEffective, SalaryAmount) VALUES (1, 3, '07/07/2021', 1200)


END