using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.Context;

namespace ShippingOrderProject.Infrastructure.Repositories
{
    internal sealed class CarrierConfigurationRepository : Repository<CarrierConfiguration, ApplicationDbContext>, ICarrierConfigurationRepository
    {
        public CarrierConfigurationRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
