using System.Collections.Generic;
using API.Data;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployeeController : ControllerBase
    {
        private readonly EmployeeRepository _dataRepository;

        public EmployeeController(EmployeeRepository dataRepository)
        {
            _dataRepository = dataRepository;
        }

        [HttpGet]
        public IEnumerable<EmployeeProjection> GetAll()
        {
            return _dataRepository.GetEmployees();
        }

        [HttpGet("id")]
        public ActionResult<Employee> Get(int id)
        {
            var person = _dataRepository.GetEmployee(id);
            if (person == null)
            {
                return NotFound();
            }
            return person;
        }

        [HttpPost]
        public Employee Post(EmployeePostRequest person)
        {
            var savedPerson = _dataRepository.AddEmployee(person.FirstName, person.LastName);
            return savedPerson;
        }

        [HttpPut("{id}")]
        public ActionResult<Employee> Put(int id, EmployeePutRequest person)
        {
            var savedPerson = _dataRepository.UpdateEmployee(new Employee()
            {
                EmployeeId = id,
                FirstName = person.FirstName,
                LastName = person.LastName,
            });

            if (person == null)
            {
                return NotFound();
            }

            return savedPerson;
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _dataRepository.DeleteEmployee(id);
        }
    }
}
