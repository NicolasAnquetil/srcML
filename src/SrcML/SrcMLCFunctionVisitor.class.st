Class {
	#name : 'SrcMLCFunctionVisitor',
	#superclass : 'SrcMLAbstractVisitor',
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'entity creation' }
SrcMLCFunctionVisitor >> famix: famixClass [

	^famixClass new
		mooseModel: famixModel ;
		yourself
]

{ #category : 'entity creation' }
SrcMLCFunctionVisitor >> famix: famixClass named: aString [

	^(self famix: famixClass)
		name: aString ;
		yourself
]

{ #category : 'entity creation' }
SrcMLCFunctionVisitor >> visitDecl: anXMLNode forFamixClass: aFamixClass [

	| visited |
	visited := (self visitNodeWithKeys: anXMLNode)
		at: 'decl'
		ifAbsent: [ ^nil ].

	^(self famix: aFamixClass)
		name: (visited at: 'name') ;
		declaredType: (visited at: 'type') ;
		yourself
	 
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementComment: anXMLNode [

	^(self famix: FamixJavaComment)
		content: (super visitElementComment: anXMLNode) ;
		yourself
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementDecl_stmt: anXMLNode [
	"decl"

	^self visitDecl: anXMLNode forFamixClass: FamixJavaLocalVariable	 
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementFunction: anXMLElement [

	"type name parameter_list block"
	| visited function |
	visited := 	super visitElementFunction: anXMLElement.

	function := self famix: FamixJavaMethod named: (visited at: 'name').
	function parameters: (visited at: 'parameter_list').
	function declaredType: (visited at: 'type').
	function localVariables: ((visited at: 'block') select: [:node | node isMooseEntity and: [node isLocalVariable] ]).

	^function
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementParameter: anXMLParameter [
	"decl"

	^self visitDecl: anXMLParameter forFamixClass: FamixJavaParameter 
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementParameter_list: anXMLElement [

	^((super visitElementParameter_list: anXMLElement)
		reject: #isString)
		reject: #isNil
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementType: anXMLNode [

	| visits |
	visits := self visitNodeWithKeys: anXMLNode.

	visits ifNil: [ ^nil].

	^visits
		at: 'name'
		ifPresent: [self famix: FamixJavaType named: (visits at: 'name')]
		ifAbsent: [ nil ]
]
