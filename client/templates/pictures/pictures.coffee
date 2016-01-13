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
	self = this
	self.autorun ->
		self.subscribe 'pictures'
		self.subscribe 'comments'

Template.pictures.onDestroyed ->
	resetSearchQuery()

Template.pictures.helpers
	pictures : ->
		searchPictures()

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

	'click #pictures_upload' : ->
		unless Meteor.loggingIn() or Meteor.userId()
			FlowRouter.go 'login'
