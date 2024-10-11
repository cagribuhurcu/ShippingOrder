using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.Context;

namespace ShippingOrderProject.Infrastructure.Repositories
{
    internal sealed class CarrierRepository : Repository<Carrier, ApplicationDbContext>, ICarrierRepository
    {
        public CarrierRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
