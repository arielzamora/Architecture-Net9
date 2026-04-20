# 06. FluentValidation with MediatR

## Resumen Ejecutivo
Todo flujo (Command) disparado hacia MediatR interseca con un filtro global (Pipeline Behavior). Si el request viola alguna regla de sintaxis/negocio estricta, FluentValidation frena la ejecuciÃƒÂ³n limpiamente antes de ingresar al Core Database Handler.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Evitar que el Core de la aplicaciÃƒÂ³n sea contaminado por lÃƒÂ³gica sucia de base en la "Arquitectura de Referencia". Si la API pasa una mensajerÃƒÂ­a sucia por un Worker y queremos validar eso del otro lado del orquestador, esta inyecciÃƒÂ³n protege transversalmente el modelo.

## Tip de .NET 9
Se sugiere la implementaciÃƒÂ³n sobre Option Types / Patrones Result (`Result<T>`) dentro del Pipeline Behavior para minimizar Exceptions pesadas en el stacktrace y favorecer la latencia de respuesta estricta sin allocation.
