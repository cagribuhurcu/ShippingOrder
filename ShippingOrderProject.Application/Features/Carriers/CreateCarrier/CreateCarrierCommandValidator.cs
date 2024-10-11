using FluentValidation;

namespace ShippingOrderProject.Application.Features.Carriers.CreateCarrier
{
    public sealed class CreateCarrierCommandValidator : AbstractValidator<CreateCarrierCommand>
    {
        public CreateCarrierCommandValidator()
        {
            RuleFor(x => x.CarrierName)
                .NotEmpty()
                .WithMessage("Taşıyıcı adı boş olamaz.")
                .MinimumLength(3)
                .WithMessage("Taşıyıcı adı en az 3 karakter olmalıdır.")
                .MaximumLength(50)
                .WithMessage("Taşıyıcı adı en fazla 50 karakter olabilir.");

            RuleFor(x => x.CarrierIsActive)
                .NotNull()
                .WithMessage("Taşıyıcı aktif durumu belirtilmelidir.");

            // CarrierPlusDesiCost validasyonu
            RuleFor(x => x.CarrierPlusDesiCost)
                .GreaterThanOrEqualTo(0)
                .WithMessage("Ekstra desi maliyeti negatif olamaz.");
        }
    }
}
