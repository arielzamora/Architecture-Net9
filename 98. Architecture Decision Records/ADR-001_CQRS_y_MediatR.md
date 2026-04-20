# ADR 001: Uso del PatrÃ³n CQRS y MediatR

## Contexto
Durante el diseÃ±o y estructuraciÃ³n de los dominios complejos del sistema (identificados en los repositorios de las subcarpetas `06. Patterns CQRS*`), nos enfrentamos al problema del acoplamiento profundo entre la capa de presentaciÃ³n (controladores web) y la capa de lÃ³gica de negocio. Adicionalmente, tenÃ­amos controladores masivos con sobrecarga de dependencias inyectadas para efectuar mÃºltiples operaciones de lectura y escritura concurrentes, produciendo un cÃ³digo difÃ­cil de mantener, testear y escalar.

## DecisiÃ³n
Hemos decidido implementar el patrÃ³n **Command Query Responsibility Segregation (CQRS)** orquestado mediante la librerÃ­a **MediatR**. 
- Todas las operaciones que modifiquen el estado del sistema (`Insert`, `Update`, `Delete`) se aislarÃ¡n bajo el paradigma de *Commands*.
- Todas las operaciones de proyecciÃ³n de datos (`Get`, `GetAll`) se englobarÃ¡n bajo el paradigma de *Queries*.
- Se utilizarÃ¡ MediatR ("Mediator Pattern") para enviar de forma asÃ­ncrona estos objetos desde los controladores sin requerir referencias directas a la capa de persistencia.

## Consecuencias
**Positivas:**
- Alta cohesiÃ³n y bajo acoplamiento: Los controladores sÃ³lo referencian `IMediator`.
- Desacople completo entre los modelos y flujos de lectura (optimizados para velocidad) y los flujos de escritura (optimizados para validaciÃ³n).
- Facilita la adopciÃ³n de "Pipeline Behaviors" para inyecciÃ³n transversal (como validaciones Fluent y caching).
- Promueve la estructura asÃ­ncrona mediante `Task` e `IRequestHandler`.

**Negativas:**
- Mayor verbosidad arquitectÃ³nica: Una misma entidad del negocio ahora requiere crear tres clases extras por cada operaciÃ³n (Comando, Pipeline, Handler).
- Complejidad inicial de onboarding para los nuevos desarrolladores en el equipo.

## Referencias / Enlaces
- CÃ³digo aplicado en: `/06. Patterns CQRS - CQRS Mediator Pipeline/`
- Detalles de implementaciÃ³n en Handlers en: `/06. Patterns CQRS - CQRS Commands/`
