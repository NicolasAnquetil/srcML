Class {
	#name : 'SrcMLVisitor',
	#superclass : 'XMLNodeVisitor',
	#instVars : [
		'tracing'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'reflective operations' }
SrcMLVisitor >> doesNotUnderstand: aMessage [

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
SrcMLVisitor >> initialize [

	super initialize.

	tracing := false
]

{ #category : 'private' }
SrcMLVisitor >> mkVisitSelector: anElement [

	^'visitElement' ,
	('' join: (($: split: anElement name) collect: #capitalized)) ,
	':'
]

{ #category : 'visiting' }
SrcMLVisitor >> visitElement: anElement [
	| visiter |
	visiter := self mkVisitSelector: anElement.

	(self perform: visiter asSymbol with: anElement)
	ifTrue: [ ^ self visitNodeWithElements: anElement ]
	ifFalse: [ ^false ]
]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementAnnotation: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementArgument: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementArgument_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementAsm: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementAssert: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementAttribute: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementBlock: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementBlock_content: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementBreak: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCall: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCapture: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCase: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCast: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCatch: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementClass: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementClass_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementComment: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCondition: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementConstructor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementConstructor_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementContinue: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementControl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppDefine: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppDirective: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppElif: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppElse: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppEmpty: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppEndif: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppError: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppFile: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppIf: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppIfdef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppIfndef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppInclude: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppLine: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppLiteral: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppMacro: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppNumber: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppPragma: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppUndef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppValue: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementCppWarning: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDecl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDecl_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDecltype: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDefault: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDestructor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDestructor_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementDo: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementElse: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementEmpty_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementEnum: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementEnum_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementExpr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementExpr_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementExtends: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementExtern: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementFor: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementFriend: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementFunction: anXMLElement [ 

	'visitElementFunction: ' trace.
	tracing := true.
	anXMLElement nodes do: [ :childElt |
		(childElt isElement and: [ childElt name = 'name' ])
			ifTrue: [ childElt acceptNodeVisitor: self ]
	].
	'' traceCr.
	tracing := false.
	^true
]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementFunction_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementGoto: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementIf: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementIf_stmt: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementImplements: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementImport: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementIncr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementIndex: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementInit: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementInterface: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementLabel: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementLambda: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementLiteral: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementMacro: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementMember_init_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementModifier: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementName: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementNamespace: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementNoexcept: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpArgument: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpArgument_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpClause: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpDirective: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpExpr: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOmpName: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementOperator: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementPackage: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementParameter: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementParameter_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementPrivate: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementProtected: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementPublic: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementRange: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementReturn: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSizeof: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSpecifier: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementStruct: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementStruct_decl: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSuper: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSuper_list: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSwitch: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementSynchronized: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTemplate: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTernary: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementThen: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementThrow: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementThrows: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTry: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementType: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTypedef: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTypeid: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementTypename: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementUnion: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementUnit: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementUsing: anXMLElement [
	^true

]

{ #category : 'visiting - srcML' }
SrcMLVisitor >> visitElementWhile: anXMLElement [
	^true

]

{ #category : 'visiting' }
SrcMLVisitor >> visitStringNode: aStringNode [

	tracing ifTrue: [ aStringNode trace ].
	^super visitStringNode: aStringNode 
]
