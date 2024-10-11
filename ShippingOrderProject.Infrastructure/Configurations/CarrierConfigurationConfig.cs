using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Infrastructure.Configurations
{
    internal sealed class CarrierConfigurationConfig : IEntityTypeConfiguration<CarrierConfiguration>
    {
        public void Configure(EntityTypeBuilder<CarrierConfiguration> builder)
        {
            builder.HasKey(cc => cc.Id);
            builder.Property(cc => cc.CarrierCost).HasColumnType("decimal(18,2)");
        }
    }
}
