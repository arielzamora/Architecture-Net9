# Detalle TÃ©cnico: Referencia para MigraciÃ³n a .NET 9

Este documento ha sido extraÃ­do directamente del cÃ³digo fuente real de los proyectos y sirve como referencia arquitectÃ³nica y tÃ©cnica para una migraciÃ³n limpia hacia **.NET 9**.

## 1. InyecciÃ³n de Dependencias (MediatR y Dapper)

La configuraciÃ³n de servicios permite centralizar las dependencias por capas. 

**MediatR:** (Registrado en `Application.Main\ConfigureServices.cs`)
```csharp
public static IServiceCollection AddApplicationServices(this IServiceCollection services)
{
    services.AddMediatR(cfg => {
        cfg.RegisterServicesFromAssembly(Assembly.GetExecutingAssembly());
    });
    // Otras dependencias (AutoMapper, Validadores, etc.)
    return services;
}
```

**Dapper:** (Registrado en `Persistence\ConfigureServices.cs`)
```csharp
public static IServiceCollection AddPersistenceServices(this IServiceCollection services, IConfiguration configuration)
{
    services.AddSingleton<DapperContext>();
    // ...
    return services;
}
```

## 2. Middlewares: Pipeline de Excepciones
El antiguo enfoque `v48_midlewareExcepciones` ha sido refactorizado y limpiado. Se centraliza mediante un `GlobalExceptionHandler` inyectado en el pipeline global de la API.

**Registro en el contenedor de servicios:**
```csharp
services.AddTransient<GlobalExceptionHandler>();
```

**Uso en el pipeline (Middlewares):**
```csharp
public static IApplicationBuilder AddMiddleware(this IApplicationBuilder app)
{
    return app.UseMiddleware<GlobalExceptionHandler>();
}
```
Esto permite centralizar el manejo de excepciones (como `FluentValidationException` o errores controlados del sistema) e inyectar detalles formateados sin ensuciar los controladores web con mÃºltiples bloques `try-catch`.

## 3. PatrÃ³n Repositorio vs Dapper
Se usa el patrÃ³n Repositorio para encapsular la lÃ³gica de persistencia, pero se inyecta la abstracciÃ³n de base de datos a travÃ©s de `DapperContext`. Este patrÃ³n aÃ­sla las consultas de alta velocidad y usa `IDbConnection` para operaciones de lectura/ejecuciÃ³n directa superior a EntityFramework.

**Comportamiento en `CustomersRepository`:**
```csharp
public class CustomersRepository : ICustomersRepository
{
    private readonly DapperContext _context;

    public IEnumerable<Customer> GetAll()
    {
        // El DapperContext crea una conexiÃ³n ultra-ligera en el acto
        using (var connection = _context.CreateConnection())
        {
            var query = "CustomersList";
            var customers = connection.Query<Customer>(query, commandType: CommandType.StoredProcedure);
            return customers;
        }
    }
}
```

## 4. ConfiguraciÃ³n de RabbitMQ (Sistemas Distribuidos)
La integraciÃ³n con RabbitMQ se monta usando la librerÃ­a **MassTransit**, montÃ¡ndose mÃ¡gicamente sobre un `BackgroundWorker` / `IHostedService` estÃ¡ndar en consolas y servicios Worker.

**Setup del Canal y la Cola (`Program.cs`):**
```csharp
await Host.CreateDefaultBuilder(args)
    .ConfigureServices(services =>
    {
        // Se inyecta MassTransit y se registran los Handlers "Consumers"
        services.AddMassTransit(x =>
        {
            x.AddConsumer<DiscountCreatedConsumer>();
            
            // AbstracciÃ³n final del Broker (ConfiguraciÃ³n y canal)
            x.UsingRabbitMq((context, cfg) =>
            {
                cfg.Host("localhost", "/", h =>
                {
                    h.Username("guest");
                    h.Password("guest");
                });
                cfg.ConfigureEndpoints(context); // Mapea todos los abstractos a Colas RabbitMQ
            });
        });
    })
    .Build()
    .RunAsync(); // ActÃºa como BackgroundService infinito
```

## Enfoque .NET 9: Primary Constructors
Al migrar a **.NET 9**, uno de los principales objetivos es la limpieza agresiva del cÃ³digo repetitivo de inyecciÃ³n. La actual estructura genera demasiada verbosidad en `MediatR` y patron Repositorio.

**Antes (.NET 6/7/8):**
La inyecciÃ³n duplicaba las sentencias (propiedad, constructor, asignaciÃ³n).
```csharp
public class GetCustomerHandler : IRequestHandler<GetCustomerQuery, Response<CustomerDto>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public GetCustomerHandler(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }
    // ...
}
```

**Nuevo estÃ¡ndar en .NET 9 (Primary Constructors):**
Reduce el cÃ³digo y elimina la ceremonia, unificando inyecciÃ³n y constructor en la declaraciÃ³n de la clase.
```csharp
public class GetCustomerHandler(IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<GetCustomerQuery, Response<CustomerDto>>
{
    // 'unitOfWork' y 'mapper' estÃ¡n disponibles en toda la clase inmediatamente
    public async Task<Response<CustomerDto>> Handle(GetCustomerQuery request, CancellationToken cancellationToken)
    {
        var response = await unitOfWork.Customers.GetAsync(request.CustomerId);
        // ...
    }
}
```
