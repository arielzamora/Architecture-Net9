# ADR 002: Adopción de Dapper para Acceso Ultrarrápido a Datos

## Contexto
El flujo principal del e-commerce requiere un acceso masivo y en un tiempo extra-reducido para los listados, proyecciones en catálogos y reportes. ORM's robustos y tradicionales como Entity Framework Core, pese a ser formidables para trackear estados y transacciones ricas, traen consigo una sobrecarga imperativa por la traducción SQL y el mapeo ("State-Tracking"). Para los requerimientos estrictos de SLA de la plataforma, esto representaba un impacto notable en latencia.

## Decisión
Hemos decidido utilizar **Dapper** (Micro ORM) inyectado mediante `IDbConnection` para todas nuestras proyecciones directas en los repositorios del sistema.
Adicionalmente, se envuelve la conexión subyacente con un patrón `DapperContext`, asegurando la inyección confiable de dependencias y el control del ciclo vital de cada conexión a la base de datos SQL.

## Consecuencias
**Positivas:**
- Rapidez de ejecución "Close-To-Metal": Al evitar rastrear estados y obviar árboles lógicos masivos, Dapper ejecuta "Stored Procedures" y sentencias en la DB de forma casi inmediata e interacciona rápidamente con memoria.
- Fácil mapeo dinámico de objetos gracias a los "extensions methods" (`QuerySingle<T>`, `Query<T>`).
- Acople perfecto con arquitectura de *CQRS*: Implementamos este Micro-ORM solo en las queries veloces de lectura, reteniendo un modelo transaccional si hiciera falta para las estructuras de comandos persistentes.

**Negativas:**
- Ausencia de soporte nativo LINQ frente a la base de datos; exige el llamado a queries explícitas de SQL o Procedimientos Almacenados, lo cual crea un pequeño grado de acoplamiento al SGBD físico.
- No dispone de migraciones del estilo EF Core para crear schemas desde el código (Code-First).

## Referencias / Enlaces
- Archivos clave: `DapperContext.cs`, implementaciones como `CustomersRepository.cs`.
- Implementado concretamente en Repositorios presentes en: `/06. Patterns CQRS - CQRS Mediator Pipeline/Pacagroup.Ecommerce.Persistence/`