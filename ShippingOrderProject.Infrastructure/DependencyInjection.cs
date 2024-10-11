using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Scrutor;
using ShippingOrderProject.Infrastructure.Context;
using ShippingOrderProject.Infrastructure.UnitOfWork;
using System.Reflection;

namespace ShippingOrderProject.Infrastructure
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("SqlServer")));

            services.AddScoped<IUnitOfWork, UnitOfWork.UnitOfWork>();

            services.Scan(action =>
            {
                action
                    .FromAssemblies(Assembly.GetExecutingAssembly())  // Mevcut assembly'deki sınıfları tara
                    .AddClasses(publicOnly: false)  // Public olmayan sınıfları da dahil et
                    .UsingRegistrationStrategy(RegistrationStrategy.Skip)  // Aynı arayüze sahip birden fazla sınıf varsa, atla
                    .AsMatchingInterface()  // Sınıf ismi ile arayüz ismi eşleşenleri bul ve bağla
                    .AsImplementedInterfaces()  // Implement ettikleri tüm arayüzlerle birlikte kaydet
                    .WithScopedLifetime();  // Scoped yaşam döngüsü ile ekle
            });

            return services;
        }
    }
}
