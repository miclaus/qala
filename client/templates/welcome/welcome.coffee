Template.welcome.onRendered ->
	setTimeout( ->
		FlowRouter.go '/pictures'
	, 1600)
