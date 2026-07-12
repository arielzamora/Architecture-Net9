# ADR 003: Comunicación Asíncrona Distribuida con RabbitMQ y MassTransit

## Contexto
Bajo un escenario que evoluciona rápidamente a múltiples módulos y microservicios, bloquear el hilo principal de un servicio para que dependa del tiempo operativo de otro componente satelital (por ejemplo: finalizar procesamiento de carrito y esperar por la integración del cobro o el envío del mail) resulta nocivo para el sistema generando cuellos de botella ("bottlenecks"). Operar con llamadas HTTP síncronas entre dominios crearía un embudo sistémico de efecto dominó (donde un servicio intermitente hunde a buena parte de la plataforma).

## Decisión
Implementar un modelo arquitectónico "Event-Driven" confiable mediante **RabbitMQ** operando como "Message Broker" transaccional del sistema distribuido (evidenciado en el bloque de las carpetas `07`).
Para lograr una correcta instrumentación, se incorpora la biblioteca **MassTransit** al ecosistema `C#`, permitiendo establecer una capa de abstracción fluida (`UsingRabbitMq()`) que es inyectada directo al contenedor de dependencias subyacente que opera en modo Worker.

## Consecuencias
**Positivas:**
- Desacoplamiento temporal de procesos: Los productores sueltan su carga al *Exchange* de eventos y los consumidores (*BackgroundServiceWorkers*) liberan su cola al ritmo que toleran, manejando carga en masa.
- Configuración y resiliencia integrada: Creación automática de *Exchanges*, enrutamientos a colas, reintentos controlados según topología y un envío elegante a una Dead Letter Queue (DLQ) en caso de fallo, todo orquestado por MassTransit.
- Si en un futuro la infraestructura se abstrae a PaaS/SaaS como Azure Service Bus o Amazon SQS, bastará reemplazar la dependencia y llamar a `.UsingAzureServiceBus()`, limitando el agobio de refactorizaje del lado corporativo.

**Negativas:**
- Implica un modelo de "Consistencia Eventual". El retraso asíncrono significa que el emisor asume el suceso, pero un front-end puede requerir una UX adaptativa al no contar siempre con la garantía y efecto reflejado de la transacción final.
- Añade sobrecarga operativa: Mayor dificultad en observar y monitorear colas, trazar IDs de correlación a través de flujos para encontrar dónde pudo haber fallado un mensaje específico ("Distributed Tracing").

## Referencias / Enlaces
- Módulos Productores y Consumidores en: `/07. Distributed Systems - RabbitMQ Consumer/` y `/07. Distributed Systems - RabbitMQ Producer/`
- Análisis interno arquitectónico documentado en: `/07. Distributed Systems - RabbitMQ Consumer/DETALLE_TECNICO.md`