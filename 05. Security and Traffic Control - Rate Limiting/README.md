# 05. Rate Limiting

## Resumen Ejecutivo
Protege a la aplicaciÃƒÂ³n de ataques de denegaciÃƒÂ³n de servicio (DDoS) y del uso excesivo acaparando recursos limitando los requests por usuario/token.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
La Target Architecture serÃƒÂ¡ multicliente expuesto pÃƒÂºblicamente. Sin Rate Limit, un pico anÃƒÂ³malo de trÃƒÂ¡fico o bots podrÃƒÂ­a saturar de mensajes residuales el Service Bus (RabbitMQ) de nuestro backend.

## Tip de .NET 9
El paquete nativo optimizado en .NET 9 (`Microsoft.AspNetCore.RateLimiting`) soporta Concurrency Limits y Token Buckets directamente conectados a los Claims del usuario web limitando las necesidades de gateways de firewall externos temporales en staging.
