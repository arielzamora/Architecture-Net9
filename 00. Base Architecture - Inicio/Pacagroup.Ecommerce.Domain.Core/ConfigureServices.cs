using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using Pacagroup.Ecommerce.Domain.Interface;

namespace Pacagroup.Ecommerce.Domain.Core
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddDomainServices(this IServiceCollection services)
        {
            services.AddScoped<ICustomersDomain, CustomersDomain>();
            services.AddScoped<IUserDomain, UsersDomain>();
            return services;
        }
    }
}
