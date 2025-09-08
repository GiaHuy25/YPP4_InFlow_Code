using System.ComponentModel.DataAnnotations;

namespace Inflow.Models
{
    public class SalesOrderItem
    {
        [Key]
        public int SaleOrderItemID { get; set; }
        public int SaleOrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal Subtotal { get; set; }

        public Product Product { get; set; } = null!;
        public SalesOrder SaleOrder { get; set; } = null!;
    }
}
