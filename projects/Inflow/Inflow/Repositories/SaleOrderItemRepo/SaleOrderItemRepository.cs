using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.SaleOrderItemRepo
{
    public class SaleOrderItemRepository : GenericRepository<SalesOrderItem>, ISaleOrderItemRepository
    {
        public SaleOrderItemRepository(AppDbContext context) : base(context) { }
    }
}
