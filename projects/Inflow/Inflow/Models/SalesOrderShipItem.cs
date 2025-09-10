using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("SaleOrderShipItem")]
    public class SalesOrderShipItem
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ShipItemID { get; set; }

        [Required] public int ShipID { get; set; }
        [Required] public int ProductID { get; set; }
        [Required] public int Quantity { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        [Required] public int CreatedBy { get; set; }
        [Required] public int UpdatedBy { get; set; }
        public bool IsActive { get; set; } = true;

        public SalesOrderShip? Ship { get; set; }
    }
}
