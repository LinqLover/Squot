tests
testUnloadedDoNotAppearInSaveUnlessModifiedOrAdded
	| artifactSnapshot patch |
	store add: ValueHolder new at: 'object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	store removeAt: 'object'.
	workingCopy addUnloaded: artifactSnapshot.
	patch := workingCopy newSaveOperation
				message: 'Add object';
				applyToWorkingCopy;
				patch.
	self assert: (patch includesDiffAt: 'object').
	patch := workingCopy newSaveOperation
				message: 'Next version';
				applyToWorkingCopy;
				patch.
	self deny: (patch includesDiffAt: 'object').