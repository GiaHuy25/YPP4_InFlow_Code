using Manu.Models;
using Manu.Repositories.BaseRepo;
using Microsoft.EntityFrameworkCore;

namespace Manu.Repositories.AccountRepo
{
    public class AccountRepository : GenericRepository<Account>, IAccountRepository 
    {
        private readonly AppDbContext _context;
        public AccountRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<Account?> GetByEmailAsync(string email)
            => await _context.Account.FirstOrDefaultAsync(a => a.Email == email);

        public async Task<Account?> GetByPhoneAsync(string phone)
            => await _context.Account.FirstOrDefaultAsync(a => a.Phone == phone);

        public async Task<Account?> GetByResetCodeAsync(string email, string code)
            => await _context.Account.FirstOrDefaultAsync(a => a.Email == email && a.ResetCode == code);

    }
}
