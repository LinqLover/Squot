ansi gettable
skip: anInteger
	isBinary
		ifTrue: [position := position + anInteger min: handle size + 1]
		ifFalse: [anInteger timesRepeat: [
				self atEnd ifTrue: [^ self].
				self converter nextFromStream: self]]