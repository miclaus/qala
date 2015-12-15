### Public routes ###

exposed = FlowRouter.group {}


### Login View ###

exposed.route '/login',

	name   : 'login'

	action : (params, queryParams) ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'login'


### Signup View ###

exposed.route '/signup',

	name   : 'signup'

	action : (params, queryParams) ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'signup'

### Forgot View ###

exposed.route '/forgot',

	name   : 'forgot'

	action : (params, queryParams) ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'forgot'


### Pictures View ###

exposed.route '/',

	name   : 'pictures'

	action : (params, queryParams) ->
		BlazeLayout.render 'mainLayout',
			top  : 'header'
			main : 'pictures'


### Logged in routes ###

loggedIn = FlowRouter.group
	# redirect to login view if not logged in
	triggersEnter : [ (context, redirect) ->
		unless Meteor.loggingIn() or Meteor.userId()
			route = FlowRouter.current()

			unless route.route.name is 'login'
				# save requested path to redirect back to after login
				Session.set 'redirectAfterLogin', route.path

			FlowRouter.go 'login'
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

loggedIn.route '/logout',

	name   : 'logout'

	action : (params, queryParams) ->
		Meteor.logout ->
			FlowRouter.go FlowRouter.path('login')


### Not found route ###

FlowRouter.notFound =
	action : ->
		BlazeLayout.render 'fullscreenLayout',
			main : 'notFound'
