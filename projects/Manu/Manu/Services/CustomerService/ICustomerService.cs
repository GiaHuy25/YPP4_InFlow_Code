using Manu.Dtos;

namespace Manu.Services.CustomerService
{
    public interface ICustomerService
    {
        Task<IEnumerable<CustomerDto>> GetAllAsync();
        Task<CustomerDto?> GetByIdAsync(int id);
        Task<CustomerDto> CreateAsync(CreateCustomerDto dto);
    }
}
