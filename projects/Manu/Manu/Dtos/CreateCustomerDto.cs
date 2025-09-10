namespace Manu.Dtos
{
    public class CreateCustomerDto
    {
        public string ObjectName { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Fax { get; set; }
        public int BillingAddressID { get; set; }
        public int ShippingAddressID { get; set; }
        public int CustomerTypeID { get; set; }
        public int ObjectTypeID { get; set; }
        public int CreatedBy { get; set; }
    }
}
