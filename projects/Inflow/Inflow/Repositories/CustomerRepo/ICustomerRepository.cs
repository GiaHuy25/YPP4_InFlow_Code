using Inflow.Dtos;
using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.CustomerRepo
{
    public interface ICustomerRepository : IGenericRepository<Customer>
    {
        Task<IEnumerable<CustomerDto>> GetActiveCustomersAsync();
    }
}
