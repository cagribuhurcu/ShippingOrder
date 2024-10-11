using MediatR;
using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.GetAllCarrierConfiguration
{
    internal sealed class GetAllCarrierConfigurationsQueryHandler : IRequestHandler<GetAllCarrierConfigurationsQuery, Result<List<CarrierConfiguration>>>
    {
        private readonly ICarrierConfigurationRepository _carrierConfigurationRepository;

        public GetAllCarrierConfigurationsQueryHandler(ICarrierConfigurationRepository carrierConfigurationRepository)
        {
            _carrierConfigurationRepository = carrierConfigurationRepository;
        }

        public async Task<Result<List<CarrierConfiguration>>> Handle(GetAllCarrierConfigurationsQuery request, CancellationToken cancellationToken)
        {
            var carrierConfigurations = await _carrierConfigurationRepository.GetAll().ToListAsync(cancellationToken);

            if (carrierConfigurations == null || !carrierConfigurations.Any())
            {
                return Result<List<CarrierConfiguration>>.Failure("Hiçbir taşıyıcı konfigürasyonu bulunamadı.");
            }

            return Result<List<CarrierConfiguration>>.Succeed(carrierConfigurations);
        }
    }
}
