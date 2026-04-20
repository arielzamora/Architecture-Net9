# 07. Service Bus Integration

## Resumen Ejecutivo
Uso avanzado de herramientas del ecosistema distribuido abstraÃƒÂ­das detrÃƒÂ¡s de Frameworks formales (ej. MassTransit / Azure Service Bus) posibilitando coreografÃƒÂ­as multi-nodo complejas, Retry Policies, Inbox/Outbox para transacciones de alta fidelidad atÃƒÂ³mica.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Este componente sella la Arquitectura Empresarial "Arquitectura de Referencia". Es imposible prometer escalabilidad empresarial sin resolver el problema de Dual-Write (quÃƒÂ© pasa si la DB guardÃƒÂ³ la venta pero el RabbitMQ fallÃƒÂ³ internamente y se desconectÃƒÂ³ la red limitando el envÃƒÂ­o logÃƒÂ­stico?).

## Tip de .NET 9
`.NET Aspire` nativo permite mockear, visualizar colas locales y orquestar este monstruo distribuido con OpenTelemetry Tracking en un dashboard moderno sin configurar nada, uniendo el flujo end-to-end (trace-id) distribuido desde la API original hasta tu base asÃƒÂ­ncrona de Outbox final.
