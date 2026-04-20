# 03. Entity Auditing

## Resumen Ejecutivo
Soluciona la problemÃƒÂ¡tica de rastreo de "QuiÃƒÂ©n creÃƒÂ³" o "QuiÃƒÂ©n modificÃƒÂ³" una entidad y el registro histÃƒÂ³rico automatizado interceptando la persistencia.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Arquitectura de Referencia va a demandar requerimientos corporativos estrictos de auditorÃƒÂ­a de usuarios y trazabilidad sobre cada cambio crÃƒÂ­tico por normativas que el cliente exigirÃƒÂ¡.

## Tip de .NET 9
Implementar EF Core `SaveChangesInterceptor` o los eventos del DbContext en su ÃƒÂºltima actualizaciÃƒÂ³n, los cuales aprovechan optimizaciones en modo pool de contextos (`DbContextPooling`) haciÃƒÂ©ndolo casi cero overhead histÃƒÂ³rico.
