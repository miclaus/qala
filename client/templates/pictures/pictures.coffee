searchPictures = ->
  pictures = Pictures.find({}).fetch()

  # calculate comments count
  _.each pictures, (picture) ->
    picture.comments = Comments.find({ pictureId : picture._id }).fetch().length

  pictures

Template.pictures.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'pictures'
    self.subscribe 'comments'

Template.pictures.helpers
	pictures : ->
		searchPictures()

###
searchPicturesByUsername = ->
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

	pictures


resetSearchQuery = ->
	Session.set 'searchQuery', ''
	$('#pictures_search_input').val ''


Template.pictures.onDestroyed = ->
	resetSearchQuery()


Template.pictures.helpers {
	pictures : ->
		searchPicturesByUsername()
}

Template.pictures.events
	'focus #pictures_search_input' : (event) ->
		$(event.target).keypress()

	'keyup #pictures_search_input' : ->
		searchQuery = $( event.target ).val()
		Session.set 'searchQuery', searchQuery
		searchPicturesByUsername()
###
