# ADR 001: Uso del Patrón CQRS y MediatR

## Contexto
Durante el diseño y estructuración de los dominios complejos del sistema (identificados en los repositorios de las subcarpetas `06. Patterns CQRS*`), nos enfrentamos al problema del acoplamiento profundo entre la capa de presentación (controladores web) y la capa de lógica de negocio. Adicionalmente, teníamos controladores masivos con sobrecarga de dependencias inyectadas para efectuar múltiples operaciones de lectura y escritura concurrentes, produciendo un código difícil de mantener, testear y escalar.

## Decisión
Hemos decidido implementar el patrón **Command Query Responsibility Segregation (CQRS)** orquestado mediante la librería **MediatR**. 
- Todas las operaciones que modifiquen el estado del sistema (`Insert`, `Update`, `Delete`) se aislarán bajo el paradigma de *Commands*.
- Todas las operaciones de proyección de datos (`Get`, `GetAll`) se englobarán bajo el paradigma de *Queries*.
- Se utilizará MediatR ("Mediator Pattern") para enviar de forma asíncrona estos objetos desde los controladores sin requerir referencias directas a la capa de persistencia.

## Consecuencias
**Positivas:**
- Alta cohesión y bajo acoplamiento: Los controladores sólo referencian `IMediator`.
- Desacople completo entre los modelos y flujos de lectura (optimizados para velocidad) y los flujos de escritura (optimizados para validación).
- Facilita la adopción de "Pipeline Behaviors" para inyección transversal (como validaciones Fluent y caching).
- Promueve la estructura asíncrona mediante `Task` e `IRequestHandler`.

**Negativas:**
- Mayor verbosidad arquitectónica: Una misma entidad del negocio ahora requiere crear tres clases extras por cada operación (Comando, Pipeline, Handler).
- Complejidad inicial de onboarding para los nuevos desarrolladores en el equipo.

## Referencias / Enlaces
- Código aplicado en: `/06. Patterns CQRS - CQRS Mediator Pipeline/`
- Detalles de implementación en Handlers en: `/06. Patterns CQRS - CQRS Commands/`