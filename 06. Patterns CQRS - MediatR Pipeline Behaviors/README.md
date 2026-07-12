# 06. MediatR Pipeline Behaviors

## Resumen Ejecutivo
Lleva AOP (Aspect Oriented Programming) a nivel aplicativo, permitiendo aplicar "middlewares lógicos" transaccionales (como Logging global de latencias, Transaction Tracking DB UnitOfWork) a cualquier Comando invocado.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## Tip de .NET 9
Los `LoggerMessageAttribute` integrados permiten que los Logs emitidos en comportamientos globales sean precompilados mediante el generador de origen (`AOT friendly`), alcanzando latencias inperceptibles incluso para los flujos de rastreo más intensos.