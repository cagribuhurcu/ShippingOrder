using ShippingOrderProject.Domain.Abstraction;

namespace ShippingOrderProject.Domain.Entities
{
    public class CarrierReport : Entity
    {
        public int CarrierId { get; set; }
        public decimal CarrierCost { get; set; }
        public DateTime CarrierReportDate { get; set; }

        public Carrier Carrier { get; set; } = null!;
    }
}
