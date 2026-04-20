# 04. Redis Health Check

## Resumen Ejecutivo
SupervisiÃƒÂ³n del CachÃƒÂ© Distribuido (Redis), detectando mediante un Heartbeat si la degradaciÃƒÂ³n de performance se debe a pÃƒÂ©rdida de conexiÃƒÂ³n e informando el estatus general.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Que falle Redis requerirÃƒÂ¡ un patrÃƒÂ³n circuit-breaker para pasar directo a la base de datos relacional. El Health check avisa a los orquestadores de la intermitencia en el cluster distribuido de Arquitectura de Referencia.

## Tip de .NET 9
Incorporar a Redis dentro del ecosistema modernizado de .NET Aspire, orquestando este servicio con mÃƒÂ©tricas de salud automÃƒÂ¡ticas preconfiguradas AOT.
