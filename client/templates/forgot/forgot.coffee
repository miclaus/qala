# if(Meteor.isClient){
# 	Template.forgot.events({
# 		'submit form': function(event, template){
# 			event.preventDefault();
# 			var login_username = template.find('#login_username').value;
# 			var login_password = template.find('#login_email').value;
# 			Meteor.sendResetPasswordEmail(forgot_username,forgot_email);
# 		}
# 	});
# }