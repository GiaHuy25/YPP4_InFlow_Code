using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("Currency")]
    public class Currency
    {
        [Key]
        public int CurrencyID { get; set; }

        [Required, MaxLength(10)]
        public string Code { get; set; } = string.Empty;

        [MaxLength(50)]
        public string? Name { get; set; }
    }
}
