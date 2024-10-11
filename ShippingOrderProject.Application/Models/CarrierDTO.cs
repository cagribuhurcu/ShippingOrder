namespace ShippingOrderProject.Application.Models
{
    public class CarrierDTO
    {
        public int Id { get; set; }
        public string CarrierName { get; set; } = string.Empty;
        public bool CarrierIsActive { get; set; }
        public decimal CarrierPlusDesiCost { get; set; }
        public List<CarrierConfigurationDTO>? CarrierConfigurations { get; set; }
    }
}
