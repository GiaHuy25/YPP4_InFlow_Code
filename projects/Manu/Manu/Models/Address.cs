using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("Address")]
    public class Address
    {
        [Key]
        public int AddressID { get; set; }
        public string? PreSavedName { get; set; }
        public string Street { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string? StateProvince { get; set; }
        public string Country { get; set; } = string.Empty;
        public string ZipPostalCode { get; set; } = string.Empty;
        public int AddressTypeID { get; set; }
        public string? Remarks { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }
        public bool IsActive { get; set; }
    }
}
