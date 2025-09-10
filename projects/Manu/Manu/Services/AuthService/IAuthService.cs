using Manu.Dtos;

namespace Manu.Services.AuthService
{
    public interface IAuthService
    {
        Task<AuthResponseDto> RegisterAsync(RegisterDto dto);
        Task<AuthResponseDto> LoginAsync(LoginDto dto);
        Task<AuthResponseDto> ForgotPasswordAsync(ForgotPasswordDto dto);
        Task<AuthResponseDto> ResetPasswordAsync(ResetPasswordDto dto);
        Task<AuthResponseDto> VerifyResetCodeAsync(VerifyResetCodeDto dto);
        Task<AccountDto?> GetAccountByEmailAsync(string email);
        Task<IEnumerable<AccountDto>> GetAllAccountsAsync();
    }
}
