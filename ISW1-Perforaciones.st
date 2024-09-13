!classDefinition: #TestDePerforación category: #'ISW1-Perforaciones'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:53'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:58:58'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:52'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:02:45'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota.].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 18:03:00'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'Se rompió' equals: unError messageText.
			self assert: excavadora conMechaRota ].
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:43'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/8/2023 13:10:48'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !


!classDefinition: #CapaDeSuelo category: #'ISW1-Perforaciones'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'tipo resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!CapaDeSuelo methodsFor: 'initialization' stamp: 'ARM 9/3/2024 16:26:45'!
initializeArenoso
	
	tipo := #Arenoso.! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'ARM 9/3/2024 16:26:41'!
initializeConcretoConResistencia: resistenciaInicial 

	resistencia := resistenciaInicial.
	tipo := #Concreto.! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'ARM 9/3/2024 16:26:38'!
initializeTierra
	
	tipo := #Tierra.! !


!CapaDeSuelo methodsFor: 'tipo' stamp: 'ARM 4/27/2023 20:13:01'!
esArenoso
	^tipo = #Arenoso! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'ARM 4/27/2023 20:15:50'!
esConcreto
	^tipo = #Concreto! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'ARM 4/27/2023 20:14:55'!
esTierra
	^tipo = #Tierra! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'ARM 5/8/2023 13:10:22'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [ tipo = unaCapaDeSuelo tipo and: [resistencia = unaCapaDeSuelo resistencia]]! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'ARM 5/8/2023 13:10:22'!
hash

	^tipo hash + resistencia hash! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:18:41'!
tipo

	^tipo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: #'ISW1-Perforaciones'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:02:32'!
arenoso

	^self new initializeArenoso! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 5/5/2023 18:01:35'!
concretoConResistencia: resistencia 

	^self new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:03:15'!
tierra

	^self new initializeTierra! !


!classDefinition: #CapaDeSuelo2 category: #'ISW1-Perforaciones'!
Object subclass: #CapaDeSuelo2
	instanceVariableNames: 'tipo resistencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!CapaDeSuelo2 methodsFor: 'bajar resistencia' stamp: 'v 9/13/2024 11:00:17'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo2 methodsFor: 'bajar resistencia' stamp: 'v 9/13/2024 11:00:32'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo2 methodsFor: 'initialization' stamp: 'v 9/13/2024 11:19:57'!
initializeSuelo: unSuelo
	
	tipo := unSuelo.
	resistencia := 0.! !

!CapaDeSuelo2 methodsFor: 'initialization' stamp: 'v 9/13/2024 11:04:38'!
initializeSuelo: unSuelo conResistencia: unaResistencia

	tipo := unSuelo.
	resistencia := unaResistencia! !


!CapaDeSuelo2 methodsFor: 'perforar' stamp: 'v 9/13/2024 11:56:30'!
darGolpeDeTaladro: UnaPerforadora

	self subclassResponsibility! !


!CapaDeSuelo2 methodsFor: 'accesing' stamp: 'v 9/13/2024 11:06:28'!
resistencia

	^ resistencia.! !

!CapaDeSuelo2 methodsFor: 'accesing' stamp: 'v 9/13/2024 11:06:46'!
tipo

	^tipo! !


!classDefinition: #SueloArenoso category: #'ISW1-Perforaciones'!
CapaDeSuelo2 subclass: #SueloArenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloArenoso methodsFor: 'perforar' stamp: 'v 9/13/2024 12:40:31'!
darGolpeDeTaladro: unaPerforadora

	(unaPerforadora mechaActual) perforarArena: unaPerforadora.
	
	! !


!classDefinition: #SueloConcreto category: #'ISW1-Perforaciones'!
CapaDeSuelo2 subclass: #SueloConcreto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloConcreto methodsFor: 'perforar' stamp: 'v 9/13/2024 12:41:28'!
darGolpeDeTaladro: unaPerforadora

	(unaPerforadora mechaActual) perforarConcreto: unaPerforadora.
	
	! !


!classDefinition: #SueloTierra category: #'ISW1-Perforaciones'!
CapaDeSuelo2 subclass: #SueloTierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!SueloTierra methodsFor: 'perforar' stamp: 'v 9/13/2024 12:41:46'!
darGolpeDeTaladro: unaPerforadora

	(unaPerforadora mechaActual) perforarTierra: unaPerforadora.
	
	! !


