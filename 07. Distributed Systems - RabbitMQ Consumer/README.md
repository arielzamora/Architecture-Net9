# 07. Distributed Systems - RabbitMQ Consumer

## Resumen Ejecutivo
Escucha de forma perpetua (Background Worker Service) la cola AMQP de RabbitMQ, atrayendo tareas como notificaciones complejas, envÃƒÂ­o de PDFs, cÃƒÂ¡lculos de stock y confirmando al Broker (ACK) que finalizÃƒÂ³ el procesamiento con ÃƒÂ©xito.

## Diagrama C4 Nivel 2 (Contenedores)
![](./diagrama_1.png)

## ConexiÃƒÂ³n con el Objetivo (99. Target Architecture)
Los "Workers Node" de la Arquitectura de Referencia serÃƒÂ¡n instancias completamente separadas y autoscaladas. En vez de escalar los costosos Web API (HTTP), escalamos ÃƒÂºnicamente los micro-nodos consumidores que procesan background intensivo sin lÃƒÂ­mite artificial.

## Tip de .NET 9
La implementaciÃƒÂ³n de `IHostedLifecycleService` introduce ganchos (hooks) como Starting, Started, Stopping y Stopped, dÃƒÂ¡ndonos el superpoder de pausar cordialmente la cola y drenar los Workers en caso de una cancelaciÃƒÂ³n controlada (Kubernetes Terminate Signal).
