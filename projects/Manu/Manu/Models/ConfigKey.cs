using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("ConfigKey")]
    public class ConfigKey
    {
        [Key]
        public int ConfigKeyID { get; set; }

        [Required, MaxLength(100)]
        public string KeyName { get; set; } = string.Empty;

        [MaxLength(50)]
        public string? KeyValue { get; set; }
    }
}
