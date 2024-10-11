using FluentValidation;

namespace ShippingOrderProject.Application.Features.Carriers.UpdateCarrier
{
    public sealed class UpdateCarrierCommandValidator : AbstractValidator<UpdateCarrierCommand>
    {
        public UpdateCarrierCommandValidator()
        {
            RuleFor(x => x.Id)
                .GreaterThan(0)
                .WithMessage("Güncelleme için geçerli bir ID girilmelidir. ID 0'dan büyük olmalıdır.");

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

            RuleFor(x => x.CarrierPlusDesiCost)
                .GreaterThanOrEqualTo(0)
                .WithMessage("Ekstra desi maliyeti negatif olamaz.");
        }
    }
}
