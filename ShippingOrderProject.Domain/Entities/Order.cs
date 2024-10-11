using ShippingOrderProject.Domain.Abstraction;

namespace ShippingOrderProject.Domain.Entities
{
    public sealed class Order : Entity
    {
        public int CarrierId { get; set; }  // İlgili kargo firması ID'si
        public Carrier Carrier { get; set; } = null!;  // İlgili kargo firması
        public int OrderDesi { get; set; }  // Sipariş desi bilgisi
        public DateTime OrderDate { get; set; }  // Sipariş tarihi
        public decimal OrderCarrierCost { get; set; }  // Kargo maliyeti
    }
}
