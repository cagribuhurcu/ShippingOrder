using AutoMapper;
using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.CreateCarrierConfiguration
{
    internal sealed class CreateCarrierConfigurationCommandHandler : IRequestHandler<CreateCarrierConfigurationCommand, Result<string>>
    {
        private readonly ICarrierConfigurationRepository _carrierConfigurationRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CreateCarrierConfigurationCommandHandler(
            ICarrierConfigurationRepository carrierConfigurationRepository,
            IUnitOfWork unitOfWork,
            IMapper mapper)
        {
            _carrierConfigurationRepository = carrierConfigurationRepository;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<Result<string>> Handle(CreateCarrierConfigurationCommand request, CancellationToken cancellationToken)
        {
            var carrierConfiguration = _mapper.Map<CarrierConfiguration>(request);

            await _carrierConfigurationRepository.AddAsync(carrierConfiguration);

            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed("Taşıyıcı konfigürasyonu başarıyla oluşturuldu");
        }
    }
}
