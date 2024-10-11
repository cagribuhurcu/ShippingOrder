using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Orders.DeleteOrderById
{
    public sealed record DeleteOrderByIdCommand(int Id) : IRequest<Result<string>>;
}
