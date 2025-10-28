# Resumen Papers Ingeniería De Software

## Programming as Theory Building

**Tesis Principal**: El trabajo del diseñador no es transmitir el diseño, sino las teorías que impulsan al diseño.

### Conceptos Clave
- **Programación como construcción de teoría**: La programación es el diseño e implementación de soluciones
- **Documentación secundaria**: La teoría de un programa no se puede transmitir completamente desde la documentación
- **Teoría implica explicación**: Tener una teoría implica no solo saber hacer algo, sino también poder explicarlo y justificarlo

### Ciclo de Vida del Software
- **Modificaciones correctas**: Solo posibles si el programador entiende la teoría subyacente
- **Vida del programa**: Existe mientras un equipo con la teoría esté activo y controle las modificaciones
- **Status del programador**: Deben ser considerados profesionales responsables, no componentes reemplazables

---

## The Design Of Everyday Things

### Principios de Buen Diseño
- **Visibilidad**: Las partes deben ser visibles y comunicar su función
- **Modelo Conceptual**: Debe permitir a los usuarios predecir resultados de sus acciones
- **Retroalimentación**: Crucial para que usuarios comprendan el éxito de sus acciones
- **Psicología del usuario**: El diseño debe considerar cómo piensan los usuarios

**Problema**: Objetos mal diseñados carecen de pistas sobre su funcionamiento

---

## Self: Lenguaje de Programación

### Características Principales
- **Orientado a objetos** para programación exploratoria
- **Basado en prototipos**, no en clases

### Conceptos Fundamentales
1. **Prototipos**: 
   - Objetos se crean clonando otros existentes
   - Herencia mediante punteros a objetos padres

2. **Slots**:
   - Combinan variables y procedimientos
   - No distinción entre estado y comportamiento

3. **Eliminación de clases y variables**:
   - Evita regresión infinita de metaclases
   - Cualquier objeto puede ser instancia o repositorio

4. **Acceso mediante mensajes**: En lugar de variables directas

---

## Design Principles Behind Smalltalk

### Filosofía de Diseño
- **Sencillez**: Sistema debe ser entendible y manejable por una persona
- **Consistencia**: Todas las partes deben ser consistentes y generales

### Principios Específicos
- **Alineación con pensamiento humano**
- **Todo es objeto** que se comunica mediante mensajes
- **Modularidad**: Componentes no deben depender de detalles internos
- **Clasificación**: Agrupar objetos similares
- **Polimorfismo**: Especificar comportamiento sin imponer representación
- **Factorización**: Componentes independientes en un único lugar
- **Reaprovechamiento**: Diseño bien factorizado permite reutilización
- **Interfaz flexible y reactiva**

---

## No Silver Bullet

### Tesis Principal
No existe solución mágica que mejore radicalmente productividad, simplicidad o fiabilidad en ingeniería de software.

### Clasificación de Dificultades
- **Esenciales**: Problemas intrínsecos (complejidad, cambiabilidad...)
- **Accidentales**: No inherentes al software

### Mejoras Accidentales Exitosas
- Lenguajes de alto nivel
- Cambios instantáneos
- Ambientes de programación

### Promesas Tecnológicas Evaluadas
- Lenguajes de programación avanzados
- Programación orientada a objetos
- Inteligencia artificial y sistemas expertos
- Programación automática

---

## Polymorphic Hierarchy

### Enfoque en Métodos
- Las descripciones deben dividirse en: **propósito** e **implementación**
- **Subclases**: Deben considerar cómo difieren de la superclase, no solo cómo funcionan
- **Objetivo compartido**: Sub implementador debe tener mismo objetivo que super implementador

### Beneficios del Polimorfismo Real
- Métodos comparten **propósitos y comportamientos**
- **Interfaz polimórfica común** mejora reutilización
- Sistema más **flexible, extensible y entendible**

---

## Null Object Pattern

### Propósito Principal
Proporcionar un sustituto que comparte la misma interfaz pero no realiza ninguna acción.

### Aplicabilidad
- Cuando un objeto requiere colaborador pero algunas instancias no deben hacer nada
- Para definir jerarquías de clases reales/nulas
- Simplificar código del cliente evitando casos especiales
- Encapsular código de "no hacer nada"

### Beneficios
- **Encapsulación** de decisiones de implementación
- **Localización y reutilización** facilitadas

---

## Double Dispatch

### Técnica
- **Primera distribución**: Método se distribuye por tipo del receptor
- **Segunda distribución**: Receptor envía mensaje basado en tipo del argumento

### Ventaja
- Ambas variables polimórficas se manejan mediante envío de mensajes
- **Sin comprobaciones de tipos explícitas**
- Smalltalk hace el chequeo de tipos automáticamente

---

# Segunda Parte: Patrones de Diseño

## Object Recursion Pattern

### Intent
Distribuir procesamiento de una solicitud sobre una estructura delegando polimórficamente.

### Características del Sistema
- **Dos clases polimórficas**: 
  - Una maneja solicitud recursivamente
  - Otra maneja sin recursión
- **Mensaje separado** en tercera clase no polimórfica para iniciar solicitud

### Aplicabilidad
- Pasar mensaje través de estructura enlazada con destino desconocido
- Broadcast de mensaje a todos los nodos
- Distribuir responsabilidad del comportamiento

### Participantes
- **Initiator (client)**: Inicia la solicitud
- **Handler (comparable)**: Tipo que puede manejar solicitudes
- **Recurser**: 
  - Define enlace sucesor
  - Delega solicitud a sucesores
  - Puede realizar comportamiento extra
