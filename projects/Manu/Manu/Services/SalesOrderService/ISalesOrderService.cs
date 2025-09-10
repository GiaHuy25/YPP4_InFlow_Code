using Manu.Dtos;

namespace Manu.Services.SalesOrderService
{
    public interface ISalesOrderService
    {
        Task<IEnumerable<SalesOrdersDto>> GetAllSalesOrdersAsync();
    }
}
