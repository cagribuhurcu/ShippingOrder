using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Application.Features.Orders.GetAllOrder
{
    public sealed record class GetAllOrderQuery() : IRequest<Result<List<Order>>>;
}
