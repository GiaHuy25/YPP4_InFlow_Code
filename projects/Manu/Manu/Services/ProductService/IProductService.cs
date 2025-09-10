using Manu.Dtos;

namespace Manu.Services.ProductService
{
    public interface IProductService
    {
        Task<IEnumerable<ProductDto>> GetAllProductsAsync();
        Task<ProductDto?> GetProductByIdAsync(int id);
    }
}
