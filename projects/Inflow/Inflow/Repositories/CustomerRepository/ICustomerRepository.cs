using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.CustomerRepository
{
    public interface ICustomerRepository : IGenericRepository<Customer>
    {
        Task<IEnumerable<Customer>> GetActiveCustomersAsync();
    }
}
