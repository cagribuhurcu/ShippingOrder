using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Domain.Entities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;
using ShippingOrderProject.Application.Utilities;

namespace ShippingOrderProject.Application.Jobs
{
    public class CarrierReportJob
    {
        private readonly IOrderRepository _orderRepository;
        private readonly ICarrierReportRepository _carrierReportRepository;
        private readonly ICarrierRepository _carrierRepository;
        private readonly IUnitOfWork _unitOfWork;

        public CarrierReportJob(
            IOrderRepository orderRepository,
            ICarrierReportRepository carrierReportRepository,
            ICarrierRepository carrierRepository,
            IUnitOfWork unitOfWork)
        {
            _orderRepository = orderRepository;
            _carrierReportRepository = carrierReportRepository;
            _carrierRepository = carrierRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<string>> GenerateDailyCarrierReport(CancellationToken cancellationToken)
        {
            var groupedOrders = await _orderRepository.GetAll()
                .GroupBy(o => new { o.CarrierId, o.OrderDate.Date })
                .Select(g => new
                {
                    g.Key.CarrierId,
                    g.Key.Date,
                    TotalCost = g.Sum(o => o.OrderCarrierCost)
                })
                .ToListAsync(cancellationToken);

            foreach (var orderGroup in groupedOrders)
            {
                var carrierReport = new CarrierReport
                {
                    CarrierId = orderGroup.CarrierId,
                    CarrierCost = orderGroup.TotalCost,
                    CarrierReportDate = orderGroup.Date
                };

                await _carrierReportRepository.AddAsync(carrierReport);
            }

            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed($"{groupedOrders.Count} kargo raporu başarıyla oluşturuldu. {string.Join(", ", groupedOrders.Select(g => $"Taşıyıcı ID: {g.CarrierId}, {g.Date.ToShortDateString()} tarihinde {g.TotalCost}₺ ödendi."))}");
        }
    }
}
