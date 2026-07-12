# Documento Técnico: RabbitMQ Consumer y Sistemas Distribuidos

Este documento es un análisis pormenorizado del código analizado en la carpeta `07. Distributed Systems - RabbitMQ Consumer`. Aquí se exploran los pilares de la integración mediante MassTransit y su funcionamiento como servicio de fondo (Background Service).

## 1. Configuración del Middleware (HostedService)
La aplicación es una consola pura configurada para operar como un demonio de sistema o contenedor persistente, inyectando MassTransit en el host genérico de .NET.

En `Program.cs`, el registro ocurre así:
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
                
                // Activa la abstracción del Broker apuntando a RabbitMQ
                x.UsingRabbitMq((context, cfg) =>
                {
                    cfg.Host("localhost", "/", h => { ... });
                    cfg.ConfigureEndpoints(context); // Mapea mágicamente Eventos -> Colas
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

## 2. Patrones de Mensajería: ¿Se utiliza Outbox?
Tras analizar minuciosamente el código del repositorio actual, se evidencia que **no se utiliza el Patrón Outbox** en esta implementación. El sistema consume y procesa los eventos (como `DiscountCreatedEvent`) y la publicación se hace directamente (Patrón clásico Pub/Sub) mediante `Publish()` en el emisor.

### ¿Cómo se vería si usáramos Outbox? (Para garantizar At-Least-Once Delivery sin pérdidas)
En un escenario enterprise (como en una arquitectura empresarial de producción), se requiere que EF Core y MassTransit compartan la misma transacción. El código del "Outbox" no requiere que construyamos "tablas y workers gigantescos" de cero de forma manual, pues MassTransit tiene su propio módulo. Se vería así:

```csharp
services.AddMassTransit(x =>
{
    // Registra el Patrón Outbox en Base de Datos Relacional
    x.AddEntityFrameworkOutbox<ApplicationDbContext>(o =>
    {
        // Esto creará automáticamente las tablas OutboxMessage y OutboxState
        o.UseSqlServer();
        o.UseBusOutbox(); // El worker interno de MassTransit leerá esta tabla
    });
    // ...
});
```

---

## 3. Manejo de Errores: Reintentos (Retry) y DLQ (Dead Letter Queue)
Actualmente, el consumidor confía en la topología base de MassTransit:

1. **Flujo Feliz:** Llega el evento, el `Consumer` lo procesa sin lanzar excepciones, MassTransit envía un `ACK` (Acknowledgement) a RabbitMQ y el mensaje se purga.
2. **Error Inesperado (DLQ):** Si el código del Consumer rompe (ej: base de datos caída), RabbitMQ rechaza el mensaje automáticamente (`NACK`). MassTransit es sumamente inteligente y, sin configuración extra, crea una **DLQ** paralela nombrada `DiscountCreatedEvent_error`. Mueve allí el mensaje fallido permanentemente para conservar el orden sin colgar a los siguientes mensajes.

Si se deseara configurar **Políticas de Reintento** antes de mover al DLQ, se configura en el `Program.cs`:
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

## 4. Conexión con Azure Service Bus (AZ-104 Migration)
Si el día de mañana la infraestructura vira desde RabbitMQ on-premise hacia el PaaS de Azure, los cambios en el código son absurdamente mínimos. Esta es la belleza transaccional de usar la abstracción de MassTransit.

1. **Instalar el paquete de nube:** `MassTransit.Azure.ServiceBus.Core`
2. **Cambiar el Provider en la Inyección de Dependencias:**
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
MassTransit se encargará por detrás de mapear las traducciones: Los *Exchanges* de RabbitMQ pasarán a ser *Topics* en Azure, y las *Queues* se traducirán como *Subscriptions*. Tu lógica de negocio en `DiscountCreatedConsumer` quedará **completamente intacta**.