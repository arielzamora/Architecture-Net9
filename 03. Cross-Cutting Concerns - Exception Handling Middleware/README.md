# 03. Exception Handling Middleware

## Resumen Ejecutivo
Centraliza y estandariza las respuestas de error en formato ProblemDetails o formatos genÃƒÂ©ricos en la API. Evita los repetitivos bloques try-catch dentro de los controladores.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
En la Arquitectura de Referencia, la resiliencia y monitoreo centralizado dependen de un logging impecable y un Exception Handler uniforme. Cualquier falla no controlada en el sistema serÃƒÂ¡ absorbida aquÃƒÂ­ y monitoreada.

## Tip de .NET 9
Utilizar `IExceptionHandler` introducido recientemente y madurado en .NET 9. Este pattern reemplaza a los middlewares tradicionales custom y se registra de forma limpia vÃƒÂ­a `app.UseExceptionHandler()`.
