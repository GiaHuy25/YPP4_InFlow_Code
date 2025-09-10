using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("SaleOrderPickItem")]
    public class SalesOrderPickItem
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PickItemID { get; set; }

        [Required] public int PickID { get; set; }
        [Required] public int ProductID { get; set; }
        [Required] public int StockLocationID { get; set; }
        public int? SubLocationID { get; set; }

        [Required] public int Quantity { get; set; }
        [Column(TypeName = "date")] public DateTime? PickDate { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        [Required] public int CreatedBy { get; set; }
        [Required] public int UpdatedBy { get; set; }
        public bool IsActive { get; set; } = true;

        // Navigation
        public SalesOrderPick? Pick { get; set; }
    }
}
