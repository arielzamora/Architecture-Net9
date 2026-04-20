# ADR 003: ComunicaciÃ³n AsÃ­ncrona Distribuida con RabbitMQ y MassTransit

## Contexto
Bajo un escenario que evoluciona rÃ¡pidamente a mÃºltiples mÃ³dulos y microservicios, bloquear el hilo principal de un servicio para que dependa del tiempo operativo de otro componente satelital (por ejemplo: finalizar procesamiento de carrito y esperar por la integraciÃ³n del cobro o el envÃ­o del mail) resulta nocivo para el sistema generando cuellos de botella ("bottlenecks"). Operar con llamadas HTTP sÃ­ncronas entre dominios crearÃ­a un embudo sistÃ©mico de efecto dominÃ³ (donde un servicio intermitente hunde a buena parte de la plataforma).

## DecisiÃ³n
Implementar un modelo arquitectÃ³nico "Event-Driven" confiable mediante **RabbitMQ** operando como "Message Broker" transaccional del sistema distribuido (evidenciado en el bloque de las carpetas `07`).
Para lograr una correcta instrumentaciÃ³n, se incorpora la biblioteca **MassTransit** al ecosistema `C#`, permitiendo establecer una capa de abstracciÃ³n fluida (`UsingRabbitMq()`) que es inyectada directo al contenedor de dependencias subyacente que opera en modo Worker.

## Consecuencias
**Positivas:**
- Desacoplamiento temporal de procesos: Los productores sueltan su carga al *Exchange* de eventos y los consumidores (*BackgroundServiceWorkers*) liberan su cola al ritmo que toleran, manejando carga en masa.
- ConfiguraciÃ³n y resiliencia integrada: CreaciÃ³n automÃ¡tica de *Exchanges*, enrutamientos a colas, reintentos controlados segÃºn topologÃ­a y un envÃ­o elegante a una Dead Letter Queue (DLQ) en caso de fallo, todo orquestado por MassTransit.
- Si en un futuro la infraestructura se abstrae a PaaS/SaaS como Azure Service Bus o Amazon SQS, bastarÃ¡ reemplazar la dependencia y llamar a `.UsingAzureServiceBus()`, limitando el agobio de refactorizaje del lado corporativo.

**Negativas:**
- Implica un modelo de "Consistencia Eventual". El retraso asÃ­ncrono significa que el emisor asume el suceso, pero un front-end puede requerir una UX adaptativa al no contar siempre con la garantÃ­a y efecto reflejado de la transacciÃ³n final.
- AÃ±ade sobrecarga operativa: Mayor dificultad en observar y monitorear colas, trazar IDs de correlaciÃ³n a travÃ©s de flujos para encontrar dÃ³nde pudo haber fallado un mensaje especÃ­fico ("Distributed Tracing").

## Referencias / Enlaces
- MÃ³dulos Productores y Consumidores en: `/07. Distributed Systems - RabbitMQ Consumer/` y `/07. Distributed Systems - RabbitMQ Producer/`
- AnÃ¡lisis interno arquitectÃ³nico documentado en: `/07. Distributed Systems - RabbitMQ Consumer/DETALLE_TECNICO.md`
