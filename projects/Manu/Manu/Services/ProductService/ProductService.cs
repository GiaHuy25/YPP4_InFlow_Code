using Manu.Dtos;
using Manu.Repositories.ProductRepo;

namespace Manu.Services.ProductService
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repo;

        public ProductService(IProductRepository repo) => _repo = repo;

        public async Task<IEnumerable<ProductDto>> GetAllProductsAsync()
        {
            var products = _repo.GetAll().Where(p => p.IsActive).ToList();
            return products.Select(p => new ProductDto
            {
                ProductID = p.ProductID,
                ProductName = p.ProductName,
                UnitCost = p.UnitCost,
                AvailableStock = p.AvailableStock
            });
        }
        public async Task<ProductDto?> GetProductByIdAsync(int id)
        {
            var product = await _repo.GetByIdAsync(id);
            if (product == null || !product.IsActive) return null;

            return new ProductDto
            {
                ProductID = product.ProductID,
                ProductName = product.ProductName,
                UnitCost = product.UnitCost,
                AvailableStock = product.AvailableStock
            };
        }
    }
}
