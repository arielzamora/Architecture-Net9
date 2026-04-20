# Architecture Decision Records (ADR)

Este directorio contiene los registros de las decisiones arquitectÃ³nicas clave tomadas para el proyecto **Pacagroup Ecommerce**.

## Estructura de un ADR
Cada documento sigue el estÃ¡ndar de Michael Nygard:
- **TÃ­tulo**: Nombre corto de la decisiÃ³n.
- **Contexto**: El problema o escenario que motivÃ³ la decisiÃ³n.
- **DecisiÃ³n**: La soluciÃ³n tÃ©cnica adoptada.
- **Consecuencias**: El impacto (positivo y negativo) de dicha decisiÃ³n en el sistema.

## Ãndice de Decisiones

| ID | TÃ­tulo | Estado | VÃ­nculo |
| --- | --- | --- | --- |
| **001** | Uso de PatrÃ³n CQRS y MediatR | Aceptado | [ADR-001](./ADR-001_CQRS_y_MediatR.md) |
| **002** | AdopciÃ³n de Dapper para Acceso UltrarrÃ¡pido | Aceptado | [ADR-002](./ADR-002_Dapper_Data_Access.md) |
| **003** | ComunicaciÃ³n AsÃ­ncrona con RabbitMQ | Aceptado | [ADR-003](./ADR-003_RabbitMQ_y_Mensajeria.md) |
| **004** | MigraciÃ³n EstratÃ©gica a .NET 9 | Propuesto | [ADR-004](./ADR-004_Migracion_NET_9.md) |

---
*Para mÃ¡s detalles sobre la implementaciÃ³n tÃ©cnica de estas decisiones, consultar los archivos `DETALLE_TECNICO.md` en las carpetas de patrones correspondientes.*
