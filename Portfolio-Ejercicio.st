!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'v 10/18/2024 11:05:48'!
test08EmptyPorfolioHas0AsBalance
	| portfolio |
	
	portfolio := Portfolio new.
	self assert: 0 equals: portfolio balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'v 10/18/2024 11:45:04'!
test09PortfolioWIthAccountHasSameBalanceThatAccount
	| portfolio transaction account|
	
	transaction := Deposit for: 100.
	account := ReceptiveAccount new.
	account register: transaction .
	portfolio := Portfolio new.
	
	portfolio register: account.
	
	self assert: 100 equals: portfolio balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'v 10/18/2024 11:49:11'!
test10PortfolioWithTwoAccountsHasTheBalanceOfTheTwoAccounts

	| portfolio transaction1 transaction2 account1 account2|
	
	transaction1 := Deposit for: 200.
	transaction2 := Deposit for: 100. 
	
	account1 := ReceptiveAccount  new.
	account1 register: transaction1 .
	account2 := ReceptiveAccount  new.
	account2 register: transaction2 .
	
	portfolio := Portfolio new.
	
	portfolio register: account1.
	portfolio register: account2.
	
	self assert: 300 equals: portfolio balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'v 10/18/2024 11:53:23'!
test11PortfolioTransactionsWithAnAccountReturnsAccountTransactions

	| portfolio transaction1 transaction2 account|
	
	transaction1 := Deposit for: 200.
	transaction2 := Deposit for: 100. 
	
	account := ReceptiveAccount  new.
	account register: transaction1 .
	account register: transaction2 .
	
	portfolio := Portfolio new.
	
	portfolio register: account.
	
	self assert: account transactions equals: portfolio transactions.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'v 10/18/2024 12:04:28'!
test12PortfolioTransactionsWithMoreThanOneAccountReturnsTransactionsOfAllAccounts

	| portfolio transaction1 transaction2 account1 account2 transactions|
	
	transaction1 := Deposit for: 200.
	transaction2 := Deposit for: 100. 
	
	account1 := ReceptiveAccount  new.
	account2 := ReceptiveAccount  new.
	account1 register: transaction1 .
	account2 register: transaction2 .
	
	portfolio := Portfolio new.
	
	portfolio register: account1.
	portfolio register: account2.
	
	transactions := OrderedCollection new .
	transactions add: transaction1. 
	transactions add: transaction2 .
	
	self assert: transactions equals: portfolio transactions.
	
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'v 10/18/2024 10:13:24'!
amount


	^value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'v 10/18/2024 10:13:12'!
amount


	^value negated! !

!Withdraw methodsFor: 'value' stamp: 'v 10/18/2024 10:13:50'!
value

	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'Wallet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'add' stamp: 'v 10/18/2024 11:29:48'!
register: aElement

	Wallet add: aElement.! !


!Portfolio methodsFor: 'initialization' stamp: 'v 10/18/2024 11:31:48'!
initialize

	Wallet := OrderedCollection new.

	! !


!Portfolio methodsFor: 'balance' stamp: 'v 10/18/2024 11:45:13'!
balance

	^ Wallet sum: [:elem | elem balance] ifEmpty: [0].! !


!Portfolio methodsFor: 'transactions' stamp: 'v 10/18/2024 12:19:48'!
transactions

	|res|
	res := OrderedCollection  new.
	
	Wallet do: [:account | res add: account transactions].
	^res concatenation	
	! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'v 10/18/2024 10:12:51'!
balance

	^transactions sum: [ :aTransaction | aTransaction amount] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
