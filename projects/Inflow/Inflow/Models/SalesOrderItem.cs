using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("SaleOrderItem")]
    public class SalesOrderItem
    {
        [Key]
        public int SaleOrderItemID { get; set; }

        [Required]
        public int SaleOrderID { get; set; }

        [Required]
        public int ProductID { get; set; }

        [Required]
        public int MeasureUnitID { get; set; }

        public int? CustomFieldID { get; set; }

        [Required]
        public int Quantity { get; set; }

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal UnitPrice { get; set; }

        [Column(TypeName = "decimal(5,2)")]
        public decimal? DiscountPercent { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? DiscountAmount { get; set; }

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal Subtotal { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        [Required]
        public int CreatedBy { get; set; }

        [Required]
        public int UpdatedBy { get; set; }

        public bool IsActive { get; set; } = true;
        public Product Product { get; set; } = null!;
        public SalesOrder SaleOrder { get; set; } = null!;
    }
}
