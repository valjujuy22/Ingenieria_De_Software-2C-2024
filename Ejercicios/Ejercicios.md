# INGE clases y practica

## Guia de ejercicios. Parte 1. Sección 2

0.debugger

0.1. identificar y nombrar las diferentes partes y secciones del debugger
-stackframe: el arbol de llamadas que se ejecutan hasta el error
-workspace 
-herramientas: browse, senders, implementors
-información sobre el objeto
-información sobre el contexto

0.2. 
-into: se mete dentro de los objetos
-over: pasa por arriba de los objetos
-through: lo mismo que over????
-al recorrer el codigo con into hasta la ultima linea de m2 y apretar restart el debugger se ubica nuevamente en la primera linea de m2
-restart: retorna el debugger a la primera posicion dentro del codigo actual visto en pantalla  

### 1.Colecciones

1.1.
a- sintaxis para crear arrays
x:= #(1 2 3 4)
y:= Array with: 1 with: 2 with: 3 with: 4

-cuando intento agregar una posicion usando add: se rompe
-y at: 1 put: 42 . sale todo bien

b- ordered collections
- x:= OrderedCollection with: 4 with: 3 with: 2 with:1
-x add: 2 se rompe ??? parece que no estaba seleccionand todo al testetarlo. error de novato

c- sets
-x:= Set with: 4 with: 3 with: 2 with:1
-se me rompe cuando trato de agregar???
d- dictionary
x := Dictionary new
x add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.


-???????????????????



1.2. 
e- convertir array en OrderedCollection
 |x y|
x:= #(1 2 3 4).
y := x asOrderedCollection

convertir array en Set
|x y|
x:= #(1 2 3 4).
y := x asSet

f- Set a Array
x := Set with: 4 with: 3 with: 2 with:1.
x asArray 

g- convertir el diccionario del punto c a array retorno un array con todos los elems de el dicc


1.3.  crear una secuencia de colaboraciones para encontrar los elms impares de un arreglo
|elements index odds|
elements := #(1 2 5 6 9).
odds := OrderedCollection new.
index := 1.
[index < elements size]
whileTrue: [
	((elements at: index) odd) ifTrue: [odds add: (elements at: index)].
	index := index + 1.
	]
^odds

1.7. enumerar los problemas que tiene este algoritmo
????????????

1.8. convertir el codigo de 1.3 (creo) sin usar #whileTrue, en cambio #do:

|elements odds|
elements := #(1 2 5 3 9).
odds := OrderedCollection new.
elements do: [:each | 
	(each odd) ifTrue: [odds add: each].
	].
^odds 
|
la ventaja es que nos queda un codigo mucho mas simple


1.9.
|elements odds|
elements := #(1 2 5 3 9).
odds := OrderedCollection new.
odds := elements select: [:each | each odd].
^odds 
codigo aun mas compacto

1.10. 
|elements odds|
elements := #(1 2 5 3 9).
odds := OrderedCollection new.
elements do: [:each | odds add: (each * 2)].
^odds 

1.11. muy similar al ejercicio 1.8 y 1.9, los resultados se acumularian en odds

1.12. 
|elements |
elements := #(1 2 5 3 9).
elements := elements * 2.
^elements

1.13. dado un array devolver el primer numero par
hacerlo con whileTrue  es muy similar, lo hago  do
|elements |
elements := #(1 5 3 9).
elements do: [:each | 
	((each + 1) odd) ifTrue: [^each].
	].
^nil

con otro
………

1.14. devuelve nil
1.15. 
|elements |
elements := #(1 5 3 9).
elements do: [:each | 
	((each + 1) odd) ifTrue: [^each].
	].
self error: 'no hay pares'.

1.16. sumar coleccion
-con do
|coleccion suma|
coleccion := #(5 5 5 5 5).
suma := 0.
coleccion do: [:each | suma := suma + each ].
^suma

-con sum
|coleccion |
coleccion := #(5 5 5 5 5).
^coleccion sum

-con inject:into:
|coleccion |
coleccion := #(5 5 5 5 5).
^coleccion inject: 0 into: [:subTotal :next | subTotal + next].

1.17. recibe dos colaboradores inject:into:
self halt habre el debugger

1.18. extraer las vocales de un string en el orden en que aparecen
-con do
|cadena vocales|
cadena := 'viva la vida'.
vocales := ''.
cadena do: [:each | (each isVowel) ifTrue: [vocales := vocales copyWith: each]].
^vocales

