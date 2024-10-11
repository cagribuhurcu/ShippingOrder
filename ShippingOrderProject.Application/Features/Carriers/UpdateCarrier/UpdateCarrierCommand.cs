using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Carriers.UpdateCarrier
{
    public sealed record UpdateCarrierCommand(
        int Id,
        string CarrierName,
        bool CarrierIsActive,
        decimal CarrierPlusDesiCost) : IRequest<Result<string>>;
}
