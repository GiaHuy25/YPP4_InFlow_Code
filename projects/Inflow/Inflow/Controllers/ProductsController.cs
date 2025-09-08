using Inflow.Services.ProductService;
using Microsoft.AspNetCore.Mvc;

namespace Inflow.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _service;

        public ProductsController(IProductService service) => _service = service;

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var products = await _service.GetAllProductsAsync();
            return Ok(products);
        }
    }
}
