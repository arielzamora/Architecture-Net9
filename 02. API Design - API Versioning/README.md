# 02. API Versioning

## Resumen Ejecutivo
Maneja el ciclo de vida de los endpoints, permitiendo la evoluciÃƒÂ³n de contratos (DTOs) sin romper los clientes actuales, implementando versionado por URL, Header o Query String.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
La soluciÃƒÂ³n final consumida por los sistemas corporativos (Target) cambiarÃƒÂ¡ con el tiempo. El versionado garantiza que la adopciÃƒÂ³n de Arquitectura de Referencia sea sin fricciÃƒÂ³n backward-incompatible para sus consumidores.

## Tip de .NET 9
Con .NET 9, el soporte de versionamiento viene nativamente robustecido en conjunciÃƒÂ³n con los nuevos esquemas para OpenAPI endpoints automÃƒÂ¡ticos en Minimal APIs, facilitando mapear `MapGroup("/v{version:apiVersion}")`.
