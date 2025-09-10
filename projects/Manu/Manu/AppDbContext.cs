using Manu.Models;
using Microsoft.EntityFrameworkCore;

namespace Manu
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Account> Account { get; set; }
        public DbSet<Address> Address { get; set; }
        public DbSet<Customer> Customer { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<SalesOrder> SaleOrder { get; set; }
        public DbSet<SalesOrderItem> SaleOrderItem { get; set; }

    }
}
