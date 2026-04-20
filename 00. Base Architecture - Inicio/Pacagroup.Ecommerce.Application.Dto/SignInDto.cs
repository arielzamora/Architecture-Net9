using System;
using System.Collections.Generic;
using System.Text;

namespace Pacagroup.Ecommerce.Application.Dto
{
    public sealed record SignInDto
    {
        public string? Email { get; set; }
        public string? Password { get; set; }
    }
}
