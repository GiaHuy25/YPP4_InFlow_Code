using Manu.Dtos;
using Manu.Models;
using Manu.Repositories.BaseRepo;

namespace Manu.Repositories.CustomerRepo
{
    public interface ICustomerRepository : IGenericRepository<Customer>
    {
        Task<IEnumerable<CustomerDto>> GetActiveCustomersAsync();
    }
}
