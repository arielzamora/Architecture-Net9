# Detalle Técnico: Referencia para Migración a .NET 9

Este documento ha sido extraído directamente del código fuente real de los proyectos y sirve como referencia arquitectónica y técnica para una migración limpia hacia **.NET 9**.

## 1. Inyección de Dependencias (MediatR y Dapper)

La configuración de servicios permite centralizar las dependencias por capas. 

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
Esto permite centralizar el manejo de excepciones (como `FluentValidationException` o errores controlados del sistema) e inyectar detalles formateados sin ensuciar los controladores web con múltiples bloques `try-catch`.

## 3. Patrón Repositorio vs Dapper
Se usa el patrón Repositorio para encapsular la lógica de persistencia, pero se inyecta la abstracción de base de datos a través de `DapperContext`. Este patrón aísla las consultas de alta velocidad y usa `IDbConnection` para operaciones de lectura/ejecución directa superior a EntityFramework.

**Comportamiento en `CustomersRepository`:**
```csharp
public class CustomersRepository : ICustomersRepository
{
    private readonly DapperContext _context;

    public IEnumerable<Customer> GetAll()
    {
        // El DapperContext crea una conexión ultra-ligera en el acto
        using (var connection = _context.CreateConnection())
        {
            var query = "CustomersList";
            var customers = connection.Query<Customer>(query, commandType: CommandType.StoredProcedure);
            return customers;
        }
    }
}
```

## 4. Configuración de RabbitMQ (Sistemas Distribuidos)
La integración con RabbitMQ se monta usando la librería **MassTransit**, montándose mágicamente sobre un `BackgroundWorker` / `IHostedService` estándar en consolas y servicios Worker.

**Setup del Canal y la Cola (`Program.cs`):**
```csharp
await Host.CreateDefaultBuilder(args)
    .ConfigureServices(services =>
    {
        // Se inyecta MassTransit y se registran los Handlers "Consumers"
        services.AddMassTransit(x =>
        {
            x.AddConsumer<DiscountCreatedConsumer>();
            
            // Abstracción final del Broker (Configuración y canal)
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
    .RunAsync(); // Actúa como BackgroundService infinito
```

## Enfoque .NET 9: Primary Constructors
Al migrar a **.NET 9**, uno de los principales objetivos es la limpieza agresiva del código repetitivo de inyección. La actual estructura genera demasiada verbosidad en `MediatR` y patron Repositorio.

**Antes (.NET 6/7/8):**
La inyección duplicaba las sentencias (propiedad, constructor, asignación).
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

**Nuevo estándar en .NET 9 (Primary Constructors):**
Reduce el código y elimina la ceremonia, unificando inyección y constructor en la declaración de la clase.
```csharp
public class GetCustomerHandler(IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<GetCustomerQuery, Response<CustomerDto>>
{
    // 'unitOfWork' y 'mapper' están disponibles en toda la clase inmediatamente
    public async Task<Response<CustomerDto>> Handle(GetCustomerQuery request, CancellationToken cancellationToken)
    {
        var response = await unitOfWork.Customers.GetAsync(request.CustomerId);
        // ...
    }
}
```