# if(Meteor.isClient){
# 	Template.login.events({
# 		'submit form': function(event, template){
# 			event.preventDefault();
# 			var signup_username = template.find('#signup_username').value;
# 			var signup_email = template.find('#signup_email').value;
# 			var signup_password = template.find('#signup_password').value;
# 			Accounts.createUser({
# 				username: signup_username,
# 				email: signup_email,
# 				password: signup_password
# 			});
# 		}
# 	});
# }

if Meteor.isClient
  Template.signup.events 'submit form': (event, template) ->
    event.preventDefault()
    signup_username = template.find('#signup_username').value
    signup_email = template.find('#signup_email').value
    signup_password = template.find('#signup_password').value
    Accounts.createUser
      username: signup_username
      email: signup_email
      password: signup_password
    return

