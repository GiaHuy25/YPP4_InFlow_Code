using Manu.Models;
using Manu.Repositories.BaseRepo;

namespace Manu.Repositories.SalesOrderRepo
{
    public interface ISalesOrderRepository : IGenericRepository<SalesOrder>
    {
        IQueryable<SalesOrder> GetAllWithIncludes();
    }
}
