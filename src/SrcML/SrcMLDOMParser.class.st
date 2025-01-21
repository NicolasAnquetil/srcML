Class {
	#name : 'SrcMLDOMParser',
	#superclass : 'XMLDOMParser',
	#instVars : [
		'famixModel'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'handling - content' }
SrcMLDOMParser >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [

	(self srcMLNodeToVisit includes: aQualifiedName)
		ifTrue: [
			self topNode
				acceptNodeVisitor: (self famixVisitorFor: aQualifiedName).
			self topNode nodes removeAll.
		].

	super endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName

]

{ #category : 'accessing' }
SrcMLDOMParser >> famixModel [

	^famixModel
]

{ #category : 'handling - content' }
SrcMLDOMParser >> famixVisitorFor: ElementName [

	^SrcMLCFunctionVisitor new
		mooseModel: famixModel ;
		yourself
]

{ #category : 'initialization' }
SrcMLDOMParser >> initialize [

	super initialize.

	famixModel := FamixJavaModel new
]

{ #category : 'initialization' }
SrcMLDOMParser >> srcMLNodeToVisit [

	^#( function comment )
]
