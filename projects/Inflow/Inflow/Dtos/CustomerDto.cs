namespace Inflow.Dtos
{
    public class CustomerDto
    {
        public int ObjectID { get; set; }
        public string ObjectName { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }
        public string? Fax { get; set; }
        public decimal TotalSpend { get; set; }
        public DateTime? LastOrderDate { get; set; }
    }
}
