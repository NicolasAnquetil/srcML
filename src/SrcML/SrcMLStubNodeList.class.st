Class {
	#name : 'SrcMLStubNodeList',
	#superclass : 'XMLNodeList',
	#category : 'SrcML',
	#package : 'SrcML'
}

{ #category : 'private' }
SrcMLStubNodeList >> afterAddingLast: aNode [

	aNode isString
		ifFalse: [ super afterAddingLast: aNode ]
]
