### Public routes ###

exposed = FlowRouter.group {}


### Default Route ###

exposed.route '/',

	name   : 'default'

	action : (params, queryParams) ->
		FlowRouter.go 'welcome'


### Welcome View ###

exposed.route '/welcome',

	name   : 'welcome'

	action : (params, queryParams) ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'welcome'


### Login View ###

exposed.route '/login',

	name   : 'login'

	action : (params, queryParams) ->
		unless Meteor.loggingIn() or Meteor.userId()
			BlazeLayout.render 'mainLayout',
				top  : 'header'
				main : 'login'
		else
			FlowRouter.go 'default'


### Signup View ###

exposed.route '/signup',

	name   : 'sign up'

	action : (params, queryParams) ->
		unless Meteor.loggingIn() or Meteor.userId()
				BlazeLayout.render 'mainLayout',
					top  : 'header'
					main : 'signup'
		else
			FlowRouter.go 'default'


### Verify View ###

exposed.route '/verify',

	name   : 'verify'

	action : (params, queryParams) ->
			BlazeLayout.render 'mainLayout',
				top  : 'header'
				main : 'verify'


### Forgot View ###

exposed.route '/forgot',

	name   : 'forgot'

	action : (params, queryParams) ->
			BlazeLayout.render 'mainLayout',
				top  : 'header'
				main : 'forgot'


### Pictures View ###

exposed.route '/pictures',

	name   : 'uploads'

	action : (params, queryParams) ->
		BlazeLayout.render 'mainLayout',
			top  : 'header'
			main : 'pictures'


### Logged in routes ###

loggedIn = FlowRouter.group
	# redirect to login view if not logged in
	triggersEnter : [ (context, redirect, stop) ->
		unless Meteor.loggingIn() or Meteor.userId()
			route = FlowRouter.current()

			unless route.route.name is 'login'
				# save requested path to redirect back to after login
				Session.set 'redirectAfterLogin', route.path

			FlowRouter.go 'login'
		# else
		# 	# NOTE - tried this to fix /logout route, but not working
		# 	stop()
	]


### Detail View ###

loggedIn.route '/:pictureId',

	name   : 'detail'

	action : (params, queryParams) ->
		picture = Pictures.findOne { _id : params.pictureId }

		if picture
			Session.set 'pictureId', picture._id

			BlazeLayout.render 'mainLayout',
				top  : 'header'
				main : 'detail'

		else
			BlazeLayout.render 'fullscreenLayout',
				main : 'notFound'


### Comments View ###

loggedIn.route '/:pictureId/comments',

	name   : 'comments'

	action : (params, queryParams) ->
		picture = Pictures.findOne { _id : params.pictureId }

		if picture
			Session.set 'pictureId', picture._id

			BlazeLayout.render 'mainLayout',
				top  : 'header'
				main : 'comments'

		else
			BlazeLayout.render 'fullscreenLayout',
				main : 'notFound'


### Logout ###

###
loggedIn.route '/logout',

	name   : 'logout'

	action : (params, queryParams) ->
		Meteor.logout ->
			FlowRouter.go 'login'
###

### Not found route ###

FlowRouter.notFound =
	action : ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'notFound'
