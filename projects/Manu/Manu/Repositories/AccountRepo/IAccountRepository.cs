using Manu.Models;
using Manu.Repositories.BaseRepo;
namespace Manu.Repositories.AccountRepo
{
    public interface IAccountRepository : IGenericRepository<Account>
    {
        Task<Account?> GetByEmailAsync(string email);
        Task<Account?> GetByPhoneAsync(string phone);
        Task<Account?> GetByResetCodeAsync(string email, string code);
        Task CreateAsync(Account account);
        Task UpdateAsync(Account account);
    }
}
