Class {
	#name : #DummyApplicationStarterCommandLineHandler,
	#superclass : #ApplicationStarterCommandLineHandler,
	#instVars : [
		'activationBlock'
	],
	#classVars : [
		'memoryLogPathConfiguredFromTest'
	],
	#category : #'Application-Starter-Tests'
}

{ #category : #accessing }
DummyApplicationStarterCommandLineHandler class >> commandName [

	^ 'dummy'
]

{ #category : #'private - accessing' }
DummyApplicationStarterCommandLineHandler class >> defaultLogsPath [

	^ memoryLogPathConfiguredFromTest
]

{ #category : #'private - accessing' }
DummyApplicationStarterCommandLineHandler class >> defaultLogsPath: aPath [

	memoryLogPathConfiguredFromTest := aPath
]

{ #category : #accessing }
DummyApplicationStarterCommandLineHandler class >> description [

	^ 'this is a dummy command line handler for tests'
]

{ #category : #'private - accessing' }
DummyApplicationStarterCommandLineHandler class >> logPrefix [

	^ 'dummy'
]

{ #category : #initialization }
DummyApplicationStarterCommandLineHandler >> activationBlock: aBlock [

	activationBlock := aBlock
]

{ #category : #'private - activation' }
DummyApplicationStarterCommandLineHandler >> basicActivate [

	activationBlock value
]

{ #category : #'private - accessing' }
DummyApplicationStarterCommandLineHandler >> configurationDefinition [

	^ OrderedCollection new
		add: ( MandatoryArgument named: #mandatory );
		add: ( OptionalArgument named: 'optional' defaultingTo: 'unused-optional' );
		add: ( MandatoryArgument named: 'secret' ) asSensitive;
		yourself
]

{ #category : #initialization }
DummyApplicationStarterCommandLineHandler >> initialize [

	super initialize.
	self activationBlock: [  ]
]

{ #category : #initialization }
DummyApplicationStarterCommandLineHandler >> stderr: anOutputStream [

	stderr := VTermOutputDriver on: anOutputStream
]

{ #category : #initialization }
DummyApplicationStarterCommandLineHandler >> stdout: anOutputStream [

	stdout := VTermOutputDriver on: anOutputStream
]
