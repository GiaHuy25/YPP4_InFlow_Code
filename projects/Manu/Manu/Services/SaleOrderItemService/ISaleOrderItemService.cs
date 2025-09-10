using Manu.Dtos;

namespace Manu.Services.SaleOrderItemService
{
    public interface ISaleOrderItemService
    {
        Task AddProductToOrderAsync(int orderId, AddSaleOrderItemDto dto);
        Task UpdateProductInOrderAsync(int orderId, int productId, UpdateSaleOrderItemDto dto);
        Task DeleteProductFromOrderAsync(int orderId, int productId);
    }
}
