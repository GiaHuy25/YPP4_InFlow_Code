using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Manu.Models
{
    [Table("Products")]
    public class Product
    {
        [Key]
        public int ProductID { get; set; }

        [Required]
        public int ProductCategoryID { get; set; }

        [Required]
        public int MeasureUnitID { get; set; }

        [Required]
        public int ProductTypeID { get; set; }

        [Required, MaxLength(255)]
        public string ProductName { get; set; } = string.Empty;

        [MaxLength(50)]
        public string? Barcode { get; set; }

        public string? ProductImg { get; set; }
        public string? ProductDescription { get; set; }

        [Required]
        public int AvailableStock { get; set; } = 0;

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal UnitCost { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal? ProductLength { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal? Width { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal? Height { get; set; }

        [Column(TypeName = "decimal(10,2)")]
        public decimal? ProductWeight { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        [Required]
        public int CreatedBy { get; set; }

        [Required]
        public int UpdatedBy { get; set; }

        public bool IsActive { get; set; } = true;
    }
}
