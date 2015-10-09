Template.chatroom.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#chatroom').show()
		else
			$('#chatroom').hide()

Template.chatroom.helpers {
	room : ->
		Session.get('chatroom')
	users : ->
		# TODO get active sessions
		return 10
	moments : ->
		chatroom = Session.get('chatroom')
		Pictures.find({room : chatroom}).fetch().length
	pictures : ->
		chatroom = Session.get('chatroom')
		pictures = Pictures.find({room : chatroom}).fetch()
} 

Template.chatroom.events {
	'click #chatroom_pictures' : (event) ->
		pictureId = $(event.target).attr('data-ref')
		chatroom = Session.get('chatroom')
		FlowRouter.go('/' + chatroom + '/' + pictureId)
}