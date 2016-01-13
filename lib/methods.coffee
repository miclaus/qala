Meteor.methods
	'Accounts.methods.createUser' : (user) ->
		# TODO - validation
		Accounts.createUser
			username: user.username
			email: user.email
			password: user.password

	'Accounts.methods.sendVerificationEmail' : (userId) ->
		# TODO - validation
		Accounts.sendVerificationEmail userId
