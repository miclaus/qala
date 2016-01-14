Template.chat.helpers {
	comments : ->
		Comments.find({
			pictureId : @_id
		}, {
			sort : { createdAt : -1 }
		}).fetch()

	username : ->
		Meteor.user().username
}


Template.chat.events {
	'keyup #message' : (event) ->
		if event.keyCode is 13 and $( event.target ).val() isnt ''

			newMessage = $( event.target ).val()
			pictureId  = Session.get 'pictureId'

			Meteor.call 'addComment', newMessage, pictureId

			$( event.target ).val ''

			$('html, body').animate {
				scrollTop : $('#wrapper_message').offset().top
			}, 600

		false
}
