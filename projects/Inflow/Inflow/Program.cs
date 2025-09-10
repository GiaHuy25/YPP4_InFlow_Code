using Inflow;
using Inflow.Config;
using Inflow.Repositories.AccountRepo;
using Inflow.Repositories.CustomerRepo;
using Inflow.Repositories.ProductRepo;
using Inflow.Repositories.SaleOrderItemRepo;
using Inflow.Repositories.SalesOrderRepo;
using Inflow.Services.AuthService;
using Inflow.Services.CustomerService;
using Inflow.Services.EmailService;
using Inflow.Services.ProductService;
using Inflow.Services.SaleOrderItemService;
using Inflow.Services.SalesOrderService;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization.Metadata;
internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // ======================
        // Database (SQL Server)
        // ======================
        builder.Services.AddDbContext<AppDbContext>(options =>
            options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

        // ======================
        // Dependency Injection
        // ======================
        builder.Services.Configure<SmtpSettings>(builder.Configuration.GetSection("SmtpSettings"));

        builder.Services.AddScoped<IAccountRepository, AccountRepository>();
        builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();
        builder.Services.AddScoped<IProductRepository, ProductRepository>();
        builder.Services.AddScoped<ISaleOrderItemRepository, SaleOrderItemRepository>();
        builder.Services.AddScoped<ISalesOrderRepository, SalesOrderRepository>();

        builder.Services.AddScoped<IEmailService, EmailService>();
        builder.Services.AddScoped<IAuthService, AuthService>();
        builder.Services.AddScoped<ICustomerService, CustomerService>();
        builder.Services.AddScoped<IProductService, ProductService>();
        builder.Services.AddScoped<ISaleOrderItemService, SaleOrderItemService>();
        builder.Services.AddScoped<ISalesOrderService, SalesOrderService>();

        // ======================
        // Controllers & Swagger
        // ======================
        builder.Services.AddControllers()
        .AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.TypeInfoResolver = new DefaultJsonTypeInfoResolver();
            options.JsonSerializerOptions.PropertyNamingPolicy = null;
        });

        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        // ======================
        // Middleware
        // ======================
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();

            app.MapGet("/", () => Results.Redirect("/swagger"));
        }

        app.UseHttpsRedirection();
        app.UseAuthorization();
        app.MapControllers();
        app.Run();
    }
}