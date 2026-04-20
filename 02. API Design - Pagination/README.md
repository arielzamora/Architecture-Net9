# 02. Pagination

## Resumen Ejecutivo
Protege el servidor procesando la consulta de grandes volÃƒÂºmenes de datos en pequeÃƒÂ±os lotes, reduciendo el consumo de I/O en la DB y el ancho de banda.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
En la app de nivel corporativo, los portales mostrarÃƒÂ¡n miles o millones de registros. La paginaciÃƒÂ³n en base de datos es un requerimiento innegociable antes de apuntar a la soluciÃƒÂ³n Target.

## Tip de .NET 9
El EF Core de .NET 9 ahora optimiza aÃƒÂºn mÃƒÂ¡s consultas dependientes `Skip()` y `Take()` mediante el compilador LINQ interno e incluye mejores soportes a nivel base de datos relacional para evitar ineficiencias de paginaciÃƒÂ³n lejana (Keyset Pagination recomendada).
