using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("PaymentTerm")]
    public class PaymentTerm
    {
        [Key]
        public int PaymentTermID { get; set; }

        [Required, MaxLength(100)]
        public string TermName { get; set; } = string.Empty;

        public int? DaysDue{ get; set; }
    }
}
