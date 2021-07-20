CREATE VIEW [dbo].ActiveEmployeePayroll AS 
	SELECT 
		eps.CompanyId,
		eps.EmployeeId,
		eps.DateEffective,
		eps.SalaryAmount
	FROM (
			SELECT 
				ep.CompanyId,
				ep.EmployeeId,
				ep.DateEffective,
				ep.SalaryAmount,
				RANK() 
			OVER (PARTITION BY EmployeeId ORDER BY DateEffective DESC) AS Rank
			FROM dbo.EmployeePayroll ep
			WHERE ep.DateEffective <= GETDATE()
	) eps WHERE Rank <= 1