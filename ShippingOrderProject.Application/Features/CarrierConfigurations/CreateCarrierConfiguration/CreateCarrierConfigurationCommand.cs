using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.CreateCarrierConfiguration
{
    public sealed record CreateCarrierConfigurationCommand(
        int CarrierId,
        int CarrierMinDesi,
        int CarrierMaxDesi,
        decimal CarrierCost) : IRequest<Result<string>>;
}
