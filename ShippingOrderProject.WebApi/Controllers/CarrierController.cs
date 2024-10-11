using MediatR;
using Microsoft.AspNetCore.Mvc;
using ShippingOrderProject.Application.Features.Carriers.CreateCarrier;
using ShippingOrderProject.Application.Features.Carriers.DeleteCarrierById;
using ShippingOrderProject.Application.Features.Carriers.GetAllCarrier;
using ShippingOrderProject.Application.Features.Carriers.UpdateCarrier;
using ShippingOrderProject.WebApi.Abstractions;

namespace ShippingOrderProject.WebApi.Controllers
{
    public class CarrierController : ApiController
    {
        public CarrierController(IMediator mediator) : base(mediator)
        {
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new GetAllCarriersQuery(), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateCarrierCommand request, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(request, cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpPut]
        public async Task<IActionResult> Update(UpdateCarrierCommand request, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(request, cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new DeleteCarrierByIdCommand(id), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }
    }
}
