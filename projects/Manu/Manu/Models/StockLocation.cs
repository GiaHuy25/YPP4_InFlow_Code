using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("StockLocation")]
    public class StockLocation
    {
        [Key]
        public int StockLocationID { get; set; }

        [Required, MaxLength(100)]
        public string StockLocationName { get; set; } = string.Empty;

        [MaxLength(255)]
        public string? Address { get; set; }
    }
}
