using Inflow.Models;
using Inflow.Repositories.BaseRepo;
using Microsoft.EntityFrameworkCore;

namespace Inflow.Repositories.SalesOrderRepo
{
    public class SalesOrderRepository : GenericRepository<SalesOrder>, ISalesOrderRepository
    {
        private readonly AppDbContext _context;

        public SalesOrderRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public IQueryable<SalesOrder> GetAllWithIncludes()
        {
            return _context.SaleOrder
                .Include(so => so.Customer)
                .Include(so => so.StockLocation)
                .Include(so => so.Status);
        }
    }
}
