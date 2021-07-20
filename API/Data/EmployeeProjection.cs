using System;

namespace API.Data
{
    public class EmployeeProjection
    {
        public int CompanyId { get; set; }
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateEffective { get; set; }
        public decimal SalaryAmount { get; set; }
    }
}
