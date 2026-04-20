using AutoMapper;
using Pacagroup.Ecommerce.Application.Dto;
using Pacagroup.Ecommerce.Domain.Entity;    

namespace Pacagroup.Ecommerce.Application.Main.Commons
{
    public class MappingsProfile:Profile
    {
        public MappingsProfile() { 
          CreateMap<Customer, CustomerDto>().ReverseMap();
          CreateMap<User,SignUpDto>().ReverseMap();

        }
    }
}
