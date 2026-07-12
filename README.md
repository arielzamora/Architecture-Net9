# 🏛️ .NET 9 Architecture Best Practices Dictionary

Este repositorio es una **guía de referencia y diccionario práctico** sobre la implementación de patrones de diseño, buenas prácticas de desarrollo y arquitecturas de software modernas bajo el ecosistema de **.NET 9**.

En lugar de ser un único proyecto cerrado, este espacio sirve como un catálogo ordenado de soluciones estructuradas y pruebas de concepto (PoC), organizadas de forma incremental de acuerdo a su complejidad y responsabilidad técnica.

---

## 🧭 Ruta de Aprendizaje e Índice de Patrones

El repositorio se divide en módulos numerados que te guiarán paso a paso desde los fundamentos básicos hasta integraciones distribuidas avanzadas:

| Nivel | Componente / Carpeta | Propósito y Concepto Técnico Clave |
| :--- | :--- | :--- |
| **00** | 🚀 [Base Architecture - Inicio](./00.%20Base%20Architecture%20-%20Inicio) | Arquitectura base inicial y fundamentos de la solución. |
| **01** | 🛡️ [Fluent Validator](./01.%20Validation%20and%20Quality%20-%20Fluent%20Validator) | Implementación de validación rica de entidades y DTOs en la capa de aplicación. |
| **01** | 🧪 [Unit Testing](./01.%20Validation%20and%20Quality%20-%20Unit%20Testing) | Estrategias de pruebas unitarias para validar la lógica del dominio de forma aislada. |
| **02** | 📌 [API Versioning](./02.%20API%20Design%20-%20API%20Versioning) | Versionamiento semántico y control de versiones en APIs HTTP. |
| **02** | 📄 [Pagination](./02.%20API%20Design%20-%20Pagination) | Estrategias eficientes de paginación para optimizar payloads en servicios REST. |
| **03** | 🔍 [Entity Auditing](./03.%20Cross-Cutting%20Concerns%20-%20Entity%20Auditing) | Registro automático de auditoría de creación y modificación en persistencia de datos. |
| **03** | 🚨 [Exception Handling Middleware](./03.%20Cross-Cutting%20Concerns%20-%20Exception%20Handling%20Middleware) | Middleware global de excepciones para homogeneizar respuestas de error de API. |
| **04** | 🏥 [Health Checks](./04.%20Observability%20-%20Health%20Checks) | Monitoreo y diagnóstico del estado de salud de la aplicación en tiempo de ejecución. |
| **04** | ⚡ [Redis Health Check](./04.%20Observability%20-%20Redis%20Health%20Check) | Validación de conectividad y estado de salud sobre caché distribuida en Redis. |
| **05** | 🛑 [Rate Limiting](./05.%20Security%20and%20Traffic%20Control%20-%20Rate%20Limiting) | Control de flujo y protección contra abuso de endpoints mediante limitación de peticiones. |
| **06** | ⚡ [CQRS Commands](./06.%20Patterns%20CQRS%20-%20CQRS%20Commands) | Segregación de comandos de escritura aislados de la lógica de consulta. |
| **06** | 🔀 [CQRS Mediator Pipeline](./06.%20Patterns%20CQRS%20-%20CQRS%20Mediator%20Pipeline) | Integración del patrón Mediador para desacoplar controladores y lógica de negocio. |
| **06** | 🔑 [Login with MediatR](./06.%20Patterns%20CQRS%20-%20Login%20with%20MediatR) | Implementación práctica de autenticación de seguridad orquestada por comandos. |
| **06** | 🔒 [FluentValidation with MediatR](./06.%20Patterns%20CQRS%20-%20FluentValidation%20with%20MediatR) | Intercepción automática de comandos para validación antes de su ejecución. |
| **06** | 🔗 [MediatR Pipeline Behaviors](./06.%20Patterns%20CQRS%20-%20MediatR%20Pipeline%20Behaviors) | Middleware transversal en MediatR (Logging, Caching, Transacciones). |
| **07** | 📤 [RabbitMQ Producer](./07.%20Distributed%20Systems%20-%20RabbitMQ%20Producer) | Publicación asíncrona de eventos AMQP desacoplada en tiempo de ejecución. |
| **07** | 📥 [RabbitMQ Consumer](./07.%20Distributed%20Systems%20-%20RabbitMQ%20Consumer) | Suscripción asíncrona y procesamiento en segundo plano (Background Workers). |
| **07** | ☁️ [Service Bus Integration](./07.%20Distributed%20Systems%20-%20Service%20Bus%20Integration) | Integración empresarial avanzada con brokers en la nube (Azure Service Bus/MassTransit). |

---

## 🛠️ Stack Tecnológico Transversal

Las tecnologías utilizadas y demostradas a lo largo del repositorio cubren las necesidades comunes de desarrollo enterprise:

*   **Runtime Base**: `.NET 9` utilizando C# 13 (adoptando constructores primarios y sintaxis moderna).
*   **Mensajería Distribuida**: `RabbitMQ` y `MassTransit` para comunicación asíncrona eventual.
*   **Caché & Resiliencia**: `Redis` para caché distribuida y Health Checks dedicados.
*   **Persistencia & Acceso de Datos**: Uso híbrido de `EF Core` (para operaciones transaccionales complejas) y `Dapper` (para lecturas de alto rendimiento).
*   **Orquestación y Mediación**: `MediatR` con comportamientos de canalización (*Pipeline Behaviors*).

---

## 📜 Índice de Decisiones Arquitectónicas (ADRs)

Para comprender el *porqué* detrás de las decisiones técnicas y estructurales que rigen estos patrones, consulta las bitácoras dedicadas en la carpeta **[98. Architecture Decision Records](./98.%20Architecture%20Decision%20Records)**:

1.  **[ADR-001: CQRS y MediatR](./98.%20Architecture%20Decision%20Records/ADR-001_CQRS_y_MediatR.md)** - Desacoplamiento e incremento de cohesión.
2.  **[ADR-002: Dapper Data Access](./98.%20Architecture%20Decision%20Records/ADR-002_Dapper_Data_Access.md)** - Queries rápidas para flujos de lectura masiva.
3.  **[ADR-003: RabbitMQ y Mensajería](./98.%20Architecture%20Decision%20Records/ADR-003_RabbitMQ_y_Mensajeria.md)** - Sistemas distribuidos resilientes empleando MassTransit.
4.  **[ADR-004: Migración a .NET 9](./98.%20Architecture%20Decision%20Records/ADR-004_Migracion_NET_9.md)** - Transición tecnológica y Primary Constructors.

---

## 📚 Guías Técnicas de Detalle

Si deseas profundizar en la implementación técnica de los bloques más complejos, revisa la documentación interna:

*   **[Análisis de CQRS y MediatR (Carpeta 06)](./06.%20Patterns%20CQRS%20-%20CQRS%20Mediator%20Pipeline/DETALLE_TECNICO.md)**: Explicación de Handlers, Validaciones y Primary Constructors.
*   **[Sistemas Distribuidos y RabbitMQ (Carpeta 07)](./07.%20Distributed%20Systems%20-%20RabbitMQ%20Consumer/DETALLE_TECNICO.md)**: Configuración de consumidores, reintentos y resiliencia.

---
*Última actualización: Julio de 2026*