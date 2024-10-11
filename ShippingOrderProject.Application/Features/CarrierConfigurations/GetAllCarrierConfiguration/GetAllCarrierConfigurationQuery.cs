using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.GetAllCarrierConfiguration
{
    public sealed record class GetAllCarrierConfigurationsQuery() : IRequest<Result<List<CarrierConfiguration>>>;
}
