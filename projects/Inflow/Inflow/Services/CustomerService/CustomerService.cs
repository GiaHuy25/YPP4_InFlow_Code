using Inflow.Dtos;
using Inflow.Models;
using Inflow.Repositories.CustomerRepo;

namespace Inflow.Services.CustomerService
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomerRepository _repo;

        public CustomerService(ICustomerRepository repo)
        {
            _repo = repo;
        }

        public async Task<IEnumerable<CustomerDto>> GetAllAsync()
        {
            var customers = await _repo.GetActiveCustomersAsync();
            return customers.Select(c => new CustomerDto
            {
                ObjectID = c.ObjectID,
                ObjectName = c.ObjectName,
                Phone = c.Phone,
                Email = c.Email,
                Fax = c.Fax,
                TotalSpend = c.TotalSpend,
                LastOrderDate = c.LastOrderDate,
                ShippingAddress = c.ShippingAddress,
                BillingAddress = c.BillingAddress,
                CompanyName = c.CompanyName,
                Website = c.Website
            });
        }

        public async Task<CustomerDto?> GetByIdAsync(int id)
        {
            var customer = await _repo.GetByIdAsync(id);
            if (customer == null || !customer.IsActive) return null;

            return new CustomerDto
            {
                ObjectID = customer.ObjectID,
                ObjectName = customer.ObjectName,
                Phone = customer.Phone,
                Email = customer.Email,
                Fax = customer.Fax,
                TotalSpend = customer.TotalSpend,
                LastOrderDate = customer.LastOrderDate,
                ShippingAddress = customer.ShippingAddress != null
                    ? $"{customer.ShippingAddress.Street}, {customer.ShippingAddress.City}, {customer.ShippingAddress.StateProvince}, {customer.ShippingAddress.Country}, {customer.ShippingAddress.ZipPostalCode}"
                    : null,
                BillingAddress = customer.BillingAddress != null
                    ? $"{customer.BillingAddress.Street}, {customer.BillingAddress.City}, {customer.BillingAddress.StateProvince}, {customer.BillingAddress.Country}, {customer.BillingAddress.ZipPostalCode}"
                    : null,
                CompanyName = customer.CompanyName,
                Website = customer.Website
            };
        }

        public async Task<CustomerDto> CreateAsync(CreateCustomerDto dto)
        {
            var customer = new Customer
            {
                ObjectName = dto.ObjectName,
                Phone = dto.Phone,
                Email = dto.Email,
                Fax = dto.Fax,
                BillingAddressID = dto.BillingAddressID,
                ShippingAddressID = dto.ShippingAddressID,
                CustomerTypeID = dto.CustomerTypeID,
                ObjectTypeID = dto.ObjectTypeID,
                CreatedBy = dto.CreatedBy,
                UpdatedBy = dto.CreatedBy,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                IsActive = true
            };

            await _repo.CreateAsync(customer);

            return new CustomerDto
            {
                ObjectID = customer.ObjectID,
                ObjectName = customer.ObjectName,
                Phone = customer.Phone,
                Email = customer.Email,
                Fax = customer.Fax,
                TotalSpend = customer.TotalSpend,
                LastOrderDate = customer.LastOrderDate
            };
        }
    }
}
