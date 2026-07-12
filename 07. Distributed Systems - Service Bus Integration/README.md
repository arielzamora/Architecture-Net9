# 07. Service Bus Integration

## Resumen Ejecutivo
Uso avanzado de herramientas del ecosistema distribuido abstraídas detrás de Frameworks formales (ej. MassTransit / Azure Service Bus) posibilitando coreografías multi-nodo complejas, Retry Policies, Inbox/Outbox para transacciones de alta fidelidad atómica.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## Tip de .NET 9
`.NET Aspire` nativo permite mockear, visualizar colas locales y orquestar este monstruo distribuido con OpenTelemetry Tracking en un dashboard moderno sin configurar nada, uniendo el flujo end-to-end (trace-id) distribuido desde la API original hasta tu base asíncrona de Outbox final.