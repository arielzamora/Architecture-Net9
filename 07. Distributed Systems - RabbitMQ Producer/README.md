# 07. Distributed Systems - RabbitMQ Producer

## Resumen Ejecutivo
Representa al emisor de la arquitectura asÃƒÂ­ncrona. En vez de conectarse lento y sincrÃƒÂ³nico al receptor vÃƒÂ­a HttpClient, expulsa un Evento (Fire-And-Forget Message AMQP) garantizando desacoplamiento en tiempo para flujos pesados.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Crucial para la estabilidad corporativa y la absorciÃƒÂ³n de Black Fridays / picos intensivos. La API "Target Arquitectura de Referencia" debe liberar la conexiÃƒÂ³n del cliente velozmente y no quedarse trabada bloqueando Threads del servidor enviando correos o calculando mÃƒÂ©tricas.

## Tip de .NET 9
Existen eficiencias de Channel Dispatchers (buffering con Channels integrados directos) que permiten enviar Micro-Batches a las colas, permitiendo soportar rÃƒÂ¡fagas violentas de eventos con la mitad de consumo de CPU al delegarlo a nivel Kernel.
