using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.Orders.CreateOrder
{
    internal sealed class CreateOrderCommandHandler : IRequestHandler<CreateOrderCommand, Result<string>>
    {
        private readonly IOrderRepository _orderRepository;
        private readonly ICarrierRepository _carrierRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CreateOrderCommandHandler(
            IOrderRepository orderRepository,
            ICarrierRepository carrierRepository,
            IUnitOfWork unitOfWork,
            IMapper mapper)
        {
            _orderRepository = orderRepository;
            _carrierRepository = carrierRepository;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<Result<string>> Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            var carriers = await _carrierRepository.GetAll()
                .Include(c => c.CarrierConfigurations)
                .ToListAsync(cancellationToken);

            if (!carriers.Any())
            {
                return Result<string>.Failure("Taşıyıcı bulunamadı.");
            }

            var suitableCarrierConfigs = carriers.SelectMany(c => c.CarrierConfigurations)
                .Where(cc => request.OrderDesi >= cc.CarrierMinDesi && request.OrderDesi <= cc.CarrierMaxDesi)
                .OrderBy(cc => cc.CarrierCost)
                .ToList();

            CarrierConfiguration selectedCarrierConfig;

            if (suitableCarrierConfigs.Any())
            {
                selectedCarrierConfig = suitableCarrierConfigs.First();
            }
            else
            {
                var closestCarrierConfig = carriers.SelectMany(c => c.CarrierConfigurations)
                    .OrderBy(cc => Math.Abs(request.OrderDesi - cc.CarrierMinDesi))
                    .FirstOrDefault();

                if (closestCarrierConfig == null)
                {
                    return Result<string>.Failure("Taşıyıcı konfigürasyonu bulunamadı.");
                }

                var desiDifference = request.OrderDesi - closestCarrierConfig.CarrierMaxDesi;
                var extraCost = closestCarrierConfig.Carrier.CarrierPlusDesiCost * desiDifference;
                selectedCarrierConfig = closestCarrierConfig;
                selectedCarrierConfig.CarrierCost += extraCost;
            }

            var order = _mapper.Map<Order>(request);
            order.CarrierId = selectedCarrierConfig.CarrierId;
            order.OrderCarrierCost = selectedCarrierConfig.CarrierCost;
            order.OrderDate = DateTime.Now;

            await _orderRepository.AddAsync(order);

            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed($"{selectedCarrierConfig.Carrier.CarrierName} taşıyıcısında {order.OrderCarrierCost}₺ tutarında sipariş başarıyla oluşturuldu.");
        }
    }
}
