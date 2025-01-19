Class {
	#name : 'SrcMLVisitingNodeFactory',
	#superclass : 'Object',
	#instVars : [
		'configuration',
		'xmlElementToFamix'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'accessing' }
SrcMLVisitingNodeFactory >> attributeListClass [

	^SrcMLStubAtrtibuteList
]

{ #category : 'accessing' }
SrcMLVisitingNodeFactory >> classForElement: elementName namespaceURI: aString2 localName: aString3 attributes: aCollection [ 

	self shouldNotImplement 
]

{ #category : 'accessing' }
SrcMLVisitingNodeFactory >> instantiateElement: elementName namespaceURI: aString2 localName: aString3 attributes: aCollection [ 

	'instantiateElement: ' trace.
	elementName traceCr.

	^xmlElementToFamix
		at: elementName
		ifPresent: [ :elementClass | elementClass new ]
		ifAbsent: [ SrcMLSinkNode instance ]
]

{ #category : 'instance creation' }
SrcMLVisitingNodeFactory >> javaXMLToFamix [

	^{
	'unit' -> XMLElement . 
	'package' -> FamixJavaPackage 
	}
]

{ #category : 'instance creation' }
SrcMLVisitingNodeFactory >> newDocument [

	'new document' traceCr.

	xmlElementToFamix := Dictionary newFrom: self javaXMLToFamix.

	^SrcMLStubNode new
		xmlClass: #Document ;
		yourself
]

{ #category : 'instance creation' }
SrcMLVisitingNodeFactory >> newStringNode: aString [ 

	'new StringNode: "' trace.
	aString trace.
	'"' traceCr.

	^ XMLString new string: aString
]

{ #category : 'accessing' }
SrcMLVisitingNodeFactory >> nodeListClass [

	^SrcMLStubNodeList 
]

{ #category : 'instance creation' }
SrcMLVisitingNodeFactory >> xmlElementToFamix: elementName [

	^xmlElementToFamix at: elementName ifAbsent: [ SrcMLSinkNode ]
]
