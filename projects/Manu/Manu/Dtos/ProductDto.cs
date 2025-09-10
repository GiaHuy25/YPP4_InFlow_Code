namespace Manu.Dtos
{
    public class ProductDto
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; } = null!;
        public decimal UnitCost { get; set; }
        public int AvailableStock { get; set; }
    }
}
