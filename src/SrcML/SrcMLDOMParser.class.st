Class {
	#name : 'SrcMLDOMParser',
	#superclass : 'XMLDOMParser',
	#instVars : [
		'indent',
		'famixStack',
		'famixNodes',
		'famixModel'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'handling - content' }
SrcMLDOMParser >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [

"	famixNodes
		at: aQualifiedName
		ifPresent: [ famixStack pop ].
"
	indent := indent - 1.
	self popNode endElement: indent.
]

{ #category : 'handling - content' }
SrcMLDOMParser >> famixForXML: nodeKind [

	famixNodes
		at: nodeKind
		ifPresent: [ :famixClass || famixEntity |
			famixEntity := famixClass new mooseModel: famixModel.
			((famixClass = FamixJavaMethod) and: [ famixStack isEmpty not ])
				ifTrue: [ famixEntity parentType: famixStack top ].
			famixStack push: famixEntity 
		]
]

{ #category : 'accessing' }
SrcMLDOMParser >> famixModel [

	^famixModel
]

{ #category : 'initialization' }
SrcMLDOMParser >> initialize [

	super initialize.
	
	indent := 0.

	famixModel := FamixJavaModel new.
	famixStack := Stack new.
	famixNodes := Dictionary newFrom: self srcMLNodeToFamix
]

{ #category : 'initialization' }
SrcMLDOMParser >> srcMLNodeToFamix [

	^{
	'class' -> FamixJavaClass .
	'function_decl' -> FamixJavaMethod
	}
]

{ #category : 'handling - content' }
SrcMLDOMParser >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [

	super startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary.

	"self famixForXML: aQualifiedName."

	self nodeStack last startElement: indent.
	indent := indent + 1
]
