using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Orders.CreateOrder
{
    public sealed record CreateOrderCommand(int OrderDesi) : IRequest<Result<string>>;
}
