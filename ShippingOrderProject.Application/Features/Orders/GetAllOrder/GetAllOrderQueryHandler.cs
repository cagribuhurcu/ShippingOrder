using MediatR;
using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;

namespace ShippingOrderProject.Application.Features.Orders.GetAllOrder
{
    internal sealed class GetAllOrderQueryHandler : IRequestHandler<GetAllOrderQuery, Result<List<Order>>>
    {
        private readonly IOrderRepository _orderRepository;

        public GetAllOrderQueryHandler(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }
        public async Task<Result<List<Order>>> Handle(GetAllOrderQuery request, CancellationToken cancellationToken)
        {
            List<Order> orders = await _orderRepository.GetAll().ToListAsync(cancellationToken);

            if (orders == null || !orders.Any())
            {
                return Result<List<Order>>.Failure("Sipariş bulunamadı.");
            }

            return Result<List<Order>>.Succeed(orders);
        }
    }
}
