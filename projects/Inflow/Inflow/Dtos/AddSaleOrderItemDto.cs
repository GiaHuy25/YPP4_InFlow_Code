namespace Inflow.Dtos
{
    public class AddSaleOrderItemDto
    {
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
