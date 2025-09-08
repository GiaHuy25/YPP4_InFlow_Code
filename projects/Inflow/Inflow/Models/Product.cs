using System.ComponentModel.DataAnnotations;

namespace Inflow.Models
{
    public class Product
    {
        [Key]
        public int ProductID { get; set; }
        public string ProductName { get; set; } = null!;
        public decimal UnitCost { get; set; }
        public int AvailableStock { get; set; }
        public bool IsActive { get; set; }
    }
}
