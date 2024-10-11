using MediatR;
using ShippingOrderProject.Application.Utilities;
using ShippingOrderProject.Domain.Repositories;
using ShippingOrderProject.Infrastructure.UnitOfWork;

namespace ShippingOrderProject.Application.Features.Orders.DeleteOrderById
{
    internal sealed class DeleteOrderByIdCommandHandler : IRequestHandler<DeleteOrderByIdCommand, Result<string>>
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IUnitOfWork _unitOfWork;

        public DeleteOrderByIdCommandHandler(IOrderRepository orderRepository, IUnitOfWork unitOfWork)
        {
            _orderRepository = orderRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Result<string>> Handle(DeleteOrderByIdCommand request, CancellationToken cancellationToken)
        {
            var order = await _orderRepository.GetByIdAsync(request.Id);
            if (order == null)
            {
                return Result<string>.Failure("Sipariş bulunamadı.");
            }

            _orderRepository.Delete(order);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return Result<string>.Succeed($"{request.Id} ID'li sipariş başarıyla silindi.");
        }
    }
}
