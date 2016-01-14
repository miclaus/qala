searchPictures = ->
	searchQuery = $.trim( Session.get 'searchQuery' )
	searchQuery = searchQuery.replace('/', '') # prevent invalid regex pattern injection
	searchQuery = searchQuery  || ''

	if searchQuery isnt ''
		pictures = Pictures.find( username : {
			$regex 	 : searchQuery,
			$options : 'i'
		}).fetch()

	else
		pictures = Pictures.find().fetch()

	# calculate comments count
	_.each pictures, (picture) ->
		picture.comments = Comments.find({ pictureId : picture._id }).fetch().length

	pictures

resetSearchQuery = ->
	Session.set 'searchQuery', ''
	$('#pictures_search_input').val ''

Template.pictures.onCreated ->
	Uploader.init this
	self = this
	self.autorun ->
		self.subscribe 'pictures'
		self.subscribe 'comments'

# Template.pictures.onRendered ->
# 	Uploader.render.call this

Template.pictures.onDestroyed ->
	resetSearchQuery()

Template.pictures.helpers
	pictures : ->
		searchPictures()
	uploaderCallbacks : ->
		finished: (index, fileInfo, context) ->
			console.log fileInfo

Template.pictures.events
	'click .grid-item-picture,
	 click .grid-item-comments' : ->
		if Meteor.loggingIn() or Meteor.userId()
			FlowRouter.go('/' + @_id)
		else
			FlowRouter.go '/login'

	'focus #pictures_search_input' : (event) ->
		$(event.target).keypress()

	'keyup #pictures_search_input' : ->
		searchQuery = $( event.target ).val()
		Session.set 'searchQuery', searchQuery
		searchPictures()

	'click .grid-item-likes' : (event) ->
		if Meteor.loggingIn() or Meteor.userId()
			pictureId = @_id
			userId = Meteor.userId()
			picture = Pictures.findOne({ _id : pictureId })
			likes = picture.likes
			alreadyLiked = _.contains(likes, userId);
			unless alreadyLiked
				Pictures.update {
					_id : pictureId
				},
				{
					$push : { likes : userId }
				}
				$( event.target ).addClass('liked')
		else
			FlowRouter.go 'login'


	'click #pictures_upload' : (event) ->
		unless Meteor.loggingIn() or Meteor.userId()
			FlowRouter.go 'login'
		else
			if $('#pictures_upload').hasClass 'ready-to-upload'
				userId = Meteor.userId()
				userData = Meteor.users.findOne(userId)

				Session.set('uploaderUserId', userId);
				Session.set('uploaderUsername', userData.username)

				$('#pictures_upload').removeClass 'ready-to-upload'
				if $('.start')[0]
					$('.start')[0].click()
				if $('.done')[0]
					$('.done')[0].click()
			else
				$('#picture_uploader input[type="file"]').click()
				$('#pictures_upload').addClass 'ready-to-upload'
				# if prompt 'Are you a robot?', '20 + 6 = ?' is 26
				# 	$('#pictures_upload').click()
				# else
				# 	alert 'Sorry'

	# 'click #pictures_upload' : ->
	# 	unless Meteor.loggingIn() or Meteor.userId()
	# 		FlowRouter.go 'login'
	# 	else
	# 		labelTextBefore = $('#picture_uploader .progress-label')[0].innerText
	# 		$('#picture_uploader input[type="file"]')[0].click()
	# 		pictureUploaderInterval = Meteor.setInterval ->
	# 			console.log 'halow'
	# 			labelTextAfter = $('#picture_uploader .progress-label')[0].innerText
	# 			console.log labelTextAfter
	# 			if labelTextBefore is not labelTextAfter
	# 				console.log labelTextAfter
	# 			else
	# 				Meteor.clearInterval(pictureUploaderInterval)
	# 		, 1000


return