!classDefinition: #Mecha category: #'ISW1-Perforaciones'!
Object subclass: #Mecha
	instanceVariableNames: 'vecesQueGolpeo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Mecha methodsFor: 'perforar' stamp: 'v 9/13/2024 12:44:21'!
perforarArena: unaPerforadora

	unaPerforadora error: 'No puede perforar'! !

!Mecha methodsFor: 'perforar' stamp: 'v 9/13/2024 12:45:07'!
perforarConcreto: unaPerforadora

	unaPerforadora error: 'No puede perforar'! !

!Mecha methodsFor: 'perforar' stamp: 'v 9/13/2024 12:44:57'!
perforarTierra: unaPerforadora

	unaPerforadora error: 'No puede perforar'! !


!Mecha methodsFor: 'initialization' stamp: 'v 9/13/2024 11:11:19'!
initializeMecha

	vecesQueGolpeo := 0.! !


!Mecha methodsFor: 'romper' stamp: 'v 9/13/2024 12:24:48'!
romperMecha

	^(MechaRota initialize)! !


!classDefinition: #MechaDiamante category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaDiamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaDiamante methodsFor: 'perforar' stamp: 'v 9/13/2024 12:25:18'!
perforarArena: perforadora

	perforadora cambiarMecha: self romperMecha .! !

!MechaDiamante methodsFor: 'perforar' stamp: 'v 9/13/2024 12:37:10'!
perforarConcreto: perforadora
	
	vecesQueGolpeo := vecesQueGolpeo + 1.
	(vecesQueGolpeo % 2 = 0) ifTrue: [perforadora cambiarSueloActual: (perforadora capaDeSueloActual ) bajaUnDecimoDeResistencia].
	(perforadora capaDeSueloActual resistencia = 0) ifTrue: [perforadora cambiarSueloActual: (perforadora transformarCapaEnArenoso)].
	vecesQueGolpeo := 0.! !

!MechaDiamante methodsFor: 'perforar' stamp: 'v 9/13/2024 12:21:21'!
perforarTierra: perforadora

	perforadora pasarAProximaCapa.
! !


!classDefinition: #MechaRota category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaRota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!classDefinition: #MechaSoft category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaSoft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!MechaSoft methodsFor: 'as yet unclassified' stamp: 'v 9/13/2024 12:22:44'!
perforarArena:  perforadora
	
	perforadora pasarAProximaCapa.! !

!MechaSoft methodsFor: 'as yet unclassified' stamp: 'v 9/13/2024 12:27:40'!
perforarConcreto: perforadora

	perforadora cambiarMecha: self romperMecha.! !

!MechaSoft methodsFor: 'as yet unclassified' stamp: 'v 9/13/2024 12:23:54'!
perforarTierra:  perforadora
	
	^nil! !


!classDefinition: #MechaWidia category: #'ISW1-Perforaciones'!
Mecha subclass: #MechaWidia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!MechaWidia methodsFor: 'perforar' stamp: 'v 9/13/2024 12:28:06'!
perforarArena:  perforadora
	
	perforadora pasarAProximaCapa.! !

!MechaWidia methodsFor: 'perforar' stamp: 'v 9/13/2024 12:38:56'!
perforarConcreto: perforadora
	
	vecesQueGolpeo := vecesQueGolpeo + 1.
	(vecesQueGolpeo % 3 = 0) ifTrue: [perforadora cambiarMecha: self romperMecha.].
! !

!MechaWidia methodsFor: 'perforar' stamp: 'v 9/13/2024 12:37:31'!
perforarTierra: perforadora
	
	vecesQueGolpeo := vecesQueGolpeo + 1.
	(vecesQueGolpeo % 2 = 0) ifTrue: [perforadora cambiarSueloActual: (perforadora transformarCapaEnArenoso)].
	vecesQueGolpeo := 0.! !


!classDefinition: #SinMecha category: #'ISW1-Perforaciones'!
Mecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!


!classDefinition: #Perforadora category: #'ISW1-Perforaciones'!
Object subclass: #Perforadora
	instanceVariableNames: 'tipoDeSuelo mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Perforadora methodsFor: 'perforar' stamp: 'ARM 9/10/2024 15:36:15'!
