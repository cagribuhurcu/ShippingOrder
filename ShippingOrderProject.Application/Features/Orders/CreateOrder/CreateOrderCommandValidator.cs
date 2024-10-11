using FluentValidation;

namespace ShippingOrderProject.Application.Features.Orders.CreateOrder
{
    public sealed class CreateOrderCommandValidator : AbstractValidator<CreateOrderCommand>
    {
        public CreateOrderCommandValidator()
        {
            RuleFor(x => x.OrderDesi)
                .GreaterThan(0)
                .WithMessage("Sipariş desi değeri 0'dan büyük olmalıdır.")
                .LessThanOrEqualTo(100)
                .WithMessage("Sipariş desi değeri 100'den büyük olamaz.");
        }
    }
}
