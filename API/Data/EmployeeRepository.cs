using System;
using System.Collections.Generic;
using System.Linq;

namespace API.Data
{
    public interface IEmployeeRepository
    {
        public IEnumerable<EmployeeProjection> GetEmployees();
        public Employee GetEmployee(int id);
        public Employee AddEmployee(string firstName, string lastName);
        public Employee UpdateEmployee(Employee person);
        public void DeleteEmployee(int id);
    }

    public class EmployeeRepository : IEmployeeRepository
    {
        private readonly List<Employee> _employees = new List<Employee>()
        {
            new Employee()
            {
                EmployeeId = 1,
                FirstName="Bob",
                LastName="Smith"
            } ,
            new Employee()
            {
                EmployeeId = 2,
                FirstName="Jane",
                LastName="Jones"
            },
            new Employee()
            {
                EmployeeId = 3,
                FirstName="Sam",
                LastName="Peters"
            }
        };

        public IEnumerable<EmployeeProjection> GetEmployees()
        {
            return _employees.Select(p => new EmployeeProjection
            {
                CompanyId=p.CompanyId,
                EmployeeId=p.EmployeeId,
                FirstName=p.FirstName,
                LastName=p.LastName,
                DateEffective = DateTime.Now,
                SalaryAmount = 1000
            });
        }

        public Employee GetEmployee(int id)
        {
            return _employees.Where(p => p.EmployeeId == id).FirstOrDefault();
        }

        public Employee AddEmployee(string firstName, string surname)
        {
            var person = new Employee()
            {
                EmployeeId = _employees.Any() ? _employees.Max(p => p.EmployeeId) + 1 : 1,
                FirstName = firstName,
                LastName = surname
            };

            _employees.Add(person);
            return person;
        }

        public Employee UpdateEmployee(Employee person)
        {
            var foundPerson = GetEmployee(person.EmployeeId);
            if (foundPerson == null)
            {
                return null;
            }
            if (!string.IsNullOrEmpty(person.FirstName))
            {
                foundPerson.FirstName = person.FirstName;
            }
            if (!string.IsNullOrEmpty(person.LastName))
            {
                foundPerson.LastName = person.LastName;
            }
            return foundPerson;
        }

        public void DeleteEmployee(int id)
        {
            var foundPerson = GetEmployee(id);
            if (foundPerson != null)
            {
                _employees.Remove(foundPerson);
            }
        }
    }
}