-con select:
|cadena |
cadena := 'viva la vida'.
^cadena select: [:each | each isVowel].

1.19. los string y otras colecciones son muy similares en sus metodos

### 2. bloques (closures)
a- En Smalltalk-80, un block es una construcción que representa una unidad de código que puede ser ejecutada de manera independiente.
b- al hacer value al block, el valor retornado es el resultado de la ultima expresion evaluada dentro del block, a menos que se use ^
c- |x|
x := [ y := 1. z := 1.].
x value. 
y.
i- si queremos acceder a una variable definida en el bloque, al hacer value podemos
tambien podemos acceder a una variable externa desde dentro del bloque
ii- [:a :b | a + b] value: 2 value: 3

3. símbolos
d- Un Symbol en Smalltalk es un tipo de objeto que representa un identificador único y constante. Es una cadena de caracteres que es inmutable y única dentro del sistema.
e-
i- |x y|
x := #pepe.
y := #pepe.
x = y da true
ii- #Hello , #world , #!  da 'Helloworld!' .

### 4- medidas

4.2. 10 * peso + 10 * dollar da error
4.3. 
10 * peso +( 10 * dollar) creo que da: error, dio:  10 * dollars+10 * pesos
10 * peso +( 10 * dollar) - (2 * dollar) creo que da: 10*peso + 8*dolar, dio: lo mismo
10 * peso +( 10 * dollar) - (2 * dollar) - (8 * dollar), creo que da: 10 * peso + 0* dolar, dio; 10*peso

4.4. peso es una baseUnit

4.5. (10*peso) amount ,  da:  10
(10 * peso) unit , da: peso

4.6. son la parte cuantitativa

4.7.  10 * pesos + 1  , da:  10 * pesos+1 .
 1 + (10 * peso)  da: 10 * pesos+1 .
(10 * peso) * 5 , da: 50 * pesos .
(10 * peso) * (5 * peso) , da: 50 * pesos*pesos .

4.8. peso := BaseUnit nameForOne: 'peso' nameForMany: 'pesos' sign: $$
que representa: $$ ???????????????? nose el signo?

4.9.
|centimetros metro|
metro :=BaseUnit nameForOne: 'metro' nameForMany: 'metros' sign: 'm'.
centimetros:= ProportionalDerivedUnit baseUnit:  metro conversionFactor: 1/ 100 named: 'centimetro'.

^(10*metro) + (500*centimetros)
 15 * metros .

4.10. necesito saber el anterior
|pulgadas metros|
metros :=BaseUnit nameForOne: 'metro' nameForMany: 'metros' sign: 'm'.

pulgadas := ProportionalDerivedUnit baseUnit: metro conversionFactor: 1/ 39.3701 named: 'pulgadas'.

(10 * metros) + (60 * pulgadas).

no anda laconchadela

4.11.

4.12.

4.13.

### 5. Fechas

5.1. 
DateAndTime fromSeconds: 0.   da: 1901-01-01T00:00:00-03:00 .
(DateAndTime fromSeconds: 0) + (Duration days: 1).    da: 1901-01-02T00:00:00-03:00 .

Time now. 

Time hour: 1 minute: 2 second: 4. da: 1:02:04 am .

Time now + (Duration hours: 1) “FALLA porque no es un timespan”

Date today.

Date newDay: 1 month: 2 year: 3 .  da: 1 February 3 .

5.2. 
FixedGregorianDate today. September 1, 2024 .
FixedGregorianDate today next next. September 3, 2024 .
GregorianDateTime now. September 1, 2024 at 13:38:55 .
GregorianDateTime now next. September 1, 2024 at 13:39:06 .
GregorianDateTime now next distanceFrom: GregorianDateTime now. 37/3200000 * days .
(GregorianDateTime now next distanceFrom: GregorianDateTime now) convertTo: second /
millisecond. no deja
TimeOfDay now. 13:42:11 .
TimeOfDay now next: (30 * hour). no deja
FixedGregorianDate today year. Year 2024 .
FixedGregorianDate today month. September .
FixedGregorianDate today monthOfYear. September of Year 2024 .

5.2. FixedGregorianDate today next next next next next next next
FixedGregorianDate today next: 7*day

5.3 Sumarle 24 segundos a la fecha de hoy
como?
5.4 Sumarle la cantidad de segundos que hay en un día a la fecha de hoy
como?
5.5. 
a- no entiende el mensaje
b- (April, 2024) year isLeap ,da true

5.6. TimeOfDay now next: 3600*second