- **Terminator**: Implementa completamente sin delegar

### Ventajas
- **Procesamiento distribuido**
- **Flexibilidad de responsabilidad**
- **Flexibilidad de roles**
- **Aumento de encapsulación**

### Desventajas
- **Complejidad de programación**
- Dificultad conceptual de recursión

### Consideraciones de Implementación
1. **Tipo Initiator separado**: No debe ser polimórfico con Recursor
2. **Definición de sucesor**: Recurser necesita sucesores, Terminator no

---

## State Pattern

### Idea
Para una clase, declarar instancia `state` con `claseState` que tenga diferentes estados posibles. Delegar mensajes que necesiten saber el estado.

### Aplicabilidad
- Comportamiento depende del estado y debe cambiar en runtime
- Operaciones tienen condicionales grandes multiparte que dependen del estado

### Colaboraciones
- **Context** delega solicitudes específicas de estado al ConcreteState actual
- Context puede pasarse como argumento al State object
- **Context** es interfaz primaria para clientes
- Context o ConcreteState pueden decidir transiciones de estado

### Consecuencias
1. **Localiza comportamiento específico de estado**
2. **Hace transiciones de estado explícitas**
3. **State objects pueden ser compartidos**

### Implementación
- **Transiciones de estado**: Generalmente mejor que las subclases State especifiquen su estado sucesor
- **Alternativa tabular**: Mapea inputs a estados sucesores
  - **Ventaja**: Regularidad
  - **Desventajas**: Menos eficiente, menos explícito, difícil añadir acciones
- **Creación/destrucción de objetos State**:
  - Crear cuando se necesitan vs crear por adelantado
- **Herencia dinámica**: No posible en la mayoría de lenguajes

---

## Decorator Pattern

### Intent
Añadir responsabilidades a un objeto dinámicamente. Alternativa flexible a subclases.

### Motivación
- Añadir responsabilidades a objetos individuales, no a toda la clase
- **Enfoque más flexible**: Encerrar componente en otro objeto que añade funcionalidad
- **Transparencia**: Decorator conforma a interfaz del componente
- **Anidamiento recursivo**: Permite número ilimitado de responsabilidades añadidas

### Aplicabilidad
- Añadir responsabilidades dinámicamente y transparentemente
- Para responsabilidades que pueden ser retiradas
- Cuando extensión por subclases es impracticable

### Consecuencias
1. **Más flexibilidad que herencia estática**
2. **Enfoque "paga por lo que usas"**
3. **Decorator y componente no son idénticos** - no confiar en identidad de objeto
4. **Muchos objetos pequeños**

### Implementación
1. **Conformidad de interfaz**: Decorator debe conformar a interfaz del componente
2. **Omitir clase Decorator abstracta** cuando solo se necesita una responsabilidad
3. **Componentes livianos**: Componentes y decoradores deben descender de clase Component común
4. **Skin vs guts**: 
   - Decorator como "skin" que cambia comportamiento
   - **Strategies** mejor opción cuando Component es intrínsecamente pesado

---

## Adapter Pattern (Wrapper)

### Intent
Convertir interfaz de una clase en otra que los clientes esperan, permitiendo que clases con interfaces incompatibles trabajen juntas.

### Motivación
- Clase no reutilizable porque su interfaz no coincide con lo necesario
- Adaptar clase sin modificarla directamente

### Formas de Implementación
- **Adapter de clase**: Usa herencia múltiple
- **Adapter de objeto**: Usa composición, contiene instancia del objeto a adaptar

### Aplicabilidad
- Reutilizar clase existente con interfaz incompatible
- Crear clase reutilizable que funcione con clases no relacionadas

### Estructura
- **Target**: Interfaz que cliente espera
- **Client**: Interactúa a través del Target
- **Adaptee**: Clase existente que necesita adaptación
- **Adapter**: Adapta interfaz del Adaptee al Target

### Consecuencias
- **Class adapter**:
  - Compromete a clase Adapter concreta
  - No funciona para adaptar clase y todas sus subclases
  - Permite override de comportamiento
- **Object adapter**:
  - Un Adapter funciona con muchos Adaptees
  - Más difícil override de comportamiento

### Implementación
- **Pluggable adapters**: Encontrar interfaz "estrecha" de Adaptee
- **Enfoques**:
  - Operaciones abstractas
  - Objetos delegate
  - Adapters parametrizados (común en Smalltalk)

---

## Proxy Pattern

### Intent
Proporcionar sustituto o representante para otro objeto para controlar su acceso.

### Motivación
- **Objetos costosos**: Crear bajo demanda (ej: imágenes grandes en editor)
- **Proxy como marcador de posición**: Crea objeto real solo cuando es necesario

### Aplicabilidad
- **Proxy remoto**: Objeto en espacio de memoria diferente (red)
- **Proxy virtual**: Crea objetos costosos bajo demanda
- **Proxy de protección**: Controla acceso verificando permisos
- **Referencia inteligente**: Puntero mejorado (cuenta referencias, carga bajo demanda)

### Colaboraciones
- Proxy crea y mantiene referencia al objeto real (RealSubject)
- Redirige solicitudes al objeto real cuando es necesario

### Consecuencias
- **Capa de indirección** que permite:
  - Optimización: Crear objetos cuando se necesitan
  - Seguridad: Controlar acceso
  - Mejor gestión de recursos: "copy-on-write"