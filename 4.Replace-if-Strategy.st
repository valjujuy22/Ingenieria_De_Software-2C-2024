!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:25:03'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle electricMotorcycle.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:27:17'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:20'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:16'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:11'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:47:14'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:52:05'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:53:50'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 9/7/2024 18:55:32'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #Engines category: #'4.Replace-if-Strategy'!
Object subclass: #Engines
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #ElectricEngine category: #'4.Replace-if-Strategy'!
Engines subclass: #ElectricEngine
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'state' stamp: 'val 9/10/2024 14:45:19'!
turnOn

	state:= TurnOn.! !


!ElectricEngine methodsFor: 'data' stamp: 'val 9/10/2024 15:57:48'!
engineSpeed

	^(5 * kilometer / hour) * 2! !


!ElectricEngine methodsFor: 'initialize' stamp: 'val 9/10/2024 14:43:19'!
initialize

	state:= TurnOff.! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-Strategy'!
Engines subclass: #GasolineEngine
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'initialize' stamp: 'val 9/10/2024 14:43:37'!
initialize

	state:= TurnOff.! !


!GasolineEngine methodsFor: 'state' stamp: 'val 9/10/2024 14:45:03'!
turnOn

	state:= TurnOn.! !


!GasolineEngine methodsFor: 'data' stamp: 'val 9/10/2024 15:59:27'!
engineSpeed

	^(5 * kilometer / hour)* 2 ! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-Strategy'!
Engines subclass: #JetFueledEngine
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'state' stamp: 'val 9/10/2024 14:44:43'!
turnOn

	state:= TurnOn.! !


!JetFueledEngine methodsFor: 'initialize' stamp: 'val 9/10/2024 14:43:52'!
initialize

	state:= TurnOff.! !


!classDefinition: #States category: #'4.Replace-if-Strategy'!
Object subclass: #States
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #TurnOff category: #'4.Replace-if-Strategy'!
States subclass: #TurnOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!TurnOff methodsFor: 'mov' stamp: 'val 9/10/2024 15:24:29'!
accelerateA: vehicle

	vehicle type error: vehicle type canNotAccelerateErrorMessage! !


!classDefinition: #TurnOn category: #'4.Replace-if-Strategy'!
States subclass: #TurnOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!TurnOn methodsFor: 'move' stamp: 'val 9/10/2024 15:09:12'!
accelerateA: vehicle

	! !


!classDefinition: #Surrounding category: #'4.Replace-if-Strategy'!
Object subclass: #Surrounding
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #City category: #'4.Replace-if-Strategy'!
Surrounding subclass: #City
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
Surrounding subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #Skies category: #'4.Replace-if-Strategy'!
Surrounding subclass: #Skies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed altitude engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'val 9/10/2024 15:11:45'!
initializeWithType: typeToTake engineType: anEngineType andSurroundings: surroundings

	state := #TurnOff.
	type := typeToTake.
	engineType := anEngineType.
	where := surroundings.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!Vehicle methodsFor: 'state' stamp: 'val 9/10/2024 15:46:39'!
changeAltitude: anAltitude

	altitude := anAltitude! !

!Vehicle methodsFor: 'state' stamp: 'val 9/10/2024 15:47:07'!
changeSpeed: aSpeed

	speed := aSpeed! !

!Vehicle methodsFor: 'state' stamp: 'val 9/10/2024 15:55:53'!
returnEngine

	^engineType! !

!Vehicle methodsFor: 'state' stamp: 'val 9/10/2024 15:04:19'!
returnState

	^state! !


!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 09:00:22'!
accelerate

	| acceleration |
	
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].

	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:24:00'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'val 9/10/2024 15:11:17'!
turnOff

	state := #TurnOff.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'val 9/10/2024 15:11:24'!
turnOn

	state := #TurnOn! !


!Vehicle methodsFor: 'error messages' stamp: 'ARM 4/29/2024 11:08:20'!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:59'!
electricMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #ElectricEngine andSurroundings: #city

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:53:55'!
gasolineMotorcycle

	^ self new initializeWithType: #Motorcycle engineType: #GasolineEngine andSurroundings: #openRoad! !

!Vehicle class methodsFor: 'instance creation' stamp: 'NR 9/7/2024 08:54:07'!
helicopter

	^ self new initializeWithType: #Helicopter engineType: #JetFueledEngine andSurroundings: #skies! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'move' stamp: 'val 9/10/2024 15:54:47'!
accelerateA: vehicle

	(self returnState) accelerateA: self.
	
	vehicle changeAltitude: (5 * meter). 
	
	vehicle changeSpeed: (vehicle returnEngine) engineSpeed.! !


!Helicopter methodsFor: 'error messages' stamp: 'val 9/10/2024 15:10:18'!
canNotAccelerateErrorMessage

	^'Can not fly when turned off'! !


!classDefinition: #MotorCycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #MotorCycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!MotorCycle methodsFor: 'error messages' stamp: 'val 9/10/2024 15:10:43'!
canNotAccelerateErrorMessage

	^'Can not run when turned off'! !

