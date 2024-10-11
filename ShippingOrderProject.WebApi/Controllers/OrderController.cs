using MediatR;
using Microsoft.AspNetCore.Mvc;
using ShippingOrderProject.Application.Features.Orders.CreateOrder;
using ShippingOrderProject.Application.Features.Orders.DeleteOrderById;
using ShippingOrderProject.Application.Features.Orders.GetAllOrder;
using ShippingOrderProject.WebApi.Abstractions;

namespace ShippingOrderProject.WebApi.Controllers
{
    public sealed class OrderController : ApiController
    {
        public OrderController(IMediator mediator) : base(mediator)
        {
        }

        [HttpGet]
        public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new GetAllOrderQuery(), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(request, cancellationToken);
            return StatusCode(response.StatusCode, response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id, CancellationToken cancellationToken)
        {
            var response = await _mediator.Send(new DeleteOrderByIdCommand(id), cancellationToken);
            return StatusCode(response.StatusCode, response);
        }
    }
}
