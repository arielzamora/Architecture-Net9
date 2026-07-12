# ADR 004: Migración Estratégica Hacia el Framework .NET 9

## Contexto
Todos los repositorios base, módulos de Mediator CQRS (`06`) y servicios pasivos e iterativos de la plataforma (`07`), se concibieron durante estabilizaciones tecnológicas o versiones previas de .NET 6/7/8. Ante el ritmo avanzado impulsado por el equipo de ingeniería de Microsoft hacia entornos optimizados para Cloud-Native, continuar estancados en el runtime actual amenaza a la capacidad del ecosistema para integrar contenedores eficientes ("Cloud Economics") sin incurrir un sobredimensionamiento (overhead) de servidor respecto a memoria y tiempo de ruteo.

## Decisión
Hemos cerrado la decisión arquitectónica de someter el código existente a una migración técnica completa al framework **.NET 9**.
El enfoque se concentrará no solamente en ascender la versión LTS del paquete, sino en adoptar obligatoriamente las herramientas, lenguajes (C# 13) y perfiles del estándar nativo en pro de eficientizar el "Memory Footprint" y facilitar un menor coste por cómputo de host.

## Consecuencias
**Positivas:**
- Depuración drástica de verbosidad (Boilerplate): Incorporación estandarizada de **Primary Constructors**, lo cual reducirá la saturación actual en los Handlers de *MediatR*, erradicando constructores kilométricos y asimilando la inyección al encabezado de la de clase.
- Performance abrumadoramente superior usando el serializador ultra-afinado de `.NET 9` (`System.Text.Json`). Es crucial para una capa API que manipula y propaga DTOs gigantescos, superando ampliamente a los serializadores históricos con una latencia de parseo radicalmente inferior.
- Tiempos de arranque en el ecosistema Worker y Web API severamente disminuidos y una optimización sustancial de los recursos consumidos (*Memory footprint*), ideal de cara al deployment en clústeres elásticos manejados en K8S o esquemas Serverless donde el tiempo es facturable.

**Negativas:**
- Posible inestabilidad temporal o choque de versionados si librerías satélite de paquetes de terceros *(Third-Party Nugets)* no están debidamente ajustadas al estándar Core transversal que asume la revisión 9 del entorno.
- Precaución y rediseño imperativo: Dado el motor Native AOT fuertemente alentado actualmente por la plataforma para alcanzar esta compresión en la RAM, toda nuestra configuración basada en librerías que hacen "Reflection" dinámico intenso durante tiempo de ejecución (como los Handlers de `MediatR` descubiertos mediante *Assembly Scanning*) podrán requerir una evaluación y cambio hacia registros fuertemente estáticos o Generadores de Fuentes en compilación (*Source Generators*) para no caer mutilados por el Trimmer.

## Referencias / Enlaces
- Relativos a la saturación visual que requiere uso de Primary Constructors documentado en ref: `/06. Patterns CQRS - CQRS Mediator Pipeline/DETALLE_TECNICO.md` y estructura de directorios en `06`.