using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Infrastructure.Configurations
{
    internal sealed class CarrierReportConfiguration : IEntityTypeConfiguration<CarrierReport>
    {
        public void Configure(EntityTypeBuilder<CarrierReport> builder)
        {
            builder.HasKey(cc => cc.Id);
            builder.Property(cc => cc.CarrierCost).HasColumnType("decimal(18,2)");
        }
    }
}
