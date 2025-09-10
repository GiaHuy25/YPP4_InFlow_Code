using Manu.Models;
using Manu.Repositories.BaseRepo;

namespace Manu.Repositories.ProductRepo
{
    public class ProductRepository : GenericRepository<Product>, IProductRepository
    {
        public ProductRepository(AppDbContext context) : base(context) { }
    }
}
