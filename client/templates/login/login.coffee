Template.login.events
  'submit form': (event) ->
    event.preventDefault()
    login_username = $('#login_username').val()
    login_password = $('#login_password').val()
    Meteor.loginWithPassword login_username, login_password
    return false

## redirect user back to requested path after login
Accounts.onLogin ->
  FlowRouter.go '/pictures'

  ###
  redirect = Session.get 'redirectAfterLogin'

  if redirect?
    if redirect is '/login'
      FlowRouter.go '/pictures'
    else
      FlowRouter.go redirect
  else
    FlowRouter.go '/pictures'
  ###
