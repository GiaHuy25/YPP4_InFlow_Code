using Inflow.Dtos;
using Inflow.Repositories.ProductRepo;

namespace Inflow.Services.ProductService
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
    }
}
