using Pacagroup.Ecommerce.Application.Dto;
using Pacagroup.Ecommerce.Transversal.Common;

namespace Pacagroup.Ecommerce.Application.Interface
{
    public interface ICustomersApplication
    {
        Task<Response<bool>> InsertAsync(CustomerDto customerDto);
        Task<Response<bool>> UpdateAsync(CustomerDto customerDto);
        Task<Response<bool>> DeleteAsync(string customerId);
        Task<Response<CustomerDto>> GetAsync(string customerId);
        Task<Response<IEnumerable<CustomerDto>>> GetAllAsync();
    }
}
