using Manu.Models;
using Manu.Repositories.BaseRepo;

namespace Manu.Repositories.SaleOrderItemRepo
{
    public class SaleOrderItemRepository : GenericRepository<SalesOrderItem>, ISaleOrderItemRepository
    {
        public SaleOrderItemRepository(AppDbContext context) : base(context) { }
    }
}
