Extension { #name : 'XMLNode' }

{ #category : '*SrcML' }
XMLNode >> endElement: indent [

	(String new: indent withAll: Character space) trace.
	'<  ' trace.
	self name traceCr
]

{ #category : '*SrcML' }
XMLNode >> startElement: indent [

	(String new: indent withAll: Character space) trace.
	'-> ' trace.
	self name traceCr
]
