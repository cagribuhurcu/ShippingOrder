using FluentValidation;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.CreateCarrierConfiguration
{
    public sealed class CreateCarrierConfigurationCommandValidator : AbstractValidator<CreateCarrierConfigurationCommand>
    {
        public CreateCarrierConfigurationCommandValidator()
        {
            RuleFor(x => x.CarrierId)
                .GreaterThan(0)
                .WithMessage("Kargo firması seçilmelidir. Taşıyıcı ID 0'dan büyük olmalıdır.");

            RuleFor(x => x.CarrierMinDesi)
                .GreaterThanOrEqualTo(1)
                .WithMessage("Min Desi değeri en az 1 olmalıdır.")
                .LessThan(x => x.CarrierMaxDesi)
                .WithMessage("Min Desi, Max Desi'den küçük olmalıdır.");

            RuleFor(x => x.CarrierMaxDesi)
                .GreaterThan(0)
                .WithMessage("Max Desi değeri 0'dan büyük olmalıdır.")
                .GreaterThan(x => x.CarrierMinDesi)
                .WithMessage("Max Desi, Min Desi'den büyük olmalıdır.");

            RuleFor(x => x.CarrierCost)
                .GreaterThan(0)
                .WithMessage("Kargo maliyeti 0'dan büyük olmalıdır.");
        }
    }
}
