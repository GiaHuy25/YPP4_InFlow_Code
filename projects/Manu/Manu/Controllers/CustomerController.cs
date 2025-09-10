using Manu.Dtos;
using Manu.Services.CustomerService;
using Microsoft.AspNetCore.Mvc;

namespace Manu.Controllers
{
    [ApiController]
    [Route("api/customer")]
    public class CustomersController : ControllerBase
    {
        private readonly ICustomerService _service;

        public CustomersController(ICustomerService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var customers = await _service.GetAllAsync();
            return Ok(customers);
        }

        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var customer = await _service.GetByIdAsync(id);
            if (customer == null) return NotFound();
            return Ok(customer);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateCustomerDto dto)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            var customer = await _service.CreateAsync(dto);
            return CreatedAtAction(nameof(GetById), new { id = customer.ObjectID }, customer);
        }
    }
}
