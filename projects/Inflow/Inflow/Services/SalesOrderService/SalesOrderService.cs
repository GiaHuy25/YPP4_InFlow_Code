using Inflow.Dtos;
using Inflow.Repositories.SalesOrderRepo;
using Microsoft.EntityFrameworkCore;

namespace Inflow.Services.SalesOrderService
{
    public class SalesOrderService : ISalesOrderService
    {
        private readonly ISalesOrderRepository _repository;

        public SalesOrderService(ISalesOrderRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<SalesOrdersDto>> GetAllSalesOrdersAsync()
        {
            var salesOrders = await _repository.GetAllWithIncludes().ToListAsync();

            return salesOrders.Select(so => new SalesOrdersDto
            {
                SaleOrderCode = so.SaleOrderCode,
                Status = so.Status != null ? so.Status.KeyValue ?? "Unknown" : "Unknown",
                Customer = so.Customer != null ? so.Customer.ObjectName : "N/A",
                OrderDate = so.OrderDate,
                location = so.StockLocation != null ? so.StockLocation.StockLocationName : "N/A",
                Total = so.Total,
                Balance = so.Balance
            }).ToList();
        }
    }
}
