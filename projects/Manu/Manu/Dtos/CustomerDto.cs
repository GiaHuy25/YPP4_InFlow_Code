namespace Manu.Dtos
{
    public class CustomerDto
    {
        public int ObjectID { get; set; }
        public string ObjectName { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? BillingAddress { get; set; }
        public string? ShippingAddress { get; set; }
        public string? Fax { get; set; }
        public decimal TotalSpend { get; set; }
        public DateTime? LastOrderDate { get; set; }
        public string? CompanyName { get; set; } 
        public string? Website { get; set; }
    }
}
