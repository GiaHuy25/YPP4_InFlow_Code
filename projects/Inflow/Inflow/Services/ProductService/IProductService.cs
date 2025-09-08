using Inflow.Dtos;

namespace Inflow.Services.ProductService
{
    public interface IProductService
    {
        Task<IEnumerable<ProductDto>> GetAllProductsAsync();
    }
}
