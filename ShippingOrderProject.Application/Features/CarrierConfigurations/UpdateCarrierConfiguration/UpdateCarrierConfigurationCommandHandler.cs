using AutoMapper;
using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.UpdateCarrierConfiguration
{
    internal sealed class UpdateCarrierConfigurationCommandHandler : IRequestHandler<UpdateCarrierConfigurationCommand, Result<string>>
    {
        private readonly ICarrierConfigurationRepository _carrierConfigurationRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public UpdateCarrierConfigurationCommandHandler(
            ICarrierConfigurationRepository carrierConfigurationRepository,
            IUnitOfWork unitOfWork,
            IMapper mapper)
        {
            _carrierConfigurationRepository = carrierConfigurationRepository;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<Result<string>> Handle(UpdateCarrierConfigurationCommand request, CancellationToken cancellationToken)
        {
            var carrierConfiguration = await _carrierConfigurationRepository.GetByIdAsync(request.Id);
            if (carrierConfiguration == null)
            {
                return Result<string>.Failure("Taşıyıcı konfigürasyonu bulunamadı.");
            }

            _mapper.Map(request, carrierConfiguration);

            _carrierConfigurationRepository.Update(carrierConfiguration);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed("Taşıyıcı konfigürasyonu başarıyla güncellendi.");
        }
    }
}
