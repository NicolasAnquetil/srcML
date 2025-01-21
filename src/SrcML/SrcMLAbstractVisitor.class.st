Class {
	#name : 'SrcMLAbstractVisitor',
	#superclass : 'XMLNodeVisitor',
	#instVars : [
		'tracing',
		'famixModel'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'private' }
SrcMLAbstractVisitor >> detectChildNode: aNode key: aKey [

	^aNode nodes
		detect: [ :child | child isElement and: [child name = aKey] ]
		ifNone: [ nil ]
]

{ #category : 'reflective operations' }
SrcMLAbstractVisitor >> doesNotUnderstand: aMessage [

	super doesNotUnderstand: aMessage
	"| method |
	method := String streamContents: [ :st |
		st
			<< aMessage selector ;
			<< ' anXMLElement' ;
			cr ;
			tab ;
			<< '^true' ;
			cr
	].

	SrcMLVisitor compile: method classified: 'visiting'.
	^true"
]

{ #category : 'initialization' }
SrcMLAbstractVisitor >> initialize [

	super initialize.

	tracing := false
]

{ #category : 'private' }
SrcMLAbstractVisitor >> mkVisitSelector: anElement [

	^'visitElement' ,
	('' join: (($: split: anElement name) collect: #capitalized)) ,
	':'
]

{ #category : 'accessing' }
SrcMLAbstractVisitor >> mooseModel: aMooseModel [

	famixModel := aMooseModel 
]

{ #category : 'visiting' }
SrcMLAbstractVisitor >> visitElement: anElement [
	| visitor |
	visitor := (self mkVisitSelector: anElement) asSymbol.

	^self perform: visitor with: anElement

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementAnnotation: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementArgument: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementArgument_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementAsm: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementAssert: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementAttribute: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementBlock: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementBlock_content: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementBreak: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCall: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCapture: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCase: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCast: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCatch: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementClass: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementClass_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementComment: anXMLElement [

	^anXMLElement nodes anyOne string.

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCondition: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementConstructor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementConstructor_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementContinue: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementControl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppDefine: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppDirective: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppElif: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppElse: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppEmpty: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppEndif: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppError: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppFile: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppIf: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppIfdef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppIfndef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppInclude: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppLine: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppLiteral: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppMacro: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppNumber: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppPragma: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppUndef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppValue: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementCppWarning: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDecl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDecl_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDecltype: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDefault: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDestructor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDestructor_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementDo: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementElse: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementEmpty_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementEnum: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementEnum_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementExpr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementExpr_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementExtends: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementExtern: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementFor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementFriend: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementFunction: anXMLElement [ 

	^super visitNodeWithElements: anXMLElement 
]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementFunction_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementGoto: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementIf: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementIf_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementImplements: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementImport: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementIncr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementIndex: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementInit: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementInterface: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementLabel: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementLambda: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementLiteral: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementMacro: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementMember_init_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementModifier: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementName: anXMLElement [

	^anXMLElement nodes anyOne string.


]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementNamespace: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementNoexcept: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpArgument: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpArgument_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpClause: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpDirective: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpExpr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOmpName: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementOperator: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementPackage: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementParameter: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementParameter_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementPrivate: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementProtected: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementPublic: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementRange: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementReturn: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSizeof: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSpecifier: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementStruct: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementStruct_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSuper: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSuper_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSwitch: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementSynchronized: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTemplate: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTernary: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementThen: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementThrow: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementThrows: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTry: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementType: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTypedef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTypeid: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementTypename: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementUnion: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementUnit: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementUsing: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLAbstractVisitor >> visitElementWhile: anXMLElement [
	^true

]

{ #category : 'visiting' }
SrcMLAbstractVisitor >> visitStringNode: aStringNode [

	^aStringNode string
]
