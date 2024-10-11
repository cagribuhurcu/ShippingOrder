using AutoMapper;
using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.Carriers.CreateCarrier
{
    internal sealed class CreateCarrierCommandHandler : IRequestHandler<CreateCarrierCommand, Result<string>>
    {
        private readonly ICarrierRepository _carrierRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CreateCarrierCommandHandler(ICarrierRepository carrierRepository, IUnitOfWork unitOfWork, IMapper mapper)
        {
            _carrierRepository = carrierRepository;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<Result<string>> Handle(CreateCarrierCommand request, CancellationToken cancellationToken)
        {
            var carrier = _mapper.Map<Carrier>(request);
            await _carrierRepository.AddAsync(carrier);

            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed("Taşıyıcı başarıyla oluşturuldu");
        }
    }
}
