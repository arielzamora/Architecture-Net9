using Microsoft.Extensions.DependencyInjection;
using Pacagroup.Ecommerce.Infrastructure.Interface; 
using Pacagroup.Ecommerce.Infrastructure.Data;
using Microsoft.AspNetCore.Identity;
using Pacagroup.Ecommerce.Domain.Entity;    

namespace Pacagroup.Ecommerce.Infrastructure.Repository
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
        {
            services.AddSingleton<DapperContext>();
            services.AddScoped<ICustomersRepository, CustomersRepository>();
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IUsersRepository, UsersRepository>();
            services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();
            return services;
        }   
    }
}
