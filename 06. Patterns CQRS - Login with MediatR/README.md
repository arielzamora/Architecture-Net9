# 06. Login with MediatR

## Resumen Ejecutivo
Delega una operación usualmente atada al controlador HTTP (como generar un Token JWT y validar una password) en un ciclo de vida `IRequestHandler` interno tipo (Query = "Dame un Token JWT válido para este User/Pass").

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## Tip de .NET 9
Implementar la modernizada API pura de JsonWebTokens de framework para modelar firmas criptográficas sin la penalización histórica en el thread que traía el viejo pipeline JwtSecurityTokenHandler incorporando mayor escalabilidad.