using AutoMapper;
using ShippingOrderProject.Application.Features.CarrierConfigurations.CreateCarrierConfiguration;
using ShippingOrderProject.Application.Features.CarrierConfigurations.UpdateCarrierConfiguration;
using ShippingOrderProject.Application.Features.Carriers.CreateCarrier;
using ShippingOrderProject.Application.Features.Carriers.UpdateCarrier;
using ShippingOrderProject.Application.Features.Orders.CreateOrder;
using ShippingOrderProject.Application.Models;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Application.Mapping
{
    public sealed class MappingProfile : Profile
    {
        public MappingProfile() 
        {
            CreateMap<Carrier, CarrierDTO>();
            CreateMap<CreateCarrierCommand, Carrier>();
            CreateMap<UpdateCarrierCommand, Carrier>().ForMember(dest => dest.Id, opt => opt.Ignore());

            CreateMap<CarrierConfiguration, CarrierConfigurationDTO>();
            CreateMap<CreateCarrierConfigurationCommand, CarrierConfiguration>();
            CreateMap<UpdateCarrierConfigurationCommand, CarrierConfiguration>().ForMember(dest => dest.Id, opt => opt.Ignore());

            CreateMap<CreateOrderCommand, Order>()
                .ForMember(dest => dest.OrderDate, opt => opt.Ignore())
                .ForMember(dest => dest.OrderCarrierCost, opt => opt.Ignore())
                .ForMember(dest => dest.CarrierId, opt => opt.Ignore());
        }
    }
}
