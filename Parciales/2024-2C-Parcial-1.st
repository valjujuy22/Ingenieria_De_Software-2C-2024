!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'va 9/27/2024 21:28:41'!
test13SiAventureroOMonstruoEsDerrotadoNoPuedeHacerNada

	|aventurero monstruo1 monstruo2 baculo espada|
	
	aventurero := self crearMago.
	monstruo1 := self crearGoblin .
	monstruo2 := self crearOgro.
	espada := self crearEspadaPara: monstruo2.
	baculo := self crearBaculo .
	aventurero equiparItemDeAtaque: espada.
	aventurero equiparItemDeAtaque: baculo.

	
	aventurero atacarA: monstruo1 con: baculo.
	aventurero atacarA: monstruo2 con: espada.
	
	"aventurero queda en 0 *pv y monstruo 1 tambien"
	
	self assert: (aventurero tienePuntosDeVida: 0*pv).
	self assert: (monstruo1 tienePuntosDeVida: 0*pv).
	
	self should: [ aventurero atacarA: monstruo2 con: (baculo) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Estado errorEstaMuertoNoPuedeHacerNadaYa.
	].

	self should: [ monstruo1 atacarA: aventurero  ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Estado errorEstaMuertoNoPuedeHacerNadaYa.
	]
	 
	
	

! !


!TestMyA methodsFor: 'crear items' stamp: 'va 9/27/2024 18:55:12'!
crearArmadura

	^Armadura new initialize! !

!TestMyA methodsFor: 'crear items' stamp: 'va 9/27/2024 18:55:00'!
crearBaculo
	
	^Baculo new initialize! !

!TestMyA methodsFor: 'crear items' stamp: 'va 9/27/2024 18:55:04'!
crearEscudoMagico

	^EscudoMagico new initialize
! !

!TestMyA methodsFor: 'crear items' stamp: 'va 9/27/2024 18:29:29'!
crearEspadaPara: monstruo

	^Espada conObjetivo: monstruo
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'va 9/27/2024 18:54:06'!
crearGoblin

	^Goblin new initialize! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'va 9/27/2024 18:54:11'!
crearGuerrero
	
	^Guerrero new initialize! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'va 9/27/2024 18:54:15'!
crearMago

	^Mago new initialize
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'va 9/27/2024 18:54:24'!
crearOgro

	^Ogro new initialize! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'fuerza puntosVida itemsDefensa itemsAtaque estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'assert' stamp: 'va 9/27/2024 18:12:46'!
tienePuntosDeVida: aNumberOfPV

	^(puntosVida = aNumberOfPV)! !


!Aventurero methodsFor: 'equipar' stamp: 'va 9/27/2024 19:03:06'!
equiparItemDeAtaque: unItem

	itemsAtaque add: unItem! !

!Aventurero methodsFor: 'equipar' stamp: 'va 9/27/2024 19:03:13'!
equiparItemDeDefensa: unItem

	itemsDefensa add: unItem! !


!Aventurero methodsFor: 'defensa' stamp: 'va 9/27/2024 18:58:40'!
pvsDeDefensa

	itemsDefensa ifEmpty: [^0].

	^itemsDefensa sum: [:unItem | unItem pvDeItem ].! !

!Aventurero methodsFor: 'defensa' stamp: 'va 9/27/2024 21:31:24'!
recibirAtaqueDe: monstruo

	puntosVida := puntosVida - (monstruo chocaContraItemsDeDefensa: self pvsDeDefensa).
	
	self estadoActual.

	! !


!Aventurero methodsFor: 'ataque' stamp: 'va 9/27/2024 19:14:48'!
atacarA: unMonstruo con: unItem

	self subclassResponsibility! !


!Aventurero methodsFor: 'mensajes de error' stamp: 'va 9/27/2024 20:23:25'!
errorSiNoDisponible: item

	^((itemsAtaque indexOf: item) = 0 ) ifTrue: [self error: self itemNoDisponibleMensajeDeError].! !

!Aventurero methodsFor: 'mensajes de error' stamp: 'va 9/27/2024 19:39:13'!
itemNoDisponibleMensajeDeError

	^'Item no disponible'! !


