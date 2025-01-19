Class {
	#name : 'SrcMLSinkNode',
	#superclass : 'XMLElement',
	#classVars : [
		'Current'
	],
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'accessing' }
SrcMLSinkNode class >> instance [

	^ Current ifNil: [ Current := SrcMLSinkNode new ]
]

{ #category : 'accessing' }
SrcMLSinkNode class >> reset [

	Current := nil
]

{ #category : 'testing' }
SrcMLSinkNode >> isNilNode [

	^true
]
