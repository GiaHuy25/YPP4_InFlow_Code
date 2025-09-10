using Manu.Dtos;
using Manu.Models;
using Manu.Repositories.BaseRepo;
using Microsoft.EntityFrameworkCore;

namespace Manu.Repositories.CustomerRepo
{
    public class CustomerRepository : GenericRepository<Customer>, ICustomerRepository
    {
        private readonly AppDbContext _context;

        public CustomerRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<CustomerDto>> GetActiveCustomersAsync()
        {
            return await _context.Customer
                .Where(c => c.IsActive)
                .Include(c => c.BillingAddress)
                .Include(c => c.ShippingAddress)
                .Select(c => new CustomerDto
                {
                    ObjectID = c.ObjectID,
                    ObjectName = c.ObjectName,
                    Phone = c.Phone,
                    Email = c.Email,
                    Fax = c.Fax,

                    BillingAddress = c.BillingAddress != null
                        ? $"{c.BillingAddress.Street}, {c.BillingAddress.City}, {c.BillingAddress.StateProvince}, {c.BillingAddress.Country}, {c.BillingAddress.ZipPostalCode}"
                        : null,

                    ShippingAddress = c.ShippingAddress != null
                        ? $"{c.ShippingAddress.Street}, {c.ShippingAddress.City}, {c.ShippingAddress.StateProvince}, {c.ShippingAddress.Country}, {c.ShippingAddress.ZipPostalCode}"
                        : null,

                    TotalSpend = c.TotalSpend,
                    LastOrderDate = c.LastOrderDate,
                    CompanyName = c.CompanyName,
                    Website = c.Website
                })
                .ToListAsync();
        }

    }
}
