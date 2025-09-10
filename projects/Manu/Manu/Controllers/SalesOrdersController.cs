using Manu.Dtos;
using Manu.Services.SalesOrderService;
using Microsoft.AspNetCore.Mvc;

namespace Manu.Controllers
{
    [ApiController]
    [Route("api/salesorders")]
    public class SalesOrdersController : ControllerBase
    {
        private readonly ISalesOrderService _service;

        public SalesOrdersController(ISalesOrderService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<SalesOrdersDto>>> GetAll()
        {
            var salesOrders = await _service.GetAllSalesOrdersAsync();
            return Ok(salesOrders);
        }
    }
}