darGolpeDeTaladro
		
	self sinMecha ifTrue: [self error: 'No puede perforar'].

	vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1.

	self sobreSueloArenoso ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Widia ifTrue: [ ^self pasarAProximaCapa ].
		mechaPuesta = #Diamante ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
		^self].
	
	self sobreSueloTierra ifTrue: [
		mechaPuesta = #Soft ifTrue: [ ^self ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 2 ifTrue: [ ^self transformarCapaEnArenoso ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ ^self pasarAProximaCapa ]].
	
	self sobreSueloConcreto ifTrue: [
		mechaPuesta = #Soft ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió'  ].
		mechaPuesta = #Widia ifTrue: [ 
			vecesQueGolpeoCapaActual = 3 ifTrue: [ mechaPuesta := #Rota. self error: 'Se rompió' ].
			^self ].
		mechaPuesta = #Diamante ifTrue: [ 
			vecesQueGolpeoCapaActual even ifTrue: [ capasDeSueloDebajo first bajaUnDecimoDeResistencia].
			capasDeSueloDebajo first sinResistencia ifTrue: [ ^self transformarCapaEnArenoso].
			^vecesQueGolpeoCapaActual ]].
	
	self error: 'error'! !


!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 9/3/2024 16:45:24'!
pasarAProximaCapa
	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self].! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'ARM 4/27/2023 20:46:30'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'initialization' stamp: 'ARM 9/3/2024 16:45:43'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.
	vecesQueGolpeoCapaActual := 0.
	mechaPuesta := #SinMecha! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:20:54'!
conMechaRota

	^mechaPuesta = #Rota! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:54:43'!
sinMecha

	^mechaPuesta = #SinMecha! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:17'!
sobreSueloArenoso
	^capasDeSueloDebajo first esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:16:14'!
sobreSueloConcreto
	^capasDeSueloDebajo first esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'ARM 4/27/2023 20:13:58'!
sobreSueloTierra
	^capasDeSueloDebajo first esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'ARM 4/27/2023 20:50:48'!
ponerMechaDiamante
	mechaPuesta := #Diamante! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'ARM 4/27/2023 20:27:46'!
ponerMechaSoft
	mechaPuesta := #Soft! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'ARM 4/27/2023 20:38:16'!
ponerMechaWidia
	mechaPuesta := #Widia! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: #'ISW1-Perforaciones'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !


!classDefinition: #Perforadora2 category: #'ISW1-Perforaciones'!
Object subclass: #Perforadora2
	instanceVariableNames: 'capaActual mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-Perforaciones'!

!Perforadora2 methodsFor: 'initialization' stamp: 'v 9/13/2024 11:14:55'!
initializeSobreSuelo: capasDeSueloIniciales

	capaActual := capasDeSueloIniciales first.
	capasDeSueloDebajo := capasDeSueloIniciales allButFirst.
	mechaPuesta := #SinMecha! !


!Perforadora2 methodsFor: 'cambiarCapa' stamp: 'v 9/13/2024 12:18:56'!
cambiarSueloActual: nuevoSuelo
	
	capaActual := nuevoSuelo.
	! !

!Perforadora2 methodsFor: 'cambiarCapa' stamp: 'v 9/13/2024 11:17:35'!
pasarAProximaCapa

	capaActual := capasDeSueloDebajo first.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	capasDeSueloDebajo ifEmpty: [^self].! !

!Perforadora2 methodsFor: 'cambiarCapa' stamp: 'v 9/13/2024 12:31:59'!
transformarCapaEnArenoso
	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: SueloArenoso;
			yourself! !


!Perforadora2 methodsFor: 'perforar' stamp: 'v 9/13/2024 11:51:18'!
darGolpeDeTaladro

	capaActual darGolpeDeTaladro: self.! !


!Perforadora2 methodsFor: 'accesing' stamp: 'v 9/13/2024 12:09:00'!
cambiarMecha: nuevaMecha
	
	mechaPuesta := nuevaMecha.! !

!Perforadora2 methodsFor: 'accesing' stamp: 'v 9/13/2024 11:51:01'!
capaDeSueloActual

	^capaActual! !

!Perforadora2 methodsFor: 'accesing' stamp: 'v 9/13/2024 12:00:36'!
mechaActual
	
	^mechaPuesta

! !
