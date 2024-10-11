using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.UpdateCarrierConfiguration
{
    public sealed record UpdateCarrierConfigurationCommand(
        int Id,
        int CarrierId,
        int CarrierMinDesi,
        int CarrierMaxDesi,
        decimal CarrierCost) : IRequest<Result<string>>;
}
