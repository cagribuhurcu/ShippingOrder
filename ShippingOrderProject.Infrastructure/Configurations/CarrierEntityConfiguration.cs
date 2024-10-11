using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShippingOrderProject.Domain.Entities;

namespace ShippingOrderProject.Infrastructure.Configurations
{
    internal sealed class CarrierEntityConfiguration : IEntityTypeConfiguration<Carrier>
    {
        public void Configure(EntityTypeBuilder<Carrier> builder)
        {
            builder.HasKey(cc => cc.Id);
        }
    }
}
