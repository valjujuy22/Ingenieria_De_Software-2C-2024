# Resumen de Ingeniería de Software

## Programa de la Materia
- Paradigma fundacional (Smalltalk)
- Diseño de Objetos
- Técnicas de diseño
- Refactorings automatizados
- TDD (Test-Driven Development)
- Arquitectura

## ¿Qué es el Software?

### Definición Clásica
Secuencia de instrucciones que dado un input devuelve un output

### Definición de la Materia
Modelo computable de un dominio de problema de la realidad

## Características de un Buen Modelo
- **Eje funcional**: que tan buena es la representación
- **Eje descriptivo**
- **Eje implementativo**
- Debe mantener la semántica de lo que representa
- Debe mantener una relación 1 a 1 con los elementos del dominio del problema

## Definiciones y Recordatorios

- **Prototipo**: objeto que existe de la nada, sin categoría
- **#**: para definir mensajes
- **Métodos y mensajes no son lo mismo**
- **Colaborador**: variable de un objeto
- Usamos `*` para darle una unidad a una cantidad
- **Orden de evaluación**: unarios, binarios y keywords
- **Todo es un objeto**

## Definiciones Importantes

- **Programa**: objetos que colaboran enviando mensajes
- **Objeto**: representación esencial de un ente del dominio del problema, a partir de los mensajes que sabe responder
- **Mensaje**: (el qué), define qué representa un objeto
- **Método**: conjunto de colaboraciones (el cómo)
- **Colaboración**: el hecho de enviarle un mensaje a otro

## Características de la Comunicación entre Objetos

- **Sincrónico**: objeto en un mensaje espera
- **Dirigida**: objeto envía mensaje a otro solo si lo conoce
- Siempre existe resultado para un mensaje
- El receptor desconoce al emisor

> **Smalltalk no es un lenguaje, es un ambiente de Objetos**

## Conceptos Fundamentales

### Acoplamiento
Es qué tan relacionado está un objeto con otro. Siempre buscamos el mínimo posible. Si hay muchos objetos acoplados, un cambio se vuelve mucho más complicado.

### Cohesión
(Casi inversa al acoplamiento) La forma más acotada de representar el dominio del problema.

## Diseño

- No hay reglas ni principios, hay heurísticas
- Es un trade off constante (entre semántica y funcionalidad)
- **Criterio para saber si un mensaje pertenece a la esencia de un objeto**: si no lo podemos sacar
- **Relación de conocimiento**: la manera en la que un objeto conoce a su colaborador

## Conceptos de Smalltalk

- **Variable**: el nombre de un objeto
- **PseudoVariables**: variables que no es necesario definirlas, ni inicializarlas (`self`, `thisContext` y `super`)
- **Igualdad** (`=`): dos objetos pueden ser iguales si representan lo mismo
- **Identidad** (`==`): dos objetos pueden no ser idénticos, si están en el mismo lugar de memoria (son lo mismo)
- **Refactoring**: cambio de diseño sin cambiar resultado de ejecución

## Código Repetido

### Definición
Patrones de colaboración duplicados

### Beneficios al Eliminarlo
Al sacar código repetido aumentamos la declaratividad (Agregar semántica). Muchas veces queremos sacar código repetido solo para aumentar declaratividad.

### Pasos para Sacar Código Repetido
1. Mover el código repetido a una nueva abstracción
2. Parametrizar lo que cambia
3. Poner nombre a la abstracción
4. Reemplazar en el código

## Heurísticas de Diseño

- Los objetos deben ser nombrados por el rol que cumplen en el contexto que están siendo nombrados
- Cada vez que creamos un objeto verificar que es válido, los objetos nos tienen que enseñar cómo los tenemos que usar
- Favorecer el uso de objetos inmutables (solo cuando lo que representa es inmutable)
- No usar nil (objeto esquizofrénico)
- Evitar getters y setters (rompemos encapsulamiento) - si el objeto que devuelvo es inmutable no hay ningún problema
- Modificaciones atómicas (setter pero que modifica todo el objeto de una)

## Técnica para Sacar IFs

### Reglas
1. Crear jerarquía polimórfica con una clase por cada condición de if (opcional)
2. Mover cuerpo del if a cada nueva clase usando el mismo nombre del mensaje
3. Nombrar las abstracciones
4. Nombrar el mensaje
5. Reemplazar ifs por envío de mensaje polimórfico
6. Buscar el objeto polimórfico

## TDD (Test-Driven Development)
Mencionado como parte fundamental del programa de la materia.