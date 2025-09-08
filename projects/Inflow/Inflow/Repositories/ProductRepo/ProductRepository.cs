using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.ProductRepo
{
    public class ProductRepository : GenericRepository<Product>, IProductRepository
    {
        public ProductRepository(AppDbContext context) : base(context) { }
    }
}
