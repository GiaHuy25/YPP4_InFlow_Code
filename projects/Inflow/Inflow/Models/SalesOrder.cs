using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Inflow.Models
{
    [Table("SaleOrder")]
    public class SalesOrder
    {
        [Key]
        public int SaleOrderID { get; set; }

        [Required]
        public int OrderRequestID { get; set; }

        [Required]
        public int CustomerID { get; set; }

        [Required]
        public int StockLocationID { get; set; }

        public int? SalePersonID { get; set; }

        [Required]
        public int CurrencyID { get; set; }

        public int? PaymentTermID { get; set; }

        [Required, MaxLength(20)]
        public string SaleOrderCode { get; set; } = string.Empty;

        [Required, Column(TypeName = "date")]
        public DateTime OrderDate { get; set; }

        [Required]
        public int BillingAddressID { get; set; }

        [Required]
        public int ShippingAddressID { get; set; }

        [Required, Column(TypeName = "date")]
        public DateTime ShipByDate { get; set; }

        [Required]
        public int StatusID { get; set; }

        [Required, MaxLength(50)]
        public string PaymentStatus { get; set; } = string.Empty;

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal PaymentAmount { get; set; }

        [Column(TypeName = "decimal(5,2)")]
        public decimal? TaxRate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DueDate { get; set; }

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal Subtotal { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? Freight { get; set; }

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal Total { get; set; }

        [Required, Column(TypeName = "decimal(18,2)")]
        public decimal Balance { get; set; }

        [Required, Column(TypeName = "decimal(18,6)")]
        public decimal ExchangeRate { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        [Required]
        public int CreatedBy { get; set; }

        [Required]
        public int UpdatedBy { get; set; }

        public bool IsActive { get; set; } = true;

        [ForeignKey(nameof(CustomerID))]
        public Customer? Customer { get; set; }

        [ForeignKey(nameof(OrderRequestID))]
        public OrderRequest? OrderRequest { get; set; }

        [ForeignKey(nameof(StockLocationID))]
        public StockLocation? StockLocation { get; set; }

        [ForeignKey(nameof(SalePersonID))]
        public Account? SalePerson { get; set; }

        [ForeignKey(nameof(CurrencyID))]
        public Currency? Currency { get; set; }

        [ForeignKey(nameof(PaymentTermID))]
        public PaymentTerm? PaymentTerm { get; set; }

        [ForeignKey(nameof(BillingAddressID))]
        public Address? BillingAddress { get; set; }

        [ForeignKey(nameof(ShippingAddressID))]
        public Address? ShippingAddress { get; set; }

        [ForeignKey(nameof(StatusID))]
        public ConfigKey? Status { get; set; }
    }
}
