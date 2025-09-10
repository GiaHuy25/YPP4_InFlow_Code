using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("SaleOrderShip")]
    public class SalesOrderShip
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ShipID { get; set; }

        [Required] public int SaleOrderID { get; set; }

        [Required, Column(TypeName = "date")]
        public DateTime ShipDate { get; set; }

        [Required] public int ShippedBy { get; set; }

        public string? Carrier { get; set; }
        public string? TrackingNumber { get; set; }
        public string? Remarks { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        [Required] public int CreatedBy { get; set; }
        [Required] public int UpdatedBy { get; set; }
        public bool IsActive { get; set; } = true;

        // Navigation
        public SalesOrder? SaleOrder { get; set; }
        public ICollection<SalesOrderShipItem>? ShipItems { get; set; }
    }
}
