Template.detail.onCreated ->
	self = this
	self.autorun ->
		self.subscribe 'pictures'
		self.subscribe 'comments'

Template.detail.helpers
	picture : ->
		pictureId = Session.get 'pictureId'
		Pictures.findOne ( _id : pictureId )

	comments : ->
		Comments.find({ pictureId : @_id }).fetch().length

Template.detail.events
	'click .detail-likes,
	 click .detail__img' : (event) ->
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

	'click .detail-comments': ->
		$('#message').focus()
