# ADR 004: MigraciÃ³n EstratÃ©gica Hacia el Framework .NET 9

## Contexto
Todos los repositorios base, mÃ³dulos de Mediator CQRS (`06`) y servicios pasivos e iterativos de la plataforma (`07`), se concibieron durante estabilizaciones tecnolÃ³gicas o versiones previas de .NET 6/7/8. Ante el ritmo avanzado impulsado por el equipo de ingenierÃ­a de Microsoft hacia entornos optimizados para Cloud-Native, continuar estancados en el runtime actual amenaza a la capacidad del ecosistema para integrar contenedores eficientes ("Cloud Economics") sin incurrir un sobredimensionamiento (overhead) de servidor respecto a memoria y tiempo de ruteo.

## DecisiÃ³n
Hemos cerrado la decisiÃ³n arquitectÃ³nica de someter el cÃ³digo existente a una migraciÃ³n tÃ©cnica completa al framework **.NET 9**.
El enfoque se concentrarÃ¡ no solamente en ascender la versiÃ³n LTS del paquete, sino en adoptar obligatoriamente las herramientas, lenguajes (C# 13) y perfiles del estÃ¡ndar nativo en pro de eficientizar el "Memory Footprint" y facilitar un menor coste por cÃ³mputo de host.

## Consecuencias
**Positivas:**
- DepuraciÃ³n drÃ¡stica de verbosidad (Boilerplate): IncorporaciÃ³n estandarizada de **Primary Constructors**, lo cual reducirÃ¡ la saturaciÃ³n actual en los Handlers de *MediatR*, erradicando constructores kilomÃ©tricos y asimilando la inyecciÃ³n al encabezado de la de clase.
- Performance abrumadoramente superior usando el serializador ultra-afinado de `.NET 9` (`System.Text.Json`). Es crucial para una capa API que manipula y propaga DTOs gigantescos, superando ampliamente a los serializadores histÃ³ricos con una latencia de parseo radicalmente inferior.
- Tiempos de arranque en el ecosistema Worker y Web API severamente disminuidos y una optimizaciÃ³n sustancial de los recursos consumidos (*Memory footprint*), ideal de cara al deployment en clÃºsteres elÃ¡sticos manejados en K8S o esquemas Serverless donde el tiempo es facturable.

**Negativas:**
- Posible inestabilidad temporal o choque de versionados si librerÃ­as satÃ©lite de paquetes de terceros *(Third-Party Nugets)* no estÃ¡n debidamente ajustadas al estÃ¡ndar Core transversal que asume la revisiÃ³n 9 del entorno.
- PrecauciÃ³n y rediseÃ±o imperativo: Dado el motor Native AOT fuertemente alentado actualmente por la plataforma para alcanzar esta compresiÃ³n en la RAM, toda nuestra configuraciÃ³n basada en librerÃ­as que hacen "Reflection" dinÃ¡mico intenso durante tiempo de ejecuciÃ³n (como los Handlers de `MediatR` descubiertos mediante *Assembly Scanning*) podrÃ¡n requerir una evaluaciÃ³n y cambio hacia registros fuertemente estÃ¡ticos o Generadores de Fuentes en compilaciÃ³n (*Source Generators*) para no caer mutilados por el Trimmer.

## Referencias / Enlaces
- Relativos a la saturaciÃ³n visual que requiere uso de Primary Constructors documentado en ref: `/06. Patterns CQRS - CQRS Mediator Pipeline/DETALLE_TECNICO.md` y estructura de directorios en `06`.
