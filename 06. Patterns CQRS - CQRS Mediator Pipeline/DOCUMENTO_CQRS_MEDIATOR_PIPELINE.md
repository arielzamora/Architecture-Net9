# Documento TÃ©cnico: PatrÃ³n CQRS - Mediator Pipeline

## 1. InyecciÃ³n de Dependencias (DI)
El cÃ³digo responsable de inyectar MediatR y orquestar el descubrimiento dinÃ¡mico de todos los Handlers (Comandos y Queries) se encuentra en el archivo `Pacagroup.Ecommerce.Application.Main/ConfigureServices.cs`.

AsÃ­ se estructura exactamente el registro:
```csharp
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace Pacagroup.Ecommerce.Application.UseCases
{
    public static class ConfigureServices
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            // --- REGISTRO DE MEDIATR ---
            // Escanea y registra automÃ¡ticamente todos los IRequestHandler
            // dentro del ensamblado actual de forma dinÃ¡mica.
            services.AddMediatR(cfg => {
                cfg.RegisterServicesFromAssembly(Assembly.GetExecutingAssembly());
            });
            
            services.AddAutoMapper(Assembly.GetExecutingAssembly());
            
            // ... (Registro explÃ­cito de otros servicios de la aplicaciÃ³n)
            return services;
        }
    }
}
```

---

## 2. Flujo del Pipeline 
MediatR actÃºa como un embudo (pipeline) que separa al invocador de la lÃ³gica de negocio final. Aunque en este proyecto puntual la inclusiÃ³n de `ValidationBehavior` y `LoggingBehavior` se profundizan en otros bloques del repositorio, lÃ³gicamente un pipeline maduro atraviesa las siguientes capas antes de llegar a la manipulaciÃ³n de base de datos (`CreateCustomerHandler`).

```mermaid
sequenceDiagram
    autonumber
    participant API as EndPoint (Controller)
    participant Bus as MediatR Bus
    participant Log as LoggingBehavior
    participant Val as ValidationBehavior
    participant Hnd as Target Handler
    
    API->>Bus: Send(CreateCustomerCommand)
    activate Bus
    
    Bus->>Log: Handle()
    activate Log
    Log->>Log: Inicia cronÃ³metro y TraceId
    
    Log->>Val: Next()
    activate Val
    Val->>Val: Intercepta y valida sintaxis (FluentVal)
    
    Val->>Hnd: Next() (VÃ¡lido)
    activate Hnd
    Hnd->>Hnd: LÃ³gica Core de Negocio
    Hnd-->>Val: Retorna Response <T>
    deactivate Hnd
    
    Val-->>Log: Retorna Response <T>
    deactivate Val
    
    Log->>Log: Calcula TimeSpan (Latencia transcurrida)
    Log-->>Bus: Pipeline completado
    deactivate Log
    
    Bus-->>API: Resultado del Command devuelto
    deactivate Bus
```

---

## 3. PatrÃ³n Repositorio
Para aislar la dependencia a la capa de infraestructura, el CQRS Handler no inyecta el `ApplicationDbContext` directamente. En su lugar, el `CreateCustomerHandler.cs` delega esto por completo mediante el UnitOfWork:

```csharp
// En CreateCustomerHandler.cs
public class CreateCustomerHandler : IRequestHandler<CreateCustomerCommand, Response<bool>>
{
    private readonly IUnitOfWork _unitOfWork;
    
    public CreateCustomerHandler(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        // ...
    }
    
    public async Task<Response<bool>> Handle(...)
    {
        // Se abstrae la tecnologÃ­a detrÃ¡s de IUnitOfWork y ICustomersRepository
        response.Data = await _unitOfWork.Customers.InsertAsync(customer);
        return response;
    }
}
```

Si saltamos hacia `Pacagroup.Ecommerce.Persistence/Repositories/UnitOfWork.cs`, descubrimos que este patrÃ³n Repositorio estÃ¡ fuertemente acoplado en el fondo a Entity Framework Core (no a Dapper), inyectando el contexto de EF:
```csharp
// En UnitOfWork.cs
public class UnitOfWork : IUnitOfWork
{
    private readonly ApplicationDbContext _applicationDbContext;
    public ICustomersRepository Customers { get; }

    public UnitOfWork(ICustomersRepository customers, ApplicationDbContext applicationDbContext)
    {
        Customers = customers;
        _applicationDbContext = applicationDbContext;
    }
    
    public async Task<int> Save(CancellationToken cancellationToken)
    {
        // Disparo Ãºnico de la transacciÃ³n a SQL
        return await _applicationDbContext.SaveChangesAsync(cancellationToken);
    }
}
```

---

## 4. Tip .NET 9 Avanzado (Impacto de Native AOT)
> [!WARNING]
> En .NET 9, el ecosistema de microservicios estÃ¡ migrando activamente a **Native AOT** (Ahead-of-Time compilation) para habilitar aplicaciones que arranquen en milisegundos con uso nulo del motor JIT. 

**Problema:**  
El cÃ³digo actual usa `Assembly.GetExecutingAssembly()` y Reflection dinÃ¡mica en tiempo de ejecuciÃ³n para escanear y encontrar quiÃ©n implementa `IRequestHandler`. AOT es enemigo por defecto de la reflexiÃ³n; en la compilaciÃ³n nativa los tipos no referenciados explÃ­citamente se truncan (Trimming), provocando que este cÃ³digo falle en producciÃ³n o no logre encontrar tus Handlers.

**SoluciÃ³n Alternativa 100% C# .NET 9:**  
Evitar la recolecciÃ³n estÃ¡tica y pasar a la **generaciÃ³n de cÃ³digo fuente (Source Generators)** que hace el mapeo en tiempo de diseÃ±o. En la comunidad .NET avanzada, se recomienda reemplazar la librerÃ­a tradicional genÃ©rica `MediatR` por **`Mediator` (de Martinoth)**, un clon directo construido especÃ­ficamente para ser compatible con AOT. Ã‰ste inyecta en el compilador la conexiÃ³n entre los Commands y los Handlers sin usar Reflection. Esto hace que tu Pipeline CQRS arranque notablemente mÃ¡s rÃ¡pido y consuma menos memoria en los pods distribuidos (ideal para la Arquitectura de Referencia).
