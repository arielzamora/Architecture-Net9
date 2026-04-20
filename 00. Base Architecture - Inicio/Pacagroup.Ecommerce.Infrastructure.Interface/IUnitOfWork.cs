using System;
using System.Collections.Generic;
using System.Text;

namespace Pacagroup.Ecommerce.Infrastructure.Interface
{
    public interface IUnitOfWork:IDisposable
    {
        ICustomersRepository Customers { get; }

        IUsersRepository Users { get; }
    }
}
