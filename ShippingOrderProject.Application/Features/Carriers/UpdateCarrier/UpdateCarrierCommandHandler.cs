using AutoMapper;
using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.Carriers.UpdateCarrier
{
    internal sealed class UpdateCarrierCommandHandler : IRequestHandler<UpdateCarrierCommand, Result<string>>
    {
        private readonly ICarrierRepository _carrierRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public UpdateCarrierCommandHandler(ICarrierRepository carrierRepository, IUnitOfWork unitOfWork, IMapper mapper)
        {
            _carrierRepository = carrierRepository;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<Result<string>> Handle(UpdateCarrierCommand request, CancellationToken cancellationToken)
        {
            var carrier = await _carrierRepository.GetByIdAsync(request.Id);
            if (carrier == null)
            {
                return Result<string>.Failure("Taşıyıcı bulunamadı.");
            }

            _mapper.Map(request, carrier);

            _carrierRepository.Update(carrier);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed("Taşıyıcı başarıyla güncellendi.");
        }
    }
}
