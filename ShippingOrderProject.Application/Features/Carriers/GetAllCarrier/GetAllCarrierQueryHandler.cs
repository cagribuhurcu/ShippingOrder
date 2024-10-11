using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Application.Models;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;

namespace ShippingOrderProject.Application.Features.Carriers.GetAllCarrier
{
    internal sealed class GetAllCarriersQueryHandler : IRequestHandler<GetAllCarriersQuery, Result<List<CarrierDTO>>>
    {
        private readonly ICarrierRepository _carrierRepository;
        private readonly IMapper _mapper;

        public GetAllCarriersQueryHandler(ICarrierRepository carrierRepository, IMapper mapper)
        {
            _carrierRepository = carrierRepository;
            _mapper = mapper;
        }

        public async Task<Result<List<CarrierDTO>>> Handle(GetAllCarriersQuery request, CancellationToken cancellationToken)
        {
            var carriers = await _carrierRepository.GetAll()
                .Include(c => c.CarrierConfigurations)
                .ToListAsync(cancellationToken);

            var carrierDTOs = _mapper.Map<List<CarrierDTO>>(carriers);

            if (carrierDTOs == null || !carrierDTOs.Any())
            {
                return Result<List<CarrierDTO>>.Failure("Hiçbir taşıyıcı bulunamadı.");
            }

            return Result<List<CarrierDTO>>.Succeed(carrierDTOs);
        }
    }
}
