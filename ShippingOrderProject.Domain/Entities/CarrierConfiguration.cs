using ShippingOrderProject.Domain.Abstraction;

namespace ShippingOrderProject.Domain.Entities
{
    public sealed class CarrierConfiguration : Entity
    {
        public int CarrierId { get; set; }  // İlgili kargo firması ID'si
        public Carrier Carrier { get; set; } = null!;  // İlgili kargo firması
        public int CarrierMinDesi { get; set; }  // Minimum desi aralığı
        public int CarrierMaxDesi { get; set; }  // Maksimum desi aralığı
        public decimal CarrierCost { get; set; }  // Bu desi aralığı için maliyet
    }
}
