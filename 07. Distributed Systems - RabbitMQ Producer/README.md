# 07. Distributed Systems - RabbitMQ Producer

## Resumen Ejecutivo
Representa al emisor de la arquitectura asíncrona. En vez de conectarse lento y sincrónico al receptor vía HttpClient, expulsa un Evento (Fire-And-Forget Message AMQP) garantizando desacoplamiento en tiempo para flujos pesados.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## Tip de .NET 9
Existen eficiencias de Channel Dispatchers (buffering con Channels integrados directos) que permiten enviar Micro-Batches a las colas, permitiendo soportar ráfagas violentas de eventos con la mitad de consumo de CPU al delegarlo a nivel Kernel.