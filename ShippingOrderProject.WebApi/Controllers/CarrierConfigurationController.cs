using MediatR;
using Microsoft.AspNetCore.Mvc;
using ShippingOrderProject.Application.Features.CarrierConfigurations.CreateCarrierConfiguration;
using ShippingOrderProject.Application.Features.CarrierConfigurations.DeleteCarrierConfigurationById;
using ShippingOrderProject.Application.Features.CarrierConfigurations.GetAllCarrierConfiguration;
using ShippingOrderProject.Application.Features.CarrierConfigurations.UpdateCarrierConfiguration;
using ShippingOrderProject.WebApi.Abstractions;

namespace ShippingOrderProject.WebApi.Controllers
{
    public class CarrierConfigurationController : ApiController
    {
        public CarrierConfigurationController(IMediator mediator) : base(mediator)
        {
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new GetAllCarrierConfigurationsQuery(), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateCarrierConfigurationCommand request, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(request, cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpPut]
        public async Task<IActionResult> Update(UpdateCarrierConfigurationCommand request, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(request, cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new DeleteCarrierConfigurationByIdCommand(id), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }
    }
}
