using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("OrderRequest")]
    public class OrderRequest
    {
        [Key]
        public int OrderRequestID { get; set; }

        [Required, MaxLength(20)]
        public string RequestCode { get; set; } = string.Empty;

        public DateTime RequestDate { get; set; } = DateTime.Now;

        [MaxLength(255)]
        public string? Notes { get; set; }
    }
}
