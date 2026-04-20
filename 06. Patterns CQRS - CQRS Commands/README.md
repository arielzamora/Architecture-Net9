# 06. CQRS Commands

## Resumen Ejecutivo
Divide de forma radical las operaciones que leen datos (Queries) de aquellas que mutan o cambian el estado (Commands), asegurando el principio de Responsabilidad ÃƒÅ¡nica.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
En la Arquitectura de Referencia, las escrituras pueden volverse asÃƒÂ­ncronas para absorber latencias. Al separar explÃƒÂ­citamente quÃƒÂ© capa escribe, es muy fÃƒÂ¡cil transformar los Commands en mensajes de un broker y lograr escalabilidad elÃƒÂ¡stica.

## Tip de .NET 9
Usar Tipos Record y Structs (donde aplique) con inmutabilidad pura. El compilador en .NET 9 perfecciona la inicializaciÃƒÂ³n rÃƒÂ¡pida de objetos, reduciendo asignaciones GC al parsear JSON complex requests de Commands.
