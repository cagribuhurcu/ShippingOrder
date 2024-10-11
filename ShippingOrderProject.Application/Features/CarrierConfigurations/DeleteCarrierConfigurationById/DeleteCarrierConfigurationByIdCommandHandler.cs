using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.CarrierConfigurations.DeleteCarrierConfigurationById
{
    internal sealed class DeleteCarrierConfigurationByIdCommandHandler : IRequestHandler<DeleteCarrierConfigurationByIdCommand, Result<string>>
    {
        private readonly ICarrierConfigurationRepository _carrierConfigurationRepository;
        private readonly IUnitOfWork _unitOfWork;

        public DeleteCarrierConfigurationByIdCommandHandler(ICarrierConfigurationRepository carrierConfigurationRepository, IUnitOfWork unitOfWork)
        {
            _carrierConfigurationRepository = carrierConfigurationRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<string>> Handle(DeleteCarrierConfigurationByIdCommand request, CancellationToken cancellationToken)
        {
            var carrierConfiguration = await _carrierConfigurationRepository.GetByIdAsync(request.Id);
            if (carrierConfiguration == null)
            {
                return Result<string>.Failure("Taşıyıcı konfigürasyonu bulunamadı.");
            }

            _carrierConfigurationRepository.Delete(carrierConfiguration);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed($"{request.Id} ID'li taşıyıcı konfigürasyonu başarıyla silindi.");
        }
    }
}
