using Inflow.Dtos;

namespace Inflow.Services.SalesOrderService
{
    public interface ISalesOrderService
    {
        Task<IEnumerable<SalesOrdersDto>> GetAllSalesOrdersAsync();
    }
}
