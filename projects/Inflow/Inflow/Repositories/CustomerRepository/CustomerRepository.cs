using Inflow.Models;
using Inflow.Repositories.BaseRepo;

namespace Inflow.Repositories.CustomerRepository
{
    public class CustomerRepository : GenericRepository<Customer>, ICustomerRepository
    {
        private readonly AppDbContext _context;

        public CustomerRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Customer>> GetActiveCustomersAsync()
        {
            return await Task.FromResult(
                _context.Customer.Where(c => c.IsActive).AsEnumerable()
            );
        }
    }
}
