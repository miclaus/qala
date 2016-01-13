# Signup
Accounts.onCreateUser (options, user) ->
	Accounts.sendVerificationEmail(Meteor.userId())
	return user
