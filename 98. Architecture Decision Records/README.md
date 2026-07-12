# Architecture Decision Records (ADR)

Este directorio contiene los registros de las decisiones arquitectónicas clave tomadas para el proyecto **Pacagroup Ecommerce**.

## Estructura de un ADR
Cada documento sigue el estándar de Michael Nygard:
- **Título**: Nombre corto de la decisión.
- **Contexto**: El problema o escenario que motivó la decisión.
- **Decisión**: La solución técnica adoptada.
- **Consecuencias**: El impacto (positivo y negativo) de dicha decisión en el sistema.

## Índice de Decisiones

| ID | Título | Estado | Vínculo |
| --- | --- | --- | --- |
| **001** | Uso de Patrón CQRS y MediatR | Aceptado | [ADR-001](./ADR-001_CQRS_y_MediatR.md) |
| **002** | Adopción de Dapper para Acceso Ultrarrápido | Aceptado | [ADR-002](./ADR-002_Dapper_Data_Access.md) |
| **003** | Comunicación Asíncrona con RabbitMQ | Aceptado | [ADR-003](./ADR-003_RabbitMQ_y_Mensajeria.md) |
| **004** | Migración Estratégica a .NET 9 | Propuesto | [ADR-004](./ADR-004_Migracion_NET_9.md) |

---
*Para más detalles sobre la implementación técnica de estas decisiones, consultar los archivos `DETALLE_TECNICO.md` en las carpetas de patrones correspondientes.*