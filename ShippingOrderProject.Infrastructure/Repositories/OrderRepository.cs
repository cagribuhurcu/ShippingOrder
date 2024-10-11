using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.Context;

namespace ShippingOrderProject.Infrastructure.Repositories
{
    internal sealed class OrderRepository : Repository<Order, ApplicationDbContext>, IOrderRepository
    {
        public OrderRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}
