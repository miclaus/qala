Template.forgot.events
  'submit form': (event) ->
    event.preventDefault();
    forgot_username = $('#forgot_username').value;
    forgot_email = $('#forgot_email').value;

    if forgot_username
      userId = Users.findOne({
        username : forgot_username
      })._id
    else if forgot_email
      userId = Users.findOne({
        email : forgot_email
      })._id

    ###
    Meteor.call 'Accounts.methods.sendResetPasswordEmail',
        userId : userId
    return
    ###
