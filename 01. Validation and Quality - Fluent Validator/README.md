# 01. Fluent Validator

## Resumen Ejecutivo
Delega la lÃƒÂ³gica de validaciÃƒÂ³n de modelos (DRY) a clases separadas en lugar de contaminar los controladores o entidades mediante DataAnnotations. FluentValidation permite crear reglas complejas y testeables.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Para Arquitectura de Referencia, la validaciÃƒÂ³n se moverÃƒÂ¡ a un punto central del pipeline (como los Behaviors de MediatR) evitando que cada endpoint o servicio deba instanciar el validador explÃƒÂ­citamente.

## Tip de .NET 9
La introducciÃƒÂ³n de AOT (Ahead-of-Time compilation) mÃƒÂ¡s pulido en .NET 9 favorece validadores que eviten reflexiÃƒÂ³n profunda, haciendo FluentValidation aÃƒÂºn mÃƒÂ¡s rÃƒÂ¡pido como parte del request pipeline de las Minimal APIs.
