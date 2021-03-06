loading and unloading
loadVersionInteractively: aVersion ifCanceled: cancelBlock
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| patch |
	self addGlobalObjectsToStore: aVersion lazySnapshot.
	patch := self incomingPatchWhenLoading: aVersion.
	self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value].
	patch hasChanges ifTrue:
		[self loadedVersion: aVersion].