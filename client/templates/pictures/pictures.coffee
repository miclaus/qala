Template.pictures.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'pictures'

Template.pictures.helpers
	pictures : ->
		Pictures.find {} or {}



# var grid = document.querySelector('.container');
#
# var msnry = new Masonry( grid, {
# 	itemSelector: '.item',
# 	columnWidth: '.item',
# 	percentPosition: true,
#     isAnimated: true,
#     isFitWidth: true
# });
#
# imagesLoaded( grid, function() {
# 	msnry.layout();
# });

###grid = document.querySelector('.container')
msnry = new Masonry(grid,
  itemSelector: '.item'
  columnWidth: '.item'
  percentPosition: true
  isAnimated: true
  isFitWidth: true)
imagesLoaded grid, ->
  msnry.layout()
  return
###
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
