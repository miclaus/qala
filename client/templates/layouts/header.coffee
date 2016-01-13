Template.header.helpers {
	isPictureView : ->
		if FlowRouter.current().path is '/pictures'
			true

	isLoggedIn : ->
		if Meteor.loggingIn() or Meteor.userId()
			true
		else
			false
}
