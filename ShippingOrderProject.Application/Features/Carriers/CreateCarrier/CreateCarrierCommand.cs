using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Carriers.CreateCarrier
{
    public sealed record CreateCarrierCommand(
        string CarrierName, 
        bool CarrierIsActive, 
        int CarrierPlusDesiCost) : IRequest<Result<string>>;
}
