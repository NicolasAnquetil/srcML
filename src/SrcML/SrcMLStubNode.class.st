Class {
	#name : 'SrcMLStubNode',
	#superclass : 'XMLElement',
	#instVars : [
		'xmlClass',
		'famix'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'accessing' }
SrcMLStubNode >> configuration: aXMLDOMConfiguration [ 

	configuration := aXMLDOMConfiguration 
]

{ #category : 'accessing' }
SrcMLStubNode >> encoding: aString [ 
	"ignore file encoding"
]

{ #category : 'accessing' }
SrcMLStubNode >> famix [

	^ famix
]

{ #category : 'accessing' }
SrcMLStubNode >> famix: anObject [

	famix := anObject
]

{ #category : 'testing' }
SrcMLStubNode >> isStandalone: aBoolean [ 
	"ignore"
]

{ #category : 'accessing' }
SrcMLStubNode >> setConfiguration: aConfiguration name: elementName localName: aLocalName attributes: anAttributeDictionary namespaceScope:aScope [

		^(aConfiguration nodeFactory xmlElementToFamix: elementName)
			ifNotNil: [ :famixClass | self famix: famixClass new ]

]

{ #category : 'versions' }
SrcMLStubNode >> version: aNumber [ 
	"ignore XML version"
]

{ #category : 'accessing' }
SrcMLStubNode >> xmlClass [

	^ xmlClass
]

{ #category : 'accessing' }
SrcMLStubNode >> xmlClass: anObject [

	xmlClass := anObject
]
