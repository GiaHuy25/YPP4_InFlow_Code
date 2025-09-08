using System.ComponentModel.DataAnnotations;

namespace Inflow.Models
{
    public class SalesOrder
    {
        [Key]
        public int SaleOrderID { get; set; }
        public string SaleOrderCode { get; set; } = null!;
    }
}
