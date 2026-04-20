# ADR 002: AdopciÃ³n de Dapper para Acceso UltrarrÃ¡pido a Datos

## Contexto
El flujo principal del e-commerce requiere un acceso masivo y en un tiempo extra-reducido para los listados, proyecciones en catÃ¡logos y reportes. ORM's robustos y tradicionales como Entity Framework Core, pese a ser formidables para trackear estados y transacciones ricas, traen consigo una sobrecarga imperativa por la traducciÃ³n SQL y el mapeo ("State-Tracking"). Para los requerimientos estrictos de SLA de la plataforma, esto representaba un impacto notable en latencia.

## DecisiÃ³n
Hemos decidido utilizar **Dapper** (Micro ORM) inyectado mediante `IDbConnection` para todas nuestras proyecciones directas en los repositorios del sistema.
Adicionalmente, se envuelve la conexiÃ³n subyacente con un patrÃ³n `DapperContext`, asegurando la inyecciÃ³n confiable de dependencias y el control del ciclo vital de cada conexiÃ³n a la base de datos SQL.

## Consecuencias
**Positivas:**
- Rapidez de ejecuciÃ³n "Close-To-Metal": Al evitar rastrear estados y obviar Ã¡rboles lÃ³gicos masivos, Dapper ejecuta "Stored Procedures" y sentencias en la DB de forma casi inmediata e interacciona rÃ¡pidamente con memoria.
- FÃ¡cil mapeo dinÃ¡mico de objetos gracias a los "extensions methods" (`QuerySingle<T>`, `Query<T>`).
- Acople perfecto con arquitectura de *CQRS*: Implementamos este Micro-ORM solo en las queries veloces de lectura, reteniendo un modelo transaccional si hiciera falta para las estructuras de comandos persistentes.

**Negativas:**
- Ausencia de soporte nativo LINQ frente a la base de datos; exige el llamado a queries explÃ­citas de SQL o Procedimientos Almacenados, lo cual crea un pequeÃ±o grado de acoplamiento al SGBD fÃ­sico.
- No dispone de migraciones del estilo EF Core para crear schemas desde el cÃ³digo (Code-First).

## Referencias / Enlaces
- Archivos clave: `DapperContext.cs`, implementaciones como `CustomersRepository.cs`.
- Implementado concretamente en Repositorios presentes en: `/06. Patterns CQRS - CQRS Mediator Pipeline/Pacagroup.Ecommerce.Persistence/`
