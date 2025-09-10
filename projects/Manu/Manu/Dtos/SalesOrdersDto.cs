namespace Manu.Dtos
{
    public class SalesOrdersDto
    {
        public string SaleOrderCode { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public string Customer { get; set; } = string.Empty;
        public DateTime OrderDate { get; set; }
        public string location { get; set; } = string.Empty;
        public decimal Total { get; set; }
        public decimal Balance { get; set; }
    }
}