!Aventurero methodsFor: 'estado' stamp: 'va 9/27/2024 21:30:55'!
estadoActual

	(puntosVida / pv  <= 0) ifTrue: [estado := Derrotado new.]! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'initialization' stamp: 'va 9/27/2024 21:15:37'!
initialize

	fuerza := 4.
	puntosVida := 10 * pv.
	itemsDefensa := OrderedCollection new.
	itemsAtaque := OrderedCollection new.
	estado := Vivo new.! !


!Guerrero methodsFor: 'ataque' stamp: 'va 9/27/2024 21:25:43'!
atacarA: unMonstruo con: unItem

	estado intentaAtacar.
	self errorSiNoDisponible: unItem.

	unItem golpear: unMonstruo siendoUsadoPorGuerrero: self conFuerza: fuerza! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'vida' stamp: 'va 9/27/2024 21:20:52'!
pierdeTodosSusPuntosDeVida

	puntosVida  := 0 * pv.
	estado := Derrotado new.! !


!Mago methodsFor: 'ataque' stamp: 'va 9/27/2024 21:25:50'!
atacarA: unMonstruo con: unItem

	estado intentaAtacar.
	self errorSiNoDisponible: unItem.

	unItem golpear: unMonstruo siendoUsadoPorMago: self conFuerza: fuerza! !


!Mago methodsFor: 'initialization' stamp: 'va 9/27/2024 21:23:02'!
initialize

	fuerza := 2.
	puntosVida := 15*pv.
	itemsDefensa := OrderedCollection new.
	itemsAtaque := OrderedCollection new.
	estado := Vivo new! !


!classDefinition: #Estado category: #'2024-2C-Parcial-1'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Estado methodsFor: 'loIntenta' stamp: 'va 9/27/2024 21:16:31'!
intentaAtacar

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Estado class' category: #'2024-2C-Parcial-1'!
Estado class
	instanceVariableNames: ''!

!Estado class methodsFor: 'mensaje de error' stamp: 'va 9/27/2024 21:27:18'!
errorEstaMuertoNoPuedeHacerNadaYa

	^'Error esta muerto no puede hacer nada ya'! !


!classDefinition: #Derrotado category: #'2024-2C-Parcial-1'!
Estado subclass: #Derrotado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Derrotado methodsFor: 'loIntenta' stamp: 'va 9/27/2024 21:27:31'!
intentaAtacar

	self error: self class errorEstaMuertoNoPuedeHacerNadaYa! !


!classDefinition: #Vivo category: #'2024-2C-Parcial-1'!
Estado subclass: #Vivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Vivo methodsFor: 'loIntenta' stamp: 'va 9/27/2024 21:19:38'!
intentaAtacar

	! !


!classDefinition: #Item category: #'2024-2C-Parcial-1'!
Object subclass: #Item
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!


!classDefinition: #ItemDeAtaque category: #'2024-2C-Parcial-1'!
Item subclass: #ItemDeAtaque
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'ataque' stamp: 'va 9/27/2024 19:58:03'!
golpear: monstruo siendoUsadoPorGuerrero: mago conFuerza: fuerza

	monstruo recibirGolpeDeBaculoDeGuerrero: mago ConFuerza: fuerza

! !

!Baculo methodsFor: 'ataque' stamp: 'va 9/27/2024 19:53:49'!
golpear: monstruo siendoUsadoPorMago: mago conFuerza: fuerza

	monstruo recibirGolpeDeBaculoDeMago: mago ConFuerza: fuerza

! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Espada
	instanceVariableNames: 'monstruoObjetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'initialization' stamp: 'va 9/27/2024 20:08:01'!
initializeConObjetivo: unMonstruo

	monstruoObjetivo := unMonstruo.! !


!Espada methodsFor: 'ataque' stamp: 'va 9/27/2024 20:31:15'!
golpear: monstruo siendoUsadoPorGuerrero: guerrero conFuerza: fuerza 

	(monstruoObjetivo = monstruo) ifTrue: [monstruo recibirGolpeDeEspadaDeGuerrero: guerrero ConFuerza: fuerza].
	
! !

!Espada methodsFor: 'ataque' stamp: 'va 9/27/2024 21:10:03'!
golpear: unMonstruo siendoUsadoPorMago: mago conFuerza: fuerza

	mago pierdeTodosSusPuntosDeVida! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'instance creation' stamp: 'va 9/27/2024 20:10:12'!
