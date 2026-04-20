# 06. CQRS Mediator Pipeline

## Resumen Ejecutivo
El patrÃ³n Mediator desacopla completamente el invocador (Controller API o Background Task) del ejecutor (Handler de CQRS). Centraliza el flujo de datos.

## Diagrama C4 Nivel 2 (Contenedores)
```mermaid
C4Container
title Diagrama C4 Nivel 2: MediatR Pattern Pipeline
Container(ctrl, "API Controller / Event Worker", "Orquestador")
Container_Boundary(mediator, "MediatR InMemory Bus") {
  Container(pipeline, "Pipelines EjecuciÃ³n", "InyecciÃ³n cruzada")
  Container(handler, "El CQRS Target Handler", "Contiene caso de uso (Core Business)")
}
Rel(ctrl, mediator, "mediator.Send(Command o Query)", "")
Rel(mediator, pipeline, "Envuelve Handlers AOP", "")
Rel(pipeline, handler, "Despacha al Negocio Real", "")
```

## ConexiÃ³n con el Objetivo (99. Target Architecture)
La magia principal en la Arquitectura de Referencia es su portabilidad (Ports and Adapters). MediatR nos permite mover el Feature (CQRS Handler) sin importar si es usado por gRPC, GraphQL, HTTP Rest API o un despachador del Broker MQ.

## Tip de .NET 9
Introducir Interceptors pre-compilados y constructores primarios (Primary Constructors `.cs` features en C# 12/13). Hacen la clase Handler de pocas lÃ­neas, omitiendo inyecciÃ³n estÃ¡tica de propiedades voluminosas.
