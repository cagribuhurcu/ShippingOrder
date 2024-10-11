namespace ShippingOrderProject.Application.Models
{
    public class CarrierConfigurationDTO
    {
        public int Id { get; set; }
        public int CarrierMinDesi { get; set; }
        public int CarrierMaxDesi { get; set; }
        public decimal CarrierCost { get; set; }
    }
}
