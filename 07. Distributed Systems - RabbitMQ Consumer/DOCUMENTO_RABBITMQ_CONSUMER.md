# Documento TÃ©cnico: RabbitMQ Consumer y Sistemas Distribuidos

Este documento es un anÃ¡lisis pormenorizado del cÃ³digo analizado en la carpeta `07. Distributed Systems - RabbitMQ Consumer`. AquÃ­ se exploran los pilares de la integraciÃ³n mediante MassTransit y su funcionamiento como servicio de fondo (Background Service).

## 1. ConfiguraciÃ³n del Middleware (HostedService)
La aplicaciÃ³n es una consola pura configurada para operar como un demonio de sistema o contenedor persistente, inyectando MassTransit en el host genÃ©rico de .NET.

En `Program.cs`, el registro ocurre asÃ­:
```csharp
public static async Task Main(string[] args)
{
    await Host.CreateDefaultBuilder(args) // Construye el contenedor base de la app (.NET Core/5+)
        .ConfigureServices(services =>
        {
            services.AddMassTransit(x =>
            {
                // Descubre y registra el Consumidor local
                x.AddConsumer<DiscountCreatedConsumer>();
                
                // Activa la abstracciÃ³n del Broker apuntando a RabbitMQ
                x.UsingRabbitMq((context, cfg) =>
                {
                    cfg.Host("localhost", "/", h => { ... });
                    cfg.ConfigureEndpoints(context); // Mapea mÃ¡gicamente Eventos -> Colas
                });
            });
            // MassTransit internamente inyecta un IHostedService que 
            // arranca y frena la escucha junto con el Host.
        })
        .Build()
        .RunAsync(); // Bloquea la consola infinitamente escuchando la cola
}
```
**Nota conceptual:** En aplicaciones .NET, `services.AddMassTransit` registra tras bambalinas `MassTransitHostedService : IHostedService`. Esto permite que, si lo desplegamos en Kubernetes o un Windows Service, el hilo principal no termine de forma nativa.

---

## 2. Patrones de MensajerÃ­a: Â¿Se utiliza Outbox?
Tras analizar minuciosamente el cÃ³digo del repositorio actual, se evidencia que **no se utiliza el PatrÃ³n Outbox** en esta implementaciÃ³n. El sistema consume y procesa los eventos (como `DiscountCreatedEvent`) y la publicaciÃ³n se hace directamente (PatrÃ³n clÃ¡sico Pub/Sub) mediante `Publish()` en el emisor.

### Â¿CÃ³mo se verÃ­a si usÃ¡ramos Outbox? (Para garantizar At-Least-Once Delivery sin pÃ©rdidas)
En un escenario enterprise (como la Target Architecture), se requiere que EF Core y MassTransit compartan la misma transacciÃ³n. El cÃ³digo del "Outbox" no requiere que construyamos "tablas y workers gigantescos" de cero de forma manual, pues MassTransit tiene su propio mÃ³dulo. Se verÃ­a asÃ­:

```csharp
services.AddMassTransit(x =>
{
    // Registra el PatrÃ³n Outbox en Base de Datos Relacional
    x.AddEntityFrameworkOutbox<ApplicationDbContext>(o =>
    {
        // Esto crearÃ¡ automÃ¡ticamente las tablas OutboxMessage y OutboxState
        o.UseSqlServer();
        o.UseBusOutbox(); // El worker interno de MassTransit leerÃ¡ esta tabla
    });
    // ...
});
```

---

## 3. Manejo de Errores: Reintentos (Retry) y DLQ (Dead Letter Queue)
Actualmente, el consumidor confÃ­a en la topologÃ­a base de MassTransit:

1. **Flujo Feliz:** Llega el evento, el `Consumer` lo procesa sin lanzar excepciones, MassTransit envÃ­a un `ACK` (Acknowledgement) a RabbitMQ y el mensaje se purga.
2. **Error Inesperado (DLQ):** Si el cÃ³digo del Consumer rompe (ej: base de datos caÃ­da), RabbitMQ rechaza el mensaje automÃ¡ticamente (`NACK`). MassTransit es sumamente inteligente y, sin configuraciÃ³n extra, crea una **DLQ** paralela nombrada `DiscountCreatedEvent_error`. Mueve allÃ­ el mensaje fallido permanentemente para conservar el orden sin colgar a los siguientes mensajes.

Si se deseara configurar **PolÃ­ticas de Reintento** antes de mover al DLQ, se configura en el `Program.cs`:
```csharp
x.UsingRabbitMq((context, cfg) =>
{
    cfg.UseMessageRetry(r => 
        r.Incremental(3, TimeSpan.FromSeconds(1), TimeSpan.FromSeconds(2)));
    // Intenta 3 veces esperando 1s, luego 3s, luego 5s en caso de fallo,
    // antes de mandarlo definitivamente a la Dead Letter Queue (_error).
});
```

---

## 4. ConexiÃ³n con Azure Service Bus (AZ-104 Migration)
Si el dÃ­a de maÃ±ana la infraestructura vira desde RabbitMQ on-premise hacia el PaaS de Azure, los cambios en el cÃ³digo son absurdamente mÃ­nimos. Esta es la belleza transaccional de usar la abstracciÃ³n de MassTransit.

1. **Instalar el paquete de nube:** `MassTransit.Azure.ServiceBus.Core`
2. **Cambiar el Provider en la InyecciÃ³n de Dependencias:**
 Reemplazar `UsingRabbitMq` por `UsingAzureServiceBus`:

```csharp
// Se elimina UseRabbitMq()
x.UsingAzureServiceBus((context, cfg) =>
{
    // Se configura la Connection String obtenida del Portal de Azure 
    // en lugar del Host(), Username() y Password()
    cfg.Host(builder.Configuration.GetConnectionString("AzureServiceBus"));
    cfg.ConfigureEndpoints(context);
});
```
MassTransit se encargarÃ¡ por detrÃ¡s de mapear las traducciones: Los *Exchanges* de RabbitMQ pasarÃ¡n a ser *Topics* en Azure, y las *Queues* se traducirÃ¡n como *Subscriptions*. Tu lÃ³gica de negocio en `DiscountCreatedConsumer` quedarÃ¡ **completamente intacta**.
