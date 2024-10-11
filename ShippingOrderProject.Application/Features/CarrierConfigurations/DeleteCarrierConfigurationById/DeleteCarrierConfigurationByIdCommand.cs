using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.DeleteCarrierConfigurationById
{
    public sealed record DeleteCarrierConfigurationByIdCommand(int Id) : IRequest<Result<string>>;
}
