using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.Carriers.DeleteCarrierById
{
    internal sealed class DeleteCarrierByIdCommandHandler : IRequestHandler<DeleteCarrierByIdCommand, Result<string>>
    {
        private readonly ICarrierRepository _carrierRepository;
        private readonly IUnitOfWork _unitOfWork;

        public DeleteCarrierByIdCommandHandler(ICarrierRepository carrierRepository, IUnitOfWork unitOfWork)
        {
            _carrierRepository = carrierRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<string>> Handle(DeleteCarrierByIdCommand request, CancellationToken cancellationToken)
        {
            var carrier = await _carrierRepository.GetByIdAsync(request.Id);
            if (carrier == null)
            {
                return Result<string>.Failure("Taşıyıcı bulunamadı.");
            }

            _carrierRepository.Delete(carrier);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed($"{request.Id} ID'li taşıyıcı başarıyla silindi.");
        }
    }
}