conObjetivo: unMonstruo

	(unMonstruo alturaMenorA1Metro) ifTrue: [self error: self  noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError ].
	
	^self new initializeConObjetivo: unMonstruo.! !


!Espada class methodsFor: 'mensaje de error' stamp: 'va 9/27/2024 20:04:47'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError

	^'No se puede atacar a un montruo menor a 1 metro de altura'! !


!classDefinition: #ItemDeDefensa category: #'2024-2C-Parcial-1'!
Item subclass: #ItemDeDefensa
	instanceVariableNames: 'puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeDefensa methodsFor: 'puntos de vida' stamp: 'va 9/27/2024 20:28:37'!
pvDeItem

	^puntosDeVida ! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
ItemDeDefensa subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'initialization' stamp: 'va 9/27/2024 18:23:19'!
initialize

	puntosDeVida := 5*pv! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
ItemDeDefensa subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'intialization' stamp: 'va 9/27/2024 18:22:55'!
initialize

	puntosDeVida := 3*pv! !


!classDefinition: #Monstruos category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruos
	instanceVariableNames: 'puntosVida altura estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruos methodsFor: 'assert' stamp: 'va 9/27/2024 20:33:11'!
alturaMenorA1Metro

	^(altura < 100)! !

!Monstruos methodsFor: 'assert' stamp: 'va 9/27/2024 18:11:46'!
tienePuntosDeVida: aNumberOfPV

	^(puntosVida = aNumberOfPV)! !


!Monstruos methodsFor: 'ataque' stamp: 'va 9/27/2024 21:26:00'!
atacarA: unAventurero

	estado intentaAtacar.
	unAventurero recibirAtaqueDe: self.! !

!Monstruos methodsFor: 'ataque' stamp: 'va 9/27/2024 18:48:43'!
chocaContraItemsDeDefensa: pvsDeDefensa

	^0*pv max: puntosVida - pvsDeDefensa ! !


!Monstruos methodsFor: 'estado' stamp: 'va 9/27/2024 21:30:07'!
estadoActual

	(puntosVida / pv  <= 0) ifTrue: [estado := Derrotado new.]! !


!Monstruos methodsFor: 'defensa' stamp: 'va 9/27/2024 19:25:46'!
recibirGolpeDeEspadaDeGuerrero: guerrero ConFuerza: fuerza

	self subclassResponsibility! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruos subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'initialization' stamp: 'va 9/27/2024 21:23:21'!
initialize

	puntosVida := 5*pv.
	altura := 90.
	estado := Vivo new
! !


!Goblin methodsFor: 'defensa' stamp: 'va 9/27/2024 19:56:44'!
recibirGolpeDeBaculoDeGuerrero: mago ConFuerza: fuerza

	puntosVida  := puntosVida * 2! !

!Goblin methodsFor: 'defensa' stamp: 'va 9/27/2024 21:23:57'!
recibirGolpeDeBaculoDeMago: mago ConFuerza: fuerza

	puntosVida  := 0*pv.
	estado := Derrotado new.! !



!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruos subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'defensa' stamp: 'va 9/27/2024 21:30:22'!
recibirGolpeDeBaculoDeGuerrero: mago ConFuerza: fuerza

	puntosVida  := puntosVida  - (fuerza * pv).
	
	self estadoActual.! !

!Ogro methodsFor: 'defensa' stamp: 'va 9/27/2024 21:30:33'!
recibirGolpeDeBaculoDeMago: mago ConFuerza: fuerza

	puntosVida  := puntosVida  - (fuerza * pv).
	
	self estadoActual.! !

!Ogro methodsFor: 'defensa' stamp: 'va 9/27/2024 21:29:41'!
recibirGolpeDeEspadaDeGuerrero: guerrero ConFuerza: fuerza

	puntosVida := puntosVida - (fuerza * pv).
	
	self estadoActual.! !


!Ogro methodsFor: 'initialization' stamp: 'va 9/27/2024 21:23:26'!
initialize

	puntosVida := 15 * pv.
	altura := 220.
	estado := Vivo new! !

TestMyA initialize!