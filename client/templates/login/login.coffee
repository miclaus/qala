if Meteor.isClient
  Template.login.events 'submit form': (event, template) ->
    event.preventDefault()
    login_username = template.find('#login_username').value
    login_email = template.find('#login_email').value
    login_password = template.find('#login_password').value
    Meteor.loginWithPassword login_username, login_password
    return
# 
# # redirect user back to requested path after login
# Accounts.onLogin ->
# 	redirect = Session.get 'redirectAfterLogin'
# 	
# 	if redirect?
# 		unless redirect is '/login'
# 			FlowRouter.go redirect