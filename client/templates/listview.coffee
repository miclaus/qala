searchChatrooms = ->
	searchQuery = $.trim( Session.get 'searchQuery' )
	searchQuery = searchQuery.replace('/', '') # prevent invalid regex pattern injection
	searchQuery = searchQuery  || ''

	if searchQuery isnt ''
		chatrooms = Chatrooms.find( name : {
			$regex 	 : searchQuery,
			$options : 'i'
		}).fetch()

	else
		chatrooms = Chatrooms.find().fetch()

	# calculate moments count
	_.each chatrooms, (chatroom) ->
		chatroom.moments = Pictures.find({ room : chatroom.code }).fetch().length

	chatrooms


resetSearchQuery = ->
	Session.set 'searchQuery', ''
	$('#search_chatrooms').val ''


Template.listview.rendered = ->
	Tracker.autorun ->
		# animation to/from listview
		if Session.equals 'hideWelcome', true
			$('#listview').fadeIn 300
		else
			$('#listview').hide()


Template.listview.onDestroyed = ->
	resetSearchQuery()


Template.listview.helpers {
	chatrooms : ->
		searchChatrooms()
}


Template.listview.events {
	'click .list-chatroom-item' : ->
		FlowRouter.go('/' + @code)
		resetSearchQuery()

	'keyup #search_chatrooms' : ->
		searchQuery = $( event.target ).val()
		Session.set 'searchQuery', searchQuery
		searchChatrooms()
}
