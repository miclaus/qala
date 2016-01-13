Template.header.onRendered ->
	Tracker.autorun ->
		FlowRouter.watchPathChange()
		Session.set('currentPath', FlowRouter.current().path)
		Session.set('currentRouteName', FlowRouter.current().route.name)

Template.header.helpers
	isPictureView : ->
		if Session.get('currentPath') is '/pictures'
			true
		else
			false

	isAccountsView : ->
		if Session.get('currentPath') is '/login' or
		Session.get('currentPath') is '/signup' or
		Session.get('currentPath') is '/forgot' or
		Session.get('currentPath') is '/verify'
			true
		else
			false

	isLoggedIn : ->
		if Meteor.loggingIn() or Meteor.userId()
			true
		else
			false

	title : ->
		Session.get('currentRouteName')

Template.header.events
	'click #header_search_button' : ->
		$('#pictures_search').toggle()

	'click #header_back_button': ->
		history.back()

	'click #header_logout_button' : ->
		Meteor.logout ->
			FlowRouter.go 'login'
