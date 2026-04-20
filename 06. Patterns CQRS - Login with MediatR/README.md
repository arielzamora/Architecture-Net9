# 06. Login with MediatR

## Resumen Ejecutivo
Delega una operaciÃƒÂ³n usualmente atada al controlador HTTP (como generar un Token JWT y validar una password) en un ciclo de vida `IRequestHandler` interno tipo (Query = "Dame un Token JWT vÃƒÂ¡lido para este User/Pass").

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
PreparaciÃƒÂ³n fundamental. Trasladar el login a la lÃƒÂ³gica interna de la aplicaciÃƒÂ³n abstrae el gateway. En un futuro, The Arquitectura de Referencia Arch Target podrÃƒÂ­a sustituir el handler por un simple redirect request a Duende IdentityServer u OAuth2 Cloud, alterando 0% la capa HTTP.

## Tip de .NET 9
Implementar la modernizada API pura de JsonWebTokens de framework para modelar firmas criptogrÃƒÂ¡ficas sin la penalizaciÃƒÂ³n histÃƒÂ³rica en el thread que traÃƒÂ­a el viejo pipeline JwtSecurityTokenHandler incorporando mayor escalabilidad.