## Ejercicio: Eliminar codigo repetido
Pasos para quitar codigo repetido:
1- mover el codigo repetido a una nueva abstraccion
2-parametrizar lo que cambia
3-poner nombre a la abstraccion
4- reemplazar en el codigo

que puedo mejorar? 
test01: 
millisecondsBeforeRunning := Time millisecondClockValue * millisecond. a esta linea la puedo reemplazar por algo mas declarativo ya que aparece en muchas partes del test 1 y 2
quizas puedo reemplazar todo el test 1 y el test 2 (y el resto)por algo mas declarativo

en test5 puedo cambiar un para de lineas de self assert por algo mas declarativo
en test6 algo parecido
test7 ver si en el caso del error tambien tiene sentido quitar el codigo repetido

	

	1 to: active size do:
	[ :index |
    	aName = (active at: index)
        	ifTrue: [
            	active removeAt: index.
            	^ aName
        	]
	].

	1 to: suspended size do:	 
	[ :index |
    	aName = (suspended at: index)
        	ifTrue: [
            	suspended removeAt: index.
            	^ aName
        	]
	].
	




## Ejercicio sacar IFs
esquema: 
-primero creo la jerarquía para off y on, voy a hacer una abstracción (energyState) que va a contener a turnOn y turnOff
-luego turnon y off van a saber responder a accelerate y cada uno va hacer la suya
-voy a crecar una abstraccion (Engine) con sus clases a los diferentes motores
-cada uno de estos va a saber responder un accelerate a su manera
-luego voy a crear dos subclases de vehicle (helicopter y motorcycle) que van a responder accelerate segun su estado, su motor y su ciudad
-city, openroad y skies son codigo repetido, no es necesario que cree subclases para el IMPORTANTE PARA PARCIAL
solo necesito poner una variable a vehicle, que sea limite de velocidad
ElectricEngineGasolineEngineJetFueledEngine

### Ejercicio perforaciones (para practicar sacar ifs y codigo repetido)
-perforadora con una mecha, 3 tipos de mecha, tipos de suelo (suelo arenoso, tierra y concreto.)
soilType , 

-cada mecha va a saber responder golpe de taladro

cada suelo va asaber responder a dargolpetaladro y se le va a pasar la mecha actual y la perforadora


### Ejercicio Penales
primero hacer que el codigo funcione con ifs, y codigo repetido, luego sacarlo
encontrar los ifs es muy dificil tambien
A tener en cuenta:
-direccion de pateado
-el arco es una grilla de 3x3
-direcccion en la que el arquero se tira
-fuerza de arquero
-fuerza delantero
-como el delantero patea, a colocar o a matar
-tipo de pelota
-si el arquero se tira antes o despues de que el delantero patee (esto afecta la fuerza de el arquero)
-si espera y le tiraron a matar no tendra chance (si es la jabulani)
-si el arquero esta adelantado

Test

-test1portafolio vacío
-test2 portafolio con una cuenta da el mismo balance que la cuenta
-test2 portafolio agregarle al portafolio una cuenta y que quede con 2 cuentas da el balance del balance de las cuentas
-test3 portafolio con mas de 2 cuentas da el balance del balance de las cuentas
-test4 transacciones de un portafolio con una cuenta devuelve transacciones de cuenta
-test5  transacciones de un portafolio con mas de una cuenta devuelve transacciones de las  cuentas
-test6 hasregistered a portafolio, y una de sus cuentas lo registro devuelve true
-test7 hasregistered a portafolio, y ninguna de sus cuentas lo registro devuelve false
-test8 un portafolio puede contener otro portafolio
-test9 el balance de un portafolio con un portafolio devuelve el balance del segundo
-test10 el balance de un portafolio con un portafolio y una cuenta devuelve la suma del balance de la cuenta y el balance de portafolio2
-test11 hasregistered a un portafolio con un portafolio, devuelve lo mismo que portafolio2 hasregistered
-test12 hasregistered a un portafolio  con portafolio2 y una cuenta devuelve si esta en alguno de los dos
-test13 transacciones de portafolio con portafolio devuelve coleccion de transacciones portafolio2
-test14  transacciones de portafolio con portafolio y cuenta devuelve coleccion de transacciones de portafolio2 y cuenta
-test15 un portafolio no puede registrar transacciones
-test16 no puedo agregar la misma cuenta a un portafolio dos veces
-test17 no puedo agregar el mismo portafolio dos veces a un portafolio
-test18 una cuenta o portafolio puede estar en mas de un portafolio




Comandos para hacer mas rapido

