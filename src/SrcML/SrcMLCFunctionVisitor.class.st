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

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> famixDecl: anXMLParameter class: aFamixClass [
	"decl"

	| nameNode typeNode famix |
	nameNode := self
		detectChildNode: anXMLParameter nodes anyOne
		key: 'name'.
	typeNode := self detectChildNode: anXMLParameter nodes anyOne key: 'type' .

	famix := self famix: aFamixClass named: (self visitElement: nameNode).
	famix declaredType: (self visitElement: typeNode).
	^famix
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

	^self famixDecl: anXMLNode class: FamixJavaLocalVariable 
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementFunction: anXMLElement [

	"type name parameter_list block"

	| nameNode paramsNode typeNode blockNode function |
	typeNode := self detectChildNode: anXMLElement key: 'type' .
	nameNode := self detectChildNode: anXMLElement key: 'name' .
	paramsNode := self detectChildNode: anXMLElement key: 'parameter_list' .
	blockNode := self detectChildNode: anXMLElement key: 'block' .

	function := self famix: FamixJavaMethod named: (self visitElement: nameNode).
	function parameters: (self visitElement: paramsNode).
	function declaredType: (self visitElement: typeNode).
	^function
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementParameter: anXMLParameter [
	"decl"

	^self famixDecl: anXMLParameter class: FamixJavaParameter 
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementParameter_list: anXMLElement [
	"type name parameter_list block"

	^anXMLElement nodes
		select: #isElement
		thenCollect: [ :aChildElement | self visitElementParameter: aChildElement ]
]

{ #category : 'visiting - srcML' }
SrcMLCFunctionVisitor >> visitElementType: anXMLNode [
	"decl"

	| nameNode |
	nameNode := self
		detectChildNode: anXMLNode 
		key: 'name'.

	^self famix: FamixJavaType named: (self visitElement: nameNode)
]
