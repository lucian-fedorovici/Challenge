CREATE PROCEDURE [dbo].[EmployeeProjection]
	@CompanyId int
AS

BEGIN 

SELECT
	c.CompanyId,
	e.EmployeeId,
	e.FirstName,
	e.LastName,
	ep.DateEffective,
	ep.SalaryAmount
	
FROM [dbo].Company c

INNER JOIN [dbo].Employee e ON e.CompanyId = c.CompanyId
INNER JOIN [dbo].ActiveEmployeePayroll ep ON ep.CompanyId = c.CompanyId AND ep.EmployeeId = e.EmployeeId

WHERE c.CompanyId = @CompanyId
GROUP BY c.CompanyId, e.EmployeeId, e.FirstName, e.LastName, ep.SalaryAmount, ep.DateEffective

END