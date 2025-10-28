# Resumen: Patrones de Diseño y Papers

## Patrones de Diseño

### Object Recursion
- **Intent**: Distribuir procesamiento de una solicitud sobre una estructura delegando polimórficamente
- **Ventajas**: 
  - Más encapsulación
  - Flexibilidad
- **Desventaja**: Aumenta la complejidad del programa

### State
- Declarar una instancia estado con claseState que contenga los diferentes estados posibles
- Delegar a la variable state los mensajes que necesiten saber qué estado es
- **Propósito**: Permite que un objeto altere su comportamiento cuando su estado interno cambia. Aparece como si el objeto cambiara su clase.

### Decorator
- **Intent**: Adjuntar responsabilidades adicionales a un objeto dinámicamente
- Proporciona alternativa flexible a la subclasificación para extender funcionalidad
- **Aplicación**: Cuando queremos añadir responsabilidades a objetos individuales, no a toda la clase
- **Transparencia**: Permite anidar decoradores recursivamente, permitiendo número ilimitado de responsabilidades
- **Mecanismo**: Coloca objetos dentro de wrappers especiales que contienen los comportamientos

### Adapter
- Patrón estructural que permite colaborar a objetos con interfaces incompatibles
- **Funcionamiento**: Transforma la interfaz de una clase existente (Adaptee) para ajustarse a la interfaz que espera el cliente (Target)

### Proxy
- Diseño estructural que proporciona sustituto o representante para controlar acceso
- **Rol**: Intermediario que controla acceso a objeto real
- **Beneficios**:
  - **Optimización**: Crear objetos solo cuando es necesario
  - **Seguridad**: Controlar acceso a objetos
  - Diferir creación hasta que sea necesario
  - Añadir funcionalidad adicional

### Composite
- Permite componer objetos en estructuras de árbol y trabajar con ellas como si fueran objetos individuales
- Similar a Object Recursion

### Visitor
- Separa algoritmos de los objetos sobre los que operan
- **Enfoque**: Colocar nuevo comportamiento en clase separada llamada visitor, en lugar de integrarlo en clases existentes
- **Mecanismo**: El objeto original se pasa a métodos del visitor como argumento, proporcionando acceso a todos los datos necesarios

### Observer
- Patrón de comportamiento que define mecanismo de suscripción para notificar múltiples objetos sobre eventos
- **Implementación**:
  1. Array field para almacenar lista de referencias a objetos suscriptores
  2. Métodos públicos para añadir y remover suscriptores de la lista

---

## Papers

### PaperPatternAbuser
- Desarrollador que abusa de patrones y sufre las consecuencias
- Crítica al uso excesivo e inapropiado de patrones de diseño

### Modern Software Engineering

#### Capítulo 1: Engineering - The Practical Application of Science
- **Software engineers** necesitan convertirse en expertos en aprender
- **Enfoque**: Progresar desde lo básico mediante experimentos informales y pequeños
- **Beneficios**:
  - Limita riesgo de conclusiones inapropiadas
  - Mejor trabajo mediante escepticismo y falsificación de ideas
  - Identificar y eliminar ideas malas rápidamente

**Definición**: Software engineering es la aplicación de enfoque empírico y científico para encontrar soluciones eficientes y económicas a problemas en software.

**Principios Fundamentales**:
- Desarrollo de software es siempre ejercicio de descubrimiento y aprendizaje
- Objetivo: ser "eficiente" y "económico"
- Habilidad de aprendizaje debe ser sustentable

**Objetivo**: Ser expertos en aprender y manejar complejidad

#### Técnicas para Expertos en Aprender
- Iteration
- Feedback  
- Incrementalism
- Experimentation
- Empiricism

#### Técnicas para Manejar Complejidad
- Modularity
- Cohesion
- Separation of Concerns
- Abstraction
- Loose Coupling

#### Herramientas Prácticas
- Testability
- Deployability
- Speed
- Controlling the variables
- Continuous delivery

**Engineering**: Proceso y práctica que aplicas para incrementar probabilidades de hacer buen trabajo

#### Capítulo 2: What is Engineering?
- **Definición**: Aplicación de enfoque empírico y científico para encontrar soluciones eficientes y económicas a problemas prácticos
- **Naturaleza**: Ciencia aplicada, por lo tanto práctica

#### Capítulo 3: Fundamentals of an Engineering Approach
- **Problema**: Dificultad para descartar malas ideas por falta de medición eficiente del desempeño
- **Fundamentos**:
  - Experts at Learning
  - Experts at Managing Complexity

---

## Respuesta de Alan Kay en Quora sobre Computer Science

### Definición de Ciencia
- Intento de detectar y reunir fenómenos para explicarlos mediante creación de modelos (teorías) que produzcan fenómenos similares
- Hacer esto de manera que supere las debilidades de nuestros sentidos y habilidades de pensamiento

### Ciencia de lo Artificial
- **Ejemplo**: Un puente construido exhala fenómenos que pueden ser estudiados, modelados y mejor comprendidos
- Crea "Ciencias de lo Artificial" - ciencias que surgen alrededor de artefactos que creamos
- **Ciclo virtuoso**: Mejor comprensión → mejores modelos → mejores diseños → nuevos fenómenos para estudiar

### Visión de Alan Perlis sobre Computer Science
- "La ciencia de procesos; todos los procesos"
- Podría haber dicho "La ciencia de sistemas; todos los sistemas"
- **Insight**: Algoritmos son parte pequeña de lo que es computing
- **Computing realmente trata de**: entender, inventar y construir sistemas

### Referencia Fundamental
- "Sciences of the Artificial" por Herb Simon

### Contexto Histórico (años 1980)
- Expansión de computación en academia sin suficientes profesores calificados
- **Cambio problemático**: Universidades se orientaron hacia formación vocacional y negocios, en lugar de entendimiento profundo de problemas complejos
- **Crítica**: "La computación no está siendo enseñada como un campo laboral real"
- **Contraste**: En física no solo ves F = ma, sino también quién lo descubrió y el contexto