using Inflow.Dtos;

namespace Inflow.Services.SaleOrderItemService
{
    public interface ISaleOrderItemService
    {
        Task AddProductToOrderAsync(int orderId, AddSaleOrderItemDto dto);
        Task UpdateProductInOrderAsync(int orderId, int productId, UpdateSaleOrderItemDto dto);
        Task DeleteProductFromOrderAsync(int orderId, int productId);
    }
}
