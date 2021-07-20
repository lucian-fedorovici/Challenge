CREATE TABLE [dbo].[EmployeePayroll] (
    [CompanyId]     INT          NOT NULL,
    [EmployeeId]    INT          NOT NULL,
    [DateEffective] DATE         NOT NULL,
    [SalaryAmount]  DECIMAL (18) NOT NULL,
    CONSTRAINT [PK_EmployeePayroll] PRIMARY KEY CLUSTERED ([CompanyId] ASC, [EmployeeId] ASC, [DateEffective] ASC)
);

