using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.SalesOrderRepo
{
    public interface ISalesOrderRepository : IGenericRepository<SalesOrder>
    {
        IQueryable<SalesOrder> GetAllWithIncludes();
    }
}
