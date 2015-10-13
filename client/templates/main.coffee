Template.main.rendered = ->
	Tracker.autorun ->
		FlowRouter.watchPathChange()

		# left header control
		if FlowRouter.current().route.name == 'picture'
			$('#header_chatroom_button').show()
		else
			$('#header_chatroom_button').hide()


		# right header control
		if FlowRouter.current().path is '/'
			$('#header_list_button').hide()
		else
			$('#header_list_button').show()


		# welcome modal
		if Session.equals 'hideWelcome', true
			$('#welcome').hide()
			$('#header').show()
			$('body').css 'height', 'auto'
		else
			$('#header').hide()
			$('#welcome').show()
			$('body').css 'height', '100%'
