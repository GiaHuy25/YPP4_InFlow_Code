using Manu.Dtos;
using Manu.Services.AuthService;
using Microsoft.AspNetCore.Mvc;

namespace Manu.Controller
{
    [ApiController]
    [Route("api/auth")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _service;

        public AuthController(IAuthService service)
        {
            _service = service;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterDto dto)
        {
            var result = await _service.RegisterAsync(dto);

            return result.Success? Ok(result) : BadRequest(result);
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginDto dto)
        {
            var result = await _service.LoginAsync(dto);

            return result.Success ? Ok(result) : BadRequest(result);
        }

        [HttpPost("forgot-password")]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordDto dto)
        {
            var result = await _service.ForgotPasswordAsync(dto);

            return result.Success ? Ok(result) : NotFound(result);
        }

        [HttpPost("verify-resetcode")]
        public async Task<IActionResult> VerifyResetCode(VerifyResetCodeDto dto)
        {
            var result = await _service.VerifyResetCodeAsync(dto);

            return result.Success ? Ok(result) : BadRequest(result);
        }


        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordDto dto)
        {
            var result = await _service.ResetPasswordAsync(dto);

            return result.Success ? Ok(result) : BadRequest(result);
        }


        [HttpGet("accounts")]
        public async Task<IActionResult> GetAllAccounts()
        {
            var accounts = await _service.GetAllAccountsAsync();
            return Ok(accounts);
        }


        [HttpGet("accounts/{email}")]
        public async Task<IActionResult> GetAccountByEmail(string email)
        {
            var account = await _service.GetAccountByEmailAsync(email);
            return account == null ? NotFound() : Ok(account);
        }
    }
}
