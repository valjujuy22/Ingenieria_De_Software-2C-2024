!classDefinition: #TestCaseMarsRover category: #MarsRoverExercise!
TestCase subclass: #TestCaseMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:03:17'!
test01ConjuntoDeComandosVacioNoCambiaPosicionNiDireccion

	|marsRover |
	
	marsRover := MarsRover con: 25@48 direccion: #Este.
	
	marsRover mover: ''.
	
	self assert: (marsRover estaEnPosicion: 25@48 apuntandoA: #Este)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:14:28'!
test02MoverHaciaAdelanteApuntandoAlNorteSuma1ALaCoordenadaEnY

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Norte.
	
	marsRover mover: 'f'.
	
	self assert: (marsRover estaEnPosicion: 10@21 apuntandoA: #Norte)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:15:13'!
test03MoverHaciaAtrasApuntandoAlNorteResta1ALaCoordenadaY

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Norte.
	
	marsRover mover: 'b'.
	
	self assert: (marsRover estaEnPosicion: 10@19 apuntandoA: #Norte)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:43:17'!
test04AlRotarALaIzquierdaApuntandoAlNorteLaDireccionEsEste

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Norte.
	
	marsRover mover: 'r'.
	
	self assert: (marsRover estaEnPosicion: 10@20 apuntandoA: #Este)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:43:13'!
test05AlRotarALaDerechaApuntandoAlNorteLaDireccionEsOeste

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Norte.
	
	marsRover mover: 'l'.
	
	self assert: (marsRover estaEnPosicion: 10@20 apuntandoA: #Oeste)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:33:13'!
test06MoverHaciaAdelanteApuntandoAlSurResta1ALaCoordenadaEnY

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Sur.
	
	marsRover mover: 'f'.
	
	self assert: (marsRover estaEnPosicion: 10@19 apuntandoA: #Sur)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:37:36'!
test07MoverHaciaAtrasApuntandoAlSurSuma1ALaCoordenadaEnY

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Sur.
	
	marsRover mover: 'b'.
	
	self assert: (marsRover estaEnPosicion: 10@21 apuntandoA: #Sur)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:41:28'!
test08AlRotarALaIzquierdaApuntandoAlSurLaDireccionEsEste

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Sur.
	
	marsRover mover: 'l'.
	
	self assert: (marsRover estaEnPosicion: 10@20 apuntandoA: #Este)
	
	! !

!TestCaseMarsRover methodsFor: 'test' stamp: 'va 10/8/2024 21:42:00'!
test09AlRotarALaDerechaApuntandoAlSurLaDireccionEsOeste

	|marsRover |
	
	marsRover := MarsRover con: 10@20 direccion: #Sur.
	
	marsRover mover: 'r'.
	
	self assert: (marsRover estaEnPosicion: 10@20 apuntandoA: #Oeste)
	
	! !


!classDefinition: #MarsRover category: #MarsRoverExercise!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!

!MarsRover methodsFor: 'initialize' stamp: 'va 10/8/2024 20:51:43'!
initializeCon: unaCoordenada direccion: unaDireccion

	coordenada := unaCoordenada .
	direccion := unaDireccion.

	! !



!MarsRover methodsFor: 'acciones' stamp: 'va 10/8/2024 21:46:30'!
mover: aString

	(direccion = #Norte) ifTrue: [
	(aString = 'f' ) ifTrue: [coordenada := coordenada + (0@1)].
	(aString = 'b' ) ifTrue: [coordenada := coordenada - (0@1)].
	(aString = 'r' ) ifTrue: [direccion := #Este].
	(aString = 'l' ) ifTrue: [direccion := #Oeste].
	].
	(direccion = #Sur) ifTrue: [
	(aString = 'f' ) ifTrue: [coordenada := coordenada - (0@1)].
	(aString = 'b' ) ifTrue: [coordenada := coordenada + (0@1)].
	(aString = 'l' ) ifTrue: [direccion := #Este].
	(aString = 'r' ) ifTrue: [direccion := #Oeste].
	].
	
	
	! !


!MarsRover methodsFor: 'assert' stamp: 'va 10/8/2024 21:02:55'!
estaEnPosicion: unaPosicion apuntandoA: unaDireccion

	^(coordenada = unaPosicion) and: (direccion = unaDireccion )
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRoverExercise!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'va 10/8/2024 20:50:15'!
con: coordenada direccion: direccion

	^MarsRover  new initializeCon: coordenada direccion: direccion

	! !

!MarsRover class methodsFor: 'instance creation' stamp: 'va 10/8/2024 20:48:34'!
with: aPoint andDirection: aDirection! !


!classDefinition: #PuntoCardinal category: #MarsRoverExercise!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!


!classDefinition: #Norte category: #MarsRoverExercise!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!



!classDefinition: #Sur category: #MarsRoverExercise!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExercise'!
