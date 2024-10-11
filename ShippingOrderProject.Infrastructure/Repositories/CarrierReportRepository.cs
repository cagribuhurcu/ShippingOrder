using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.Context;

namespace ShippingOrderProject.Infrastructure.Repositories
{
    internal sealed class CarrierReportRepository : Repository<CarrierReport, ApplicationDbContext>, ICarrierReportRepository
    {
        public CarrierReportRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
