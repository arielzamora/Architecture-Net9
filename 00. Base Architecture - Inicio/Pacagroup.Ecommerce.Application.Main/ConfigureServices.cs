using Microsoft.Extensions.DependencyInjection;
using Pacagroup.Ecommerce.Application.Interface;
using System.Reflection;
using AutoMapper;
using Pacagroup.Ecommerce.Transversal.Common;


namespace Pacagroup.Ecommerce.Application.Main
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            
            services.AddScoped<IAuthApplication, AuthApplication>();
            services.AddScoped<IJwtService,JwtService>();
            services.AddScoped<ICustomersApplication,CustomersApplication>();
            services.AddAutoMapper(cfg => { }, typeof(ConfigureServices).Assembly);

            return services;
        }
    }
}
