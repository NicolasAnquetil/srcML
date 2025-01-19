Class {
	#name : 'SrcMLDOMParser',
	#superclass : 'XMLDOMParser',
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'private' }
SrcMLDOMParser >> pushElement: anElement [

	anElement isNilNode ifTrue: [ 
		'Not pushing ' trace.
		anElement asString traceCr.
		^anElement ].
	^super pushElement: anElement 
]

{ #category : 'handling - content' }
SrcMLDOMParser >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self pushElement:
		((self nodeFactory
			instantiateElement: aQualifiedName
			namespaceURI: aURI
			localName: aLocalName
			attributes: anAttributeDictionary)
				setConfiguration: self configuration
				name: aQualifiedName
				localName: aLocalName
				attributes: anAttributeDictionary
				namespaceScope: currentScope)
]
