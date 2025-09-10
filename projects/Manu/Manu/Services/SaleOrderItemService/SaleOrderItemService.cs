using Manu.Dtos;
using Manu.Models;
using Manu.Repositories.SaleOrderItemRepo;

namespace Manu.Services.SaleOrderItemService
{
    public class SaleOrderItemService : ISaleOrderItemService
    {
        private readonly ISaleOrderItemRepository _repo;

        public SaleOrderItemService(ISaleOrderItemRepository repo) => _repo = repo;

        public async Task AddProductToOrderAsync(int orderId, AddSaleOrderItemDto dto)
        {
            var entity = new SalesOrderItem
            {
                SaleOrderID = orderId,
                ProductID = dto.ProductID,
                Quantity = dto.Quantity,
                UnitPrice = dto.UnitPrice,
                Subtotal = dto.Quantity * dto.UnitPrice
            };
            await _repo.CreateAsync(entity);
        }

        public async Task UpdateProductInOrderAsync(int orderId, int productId, UpdateSaleOrderItemDto dto)
        {
            var item = await _repo.FirstOrDefaultAsync(i => i.SaleOrderID == orderId && i.ProductID == productId);
            if (item == null) throw new Exception("Product not found in this order");

            item.Quantity = dto.Quantity;
            item.UnitPrice = dto.UnitPrice;
            item.Subtotal = dto.Quantity * dto.UnitPrice;

            await _repo.UpdateAsync(item);
        }

        public async Task DeleteProductFromOrderAsync(int orderId, int productId)
        {
            var item = await _repo.FirstOrDefaultAsync(i => i.SaleOrderID == orderId && i.ProductID == productId);
            if (item == null) throw new Exception("Product not found in this order");

            await _repo.DeleteAsync(item);
        }
    }
}
