namespace Inflow.Dtos
{
    public class CustomerDto
    {
        public int ObjectID { get; set; }
        public string ObjectName { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public decimal TotalSpend { get; set; }
        public DateTime? LastOrderDate { get; set; }
    }
}
