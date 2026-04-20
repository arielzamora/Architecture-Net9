# 04. Health Checks

## Resumen Ejecutivo
Expone endpoints dedicados a monitorear la salud (Liveness y Readiness) de la aplicaciÃƒÂ³n y dependencias externas.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
La soluciÃƒÂ³n Arquitectura de Referencia serÃƒÂ¡ expuesta a sistemas orquestadores cloud. Sin implementaciones de liveness y readiness, los sistemas de auto-healing y auto-scaling no podrÃƒÂ¡n operar con certidumbre.

## Tip de .NET 9
Aprovechar las mÃƒÂ©tricas integradas de OpenTelemetry incluidas nativamente junto con HealthChecks en .NET 9. Ahora las comprobaciones de estado emiten eventos OpenTelemetry sin configuraciones pesadas extra.
