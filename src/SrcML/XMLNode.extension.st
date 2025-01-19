Extension { #name : 'XMLNode' }

{ #category : '*SrcML' }
XMLNode >> endElement [

	'ending: ' trace.
	self asString traceCr
]

{ #category : '*SrcML' }
XMLNode >> isNilNode [

	^false
]
