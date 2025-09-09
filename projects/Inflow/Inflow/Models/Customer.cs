using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("Entity")]
    public class Customer
    {
        [Key]
        public int ObjectID { get; set; }

        [Required, MaxLength(255)]
        public string ObjectName { get; set; } = string.Empty;

        [MaxLength(20)]
        public string? Phone { get; set; }

        [MaxLength(50)]
        public string? Email { get; set; }

        [MaxLength(50)]
        public string? Fax { get; set; }

        public int BillingAddressID { get; set; }
        public int ShippingAddressID { get; set; }
        public int CustomerTypeID { get; set; }
        public int ObjectTypeID { get; set; }

        public decimal TotalSpend { get; set; }
        public DateTime? LastOrderDate { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }
        public bool IsActive { get; set; } = true; 
    }
}
