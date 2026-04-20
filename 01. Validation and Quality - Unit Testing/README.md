# 01. Unit Testing

## Resumen Ejecutivo
Implementa pruebas de asilamiento para asegurar la calidad de la lÃƒÂ³gica de negocio y validaciÃƒÂ³n, evitando regresiones (generalmente con xUnit, NSubstitute y Moq).

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Todo mÃƒÂ³dulo construido hacia la soluciÃƒÂ³n Target de Arquitectura de Referencia debe mantener un alto nivel de cobertura. En la arquitectura distribuida, el testing aislarÃƒÂ¡ completamente los handlers y workers sin depender de la base de datos real.

## Tip de .NET 9
.NET 9 introduce mejoras sustanciales en `MSTest.Sdk` y tiempos de ejecuciÃƒÂ³n del testing paralelo, recomendando el uso nativo de caracterÃƒÂ­sticas de fake-time `TimeProvider` para probar lÃƒÂ³gicas asÃƒÂ­ncronas o demoradas.
