using ShippingOrderProject.Domain.Abstraction;

namespace ShippingOrderProject.Domain.Entities
{
    public sealed class Carrier : Entity
    {
        public string CarrierName { get; set; } = string.Empty;  // Kargo firmasının adı
        public bool CarrierIsActive { get; set; }  // Kargo firmasının aktif olup olmadığı
        public int CarrierPlusDesiCost { get; set; }  // Ekstra desi başına maliyet
        public int CarrierConfigurationId { get; set; }  // İlgili CarrierConfiguration'un ID'si
        public ICollection<Order> Orders { get; set; } = new List<Order>();  // Carrier'ın ilişkili olduğu siparişler
        public ICollection<CarrierConfiguration> CarrierConfigurations { get; set; } = new List<CarrierConfiguration>();  // Carrier'ın ilişkili olduğu konfigürasyonlar
    }
}
