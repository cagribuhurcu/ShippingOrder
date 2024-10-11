using MediatR;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Features.Carriers.DeleteCarrierById
{
    public sealed record DeleteCarrierByIdCommand(int Id) : IRequest<Result<string>>;
}
