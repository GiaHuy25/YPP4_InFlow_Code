using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("SaleOrderPick")]
    public class SalesOrderPick
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PickID { get; set; }

        [Required] public int SaleOrderID { get; set; }
        [Required] public int PickedBy { get; set; }
        public string? Remarks { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        [Required] public int CreatedBy { get; set; }
        [Required] public int UpdatedBy { get; set; }
        public bool IsActive { get; set; } = true;

        // Navigation
        public SalesOrder? SaleOrder { get; set; }
        public ICollection<SalesOrderPickItem>? PickItems { get; set; }
    }
}
