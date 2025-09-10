using Manu.Dtos;
using Manu.Services.SaleOrderItemService;
using Microsoft.AspNetCore.Mvc;

namespace Manu.Controllers
{
    [ApiController]
    [Route("api/salesorders/{orderId}/products")]
    public class SaleOrderProductsController : ControllerBase
    {
        private readonly ISaleOrderItemService _service;

        public SaleOrderProductsController(ISaleOrderItemService service) => _service = service;

        [HttpPost]
        public async Task<IActionResult> AddProduct(int orderId, [FromBody] AddSaleOrderItemDto dto)
        {
            await _service.AddProductToOrderAsync(orderId, dto);
            return Ok("Product added to order");
        }

        [HttpPut("{productId}")]
        public async Task<IActionResult> UpdateProduct(int orderId, int productId, [FromBody] UpdateSaleOrderItemDto dto)
        {
            await _service.UpdateProductInOrderAsync(orderId, productId, dto);
            return Ok("Product updated in order");
        }

        [HttpDelete("{productId}")]
        public async Task<IActionResult> DeleteProduct(int orderId, int productId)
        {
            await _service.DeleteProductFromOrderAsync(orderId, productId);
            return Ok("Product removed from order");
        }
    }
}
