!classDefinition: #CrewTest category: 'parcial20221C'!
TestCase subclass: #CrewTest
	instanceVariableNames: 'crewPosition1 treePosition1 island1 map1 crew1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:25:37'!
test01MovingCrewToTreePlaceDoesNotMove
	
	crew1 moveTo: treePosition1.
	
	self deny: (island1 hasCrewAt: treePosition1).
	self assert: (island1 hasCrewAt: crewPosition1).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:26:14'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree

	self deny: (island1 isEmptyAt: treePosition1).
				
	crew1 moveTo: treePosition1.

	self assert: (island1 isEmptyAt: treePosition1).
	
	self deny: (island1 hasCrewAt: treePosition1).
	self assert: (island1 hasCrewAt: crewPosition1).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:26:37'!
test03MovingCrewToFreePlace

	| nextPosition  |
	
	nextPosition := 2@1.
	self assert: (island1 isEmptyAt: nextPosition).
	
	crew1 moveTo: nextPosition.

	self deny: (island1 hasCrewAt: crewPosition1).
	self assert: (island1 hasCrewAt: nextPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:26:59'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	| nextPosition  |
	
	nextPosition := 2@1.
	self assert: map1 isEmpty.

	crew1 moveTo: nextPosition.

	self assert: map1 stepsSize equals: 1. 
	self assert: map1 lastPosition equals: nextPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:27:11'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig

	crew1 moveTo: 2@1.
	
	self 
		should: [ crew1 buryTreasureAt: 3@1 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: error messageText equals: Bucanero cannotDigErrorDescription.
			self deny: map1 hasTreasureMark ]
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:27:22'!
test06CrewCanBuryTreasureIfBucaneroCanDig

	crew1 moveTo: 2@1.
	crew1 buryTreasureAt: 2@2.
	
	self assert: map1 hasTreasureMark.
	
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:27:42'!
test07CaptainCanUseMap

	| pirate |
	
	crew1 moveTo: 2@1.
	crew1 buryTreasureAt: 2@2.

	pirate := Bucanero new.
	pirate aCaptainIWasMeantToBe.
	
	self assert: (pirate searchTreasureIn: island1 with: map1)! !

!CrewTest methodsFor: 'tests' stamp: 'HAW 9/24/2022 11:29:16'!
test08SimplePirateCannotUseMap

	| pirate |
	
	crew1 moveTo: 2@1.
	crew1 buryTreasureAt: 2@2.

	pirate := Bucanero new.
	
	self 
		should: [ pirate searchTreasureIn: island1 with: map1 ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: SimplePirate simplePirateErrorDescription 
! !


!CrewTest methodsFor: 'setUp/tearDown' stamp: 'HAW 9/24/2022 11:25:30'!
setUp
	
	crewPosition1 := 1@1.
	treePosition1 := 1@2.
	
	island1 := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition1)
		digsAt: (OrderedCollection with: 2@2).
	
	map1 := Map of: island1 crewStartsAt: crewPosition1.

	crew1 := Crew 
			at: island1 
			composedBy: (OrderedCollection with: (Corsario with: map1) with: Filibustero new with: Bucanero new)
			at: crewPosition1.
			
	! !


!classDefinition: #Crew category: 'parcial20221C'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Crew methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:59:26'!
buryTreasureAt: aPosition

	| terrain |
	
	terrain := island terrainAt: aPosition.
	
	pirates do: [ :pirate | pirate buryTreasureTo: aPosition in: terrain at: island ]! !

!Crew methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:54:44'!
moveTo: aPosition

	| moved terrain |
	
	terrain := island terrainAt: aPosition.
	
	moved := pirates inject: true into: [ :canMove :pirate | canMove & (pirate canMoveTo: aPosition in: terrain at: island )	].

	"nos movemos si todos pueden moverse"
	moved ifTrue: [ island crewAt: aPosition ].
	
	! !


!Crew methodsFor: 'initialization' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !


!Crew methodsFor: 'papers' stamp: 'v 9/27/2024 14:44:13'!
papers

	"-Programing as Theory building
“El trabajo del diseñador no es transmitir el diseño, sino las teorías que impulsan al diseño 
programación como una actividad de construcción de teoría
programación: el diseño y la implementacion de las soluciones
la documentación es secundaria, la teoria de un programa no se puede transmitir completamente desde la documentacion
 tener una teoría implica no solo saber hacer algo, sino también poder explicarlo y justificarlo
“La modificación se va a poder realizar de manera correcta si su entendimiento es accesible a la programador/es que tiene/n la teoría
Un programa tiene vida mientras un equipo de programadores que posee su teoría esté activo y tiene control de sus modificaciones
sugiere que los programadores deben ser considerados profesionales responsables, no meros componentes reemplazables en un proceso de producción


-The Design Of Everyday Things
 los objetos mal diseñados carecen de pistas visibles sobre su funcionamiento, lo que lleva a errores y confusiones.
**Visibilidad**: Las partes de un objeto deben ser visibles y comunicar su función
**Modelo Conceptual**: Un buen diseño debe proporcionar un modelo conceptual claro que permita a los usuarios predecir los resultados de sus acciones
La retroalimentación es crucial para que los usuarios comprendan si sus acciones han tenido éxito
un buen diseño debe considerar la psicología del usuario

-Self
lenguaje de programación orientado a objetos diseñado para la programación exploratoria
**prototipos**, **slots** y **comportamiento**. A diferencia de otros lenguajes orientados a objetos, Self no utiliza clases ni variables. En cambio, utiliza un modelo de creación de objetos basado en prototipos, donde los objetos se crean clonando otros objetos existentes. Este enfoque simplifica la herencia y la instanciación

1. **Prototipos**:
 cada objeto tiene **slots** que pueden contener tanto estado como comportamiento.
La herencia se implementa a través de punteros a objetos padres
2. **Slots**:
   - Los slots son estructuras que combinan variables y procedimientos en un solo constructo
3. **Comportamiento y Estado**:
   - Self no distingue entre el estado y el comportamiento, lo que reduce la brecha entre objetos ordinarios, procedimientos y cierres (closures
4. **Eliminación de Clases y Variables**:
   - Al eliminar clases y variables, Self evita la regresión infinita de metaclases que se encuentra en otros lenguajes.
   - Esto permite que cualquier objeto pueda actuar como una instancia o como un repositorio de información compartida
5. **Acceso a Estado a través de Mensajes**:
   - En lugar de acceder a variables directamente, los objetos envían mensajes a sí mismos para acceder a los datos en los slots.

se crea un objeto clonando un prototipo existente

-Design Principles Behind Smalltalk

para servir al espíritu creativo, un sistema debe ser sencillo de entender y manejar por una persona sola. Un buen diseño minimiza las partes inmodificables y asegura que todas las partes sean consistentes y generales
El diseño de un lenguaje de programación debe alinearse con la forma en que los humanos piensan y se comunican.
El lenguaje debe proveer un mecanismo uniforme para referenciar objetos y permitir que interactúen mediante mensajes
todo en el sistema es un objeto que se comunica mediante mensajes.
Modularidad: Los componentes de un sistema no deberían depender de los detalles internos de otros componente
Clasificación: Los lenguajes de programación deben permitir la creación de clases que agrupen objetos similares
Polimorfismo: Los programas deben especificar el comportamiento esperado de los objetos sin imponer detalles sobre su representación
Factorización: Cada componente independiente debe estar localizado en un único lugar. 
Reaprovechamiento: Un diseño bien factorizado permite un mayor reaprovechamiento de componentes
Interfaz al Usuario: La interfaz debe ser flexible y reactiva

-No Silver Bullet
no existe una solución mágica (silver bullet que pueda mejorar radicalmente la productividad, simplicidad o fiabilidad en la ingeniería de software
argumenta que no habrá un avance tecnológico o de gestión que logre una mejora de diez veces en la productividad
Dificultades esenciales: Se refiere a los problemas intrínsecos del software: complejidad, cambiabilidad….
Dificultades accidentales: Son aquellas que no son inherentes al software
Cambios accidentales que mejoraron sustancialmente: lenguajes de alto nivel, cambios instantaneos, ambientes de programacion
promesas tegnologicas: Lenguajes de programación avanzados, Programación orientada a objetos, Inteligencia artificial y sistemas expertos, Programación Automática


-Polymorphic Hierarchy
las descripciones de métodos deben dividirse en dos
partes: propósito e implementación
“Cuando creo una subclase no solo pienso como esta tiene que funcionar, sino como tiene que diferir de la superclase”
“El sub implementador tiene que tener el mismo objetivo que el super implementador”
 el polimorfismo no solo se trata de
métodos que comparten nombres, sino de métodos que comparten propósitos y comportamientos. Para lograr esto, es esencial que las jerarquías de clases se diseñen de manera que todas las clases compartan una interfaz polimórfica común. Esto no solo mejora la reutilización del código, sino que también hace que el sistema sea más flexible, extensible y fácil de entender


-Null object Pattern
El objetivo principal del Patrón de Objeto Nulo es proporcionar un sustituto para otro objeto que comparte la misma interfaz pero que no

realiza ninguna acción
Este objeto nulo encapsula las decisiones de implementación sobre cómo no hacer nada
Se recomienda utilizar el Patrón de Objeto Nulo en situaciones donde:
Un objeto requiere un colaborador, pero algunas instancias de ese colaborador no deben realizar ninguna acción.
Define jerarquías de clases que consisten en objetos reales y nulos
Simplifica el código del cliente al evitar la necesidad de manejar casos especiales
Encapsula el código de no hacer nada, facilitando su localización y reutilización.

-Double Dispatch

double dispatch, una técnica donde un método se distribuye en función del tipo del receptor, y luego el receptor envía un segundo mensaje para distribuirse en función del tipo del argumento. De esta manera, ambas variables polimórficas se manejan a través del envío de mensajes, sin necesidad de comprobaciones de tipos explícitas.
“El chequeo de tipo lo hace el mismo smalltalk cuando decide a que objeto enviar ese cierto mensaje
"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: 'parcial20221C'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'instance creation' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: 'parcial20221C'!
Object subclass: #Island
	instanceVariableNames: 'boardSize treesAt digsAt crewAt treasureAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Island methodsFor: 'crew' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'crew' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !


!Island methodsFor: 'testing' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !

!Island methodsFor: 'testing' stamp: 'HAW 9/24/2022 11:08:53'!
hasTreeAt: aPosition

	^ treesAt includes: aPosition! !

!Island methodsFor: 'testing' stamp: 'HAW 9/24/2022 11:09:18'!
isDiggableAt: aPosition

	^ digsAt includes: aPosition! !

!Island methodsFor: 'testing' stamp: 'HAW 9/24/2022 11:08:53'!
isEmptyAt: aPosition

	^(self hasTreeAt: aPosition) not ! !


!Island methodsFor: 'initialization' stamp: 'FRT 9/17/2022 15:23:00'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
! !


!Island methodsFor: 'terrain' stamp: 'HAW 9/24/2022 11:03:00'!
clearTerrainAt: aPosition

	treesAt remove: aPosition ifAbsent: []! !

!Island methodsFor: 'terrain' stamp: 'HAW 9/24/2022 11:09:18'!
terrainAt: aPosition

	(self hasTreeAt: aPosition ) ifTrue: [^Tree new ].
	(self isDiggableAt: aPosition ) ifTrue: [^Diggable new ].
	^Empty new
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: 'parcial20221C'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'instance creation' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #Map category: 'parcial20221C'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Map methodsFor: 'treasure' stamp: 'HAW 9/24/2022 11:10:36'!
lastPosition

	^steps inject: startPosition into: [ :lastPosition :step | lastPosition + step ]
	! !

!Map methodsFor: 'treasure' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !


!Map methodsFor: 'testing' stamp: 'HAW 9/24/2022 11:11:27'!
hasTreasureMark

	^ treasureMarkPosition notNil 
	
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !


!Map methodsFor: 'initialization' stamp: 'FRT 9/17/2022 16:30:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	
	! !


!Map methodsFor: 'steps' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !

!Map methodsFor: 'steps' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: 'parcial20221C'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'instance creation' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: 'parcial20221C'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Pirate methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 11:12:06'!
buryTreasureTo: aPosition in: terrain at: island 
	
	self subclassResponsibility ! !

!Pirate methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 11:11:56'!
canMoveTo: aPosition in: terrain at: island 
	
	self subclassResponsibility ! !

!Pirate methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 11:17:51'!
searchTreasureIn: island with: aMap

	^rank searchTreasureFor: self at: island with: aMap! !


!Pirate methodsFor: 'initialization' stamp: 'HAW 9/24/2022 11:17:00'!
initialize

	rank := SimplePirate new! !


!Pirate methodsFor: 'rank' stamp: 'HAW 9/24/2022 11:17:07'!
aCaptainIWasMeantToBe

	rank := Captain new! !


!classDefinition: #Bucanero category: 'parcial20221C'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Bucanero methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:59:26'!
buryTreasureTo: aPosition in: terrain at: island 

	^terrain bucanero: self buryTreasureAt: aPosition at: island 
	! !

!Bucanero methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:54:44'!
canMoveTo: aPosition in: terrain at: island 
	
	^terrain canMoveBucanero: self to: aPosition at: island
		
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: 'parcial20221C'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'error description' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: 'parcial20221C'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Corsario methodsFor: 'map' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'map' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !


!Corsario methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:59:53'!
buryTreasureTo: aPosition in: terrain at: island 

	^terrain corsario: self buryTreasureAt: aPosition at: island 
! !

!Corsario methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:54:44'!
canMoveTo: aPosition in: terrain at: island 
	
	^terrain canMoveCorsario: self to: aPosition at: island
			! !


!Corsario methodsFor: 'initialization' stamp: 'HAW 9/24/2022 11:15:13'!
initializeWith: aMap

	map := aMap! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: 'parcial20221C'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'instance creation' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: 'parcial20221C'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Filibustero methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 11:01:19'!
buryTreasureTo: aPosition in: terrain at: island 

	^terrain filibustero: self buryTreasureAt: aPosition at: island 
! !

!Filibustero methodsFor: 'crew actions' stamp: 'HAW 9/24/2022 10:54:44'!
canMoveTo: aPosition in: terrain at: island 
	
	^terrain canMoveFilibustero: self to: aPosition at: island
		
	! !


!classDefinition: #PirateRank category: 'parcial20221C'!
Object subclass: #PirateRank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!PirateRank methodsFor: 'searching treasure' stamp: 'HAW 9/24/2022 11:18:45'!
searchTreasureFor: aPirate at: anIsland with: aMap 

	self subclassResponsibility ! !


!classDefinition: #Captain category: 'parcial20221C'!
PirateRank subclass: #Captain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Captain methodsFor: 'searching treasure' stamp: 'HAW 9/24/2022 11:18:10'!
searchTreasureFor: aPirate at: anIsland with: aMap 
	
	^ true "Aye, Aye!! La implementación está fuera del scope del parcial." 
	! !


!classDefinition: #SimplePirate category: 'parcial20221C'!
PirateRank subclass: #SimplePirate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!SimplePirate methodsFor: 'searching treasure' stamp: 'HAW 9/24/2022 11:28:59'!
searchTreasureFor: aPirate at: anIsland with: aMap 
	
	self error: self class simplePirateErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimplePirate class' category: 'parcial20221C'!
SimplePirate class
	instanceVariableNames: ''!

!SimplePirate class methodsFor: 'error description' stamp: 'HAW 9/24/2022 11:28:54'!
simplePirateErrorDescription

	^ 'I am a simple pirate!!'! !


!classDefinition: #Terrain category: 'parcial20221C'!
Object subclass: #Terrain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Terrain methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:19:19'!
bucanero: aBucanero buryTreasureAt: aPosition at: island 

	self subclassResponsibility ! !

!Terrain methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:20:12'!
corsario: aCorsario buryTreasureAt: aPosition at: island 

	self subclassResponsibility ! !

!Terrain methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:20:24'!
filibustero: aFilistero buryTreasureAt: aPosition at: island 

	self subclassResponsibility ! !


!Terrain methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 11:19:34'!
canMoveBucanero: aBucanero to: aPosition at: island 

	self subclassResponsibility ! !

!Terrain methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 11:19:45'!
canMoveCorsario: aCorsario to: aPosition at: island 

	self subclassResponsibility ! !

!Terrain methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 11:19:56'!
canMoveFilibustero: aFilibustero to: aPosition at: island

	self subclassResponsibility ! !


!classDefinition: #Diggable category: 'parcial20221C'!
Terrain subclass: #Diggable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Diggable methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 10:58:32'!
bucanero: aBucanero buryTreasureAt: aPosition at: island 
			
	island receiveTreasureAt: aPosition 
	! !

!Diggable methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:00:18'!
corsario: aCorsario buryTreasureAt: aPosition at: island 

	aCorsario drawTreasureMarkAt: aPosition ! !

!Diggable methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:01:36'!
filibustero: aFilistero buryTreasureAt: aPosition at: island 
! !


!Diggable methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:48:45'!
canMoveBucanero: aBucanero to: aPosition at: island 
	
	^ true 
		
	
	! !

!Diggable methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:49:49'!
canMoveCorsario: aCorsario to: aPosition at: island 

	^ true! !

!Diggable methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:51:12'!
canMoveFilibustero: aFilibustero to: aPosition at: island
		
	^true 
		! !


!classDefinition: #Empty category: 'parcial20221C'!
Terrain subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Empty methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 10:58:51'!
bucanero: aBucanero buryTreasureAt: aPosition at: island 
		
	self error: 'Arrgh!! I cannot dig this type of terrain!!' 
	! !

!Empty methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:00:26'!
corsario: aCorsario buryTreasureAt: aPosition at: island 

	! !

!Empty methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:01:42'!
filibustero: aFilistero buryTreasureAt: aPosition at: island 
! !


!Empty methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:50:17'!
canMoveBucanero: aBucanero to: aPosition at: island 
	
	^ true 
		
	
	! !

!Empty methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:49:33'!
canMoveCorsario: aCorsario to: aPosition at: island 

	aCorsario drawDirectionTo: aPosition.
	^ true 
			! !

!Empty methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:51:24'!
canMoveFilibustero: aFilibustero to: aPosition at: island
		
	^true ! !


!classDefinition: #Tree category: 'parcial20221C'!
Terrain subclass: #Tree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'parcial20221C'!

!Tree methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 10:59:09'!
bucanero: aBucanero buryTreasureAt: aPosition at: island 
	
	self error: 'Arrgh!! I cannot dig this type of terrain!!' ! !

!Tree methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:00:32'!
corsario: aCorsario buryTreasureAt: aPosition at: island 

	! !

!Tree methodsFor: 'bury treasure' stamp: 'HAW 9/24/2022 11:01:46'!
filibustero: aFilistero buryTreasureAt: aPosition at: island 
! !


!Tree methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:48:36'!
canMoveBucanero: aBucanero to: aPosition at: island 
	
	^true ! !

!Tree methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:46:56'!
canMoveCorsario: aCorsario to: aPosition at: island 
	
	^false ! !

!Tree methodsFor: 'pirate moving' stamp: 'HAW 9/24/2022 10:51:35'!
canMoveFilibustero: aFilibustero to: aPosition at: island

	island clearTerrainAt: aPosition.
	^false
			! !
