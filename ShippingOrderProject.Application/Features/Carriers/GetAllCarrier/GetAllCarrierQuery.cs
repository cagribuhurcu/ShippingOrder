using MediatR;
using ShippingOrderProject.Application.Models;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Carriers.GetAllCarrier
{
    public sealed record class GetAllCarriersQuery() : IRequest<Result<List<CarrierDTO>>>;
}
