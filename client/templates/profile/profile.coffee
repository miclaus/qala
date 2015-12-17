if Meteor.isClient
  Template.profile.events 'click .logout': (event) ->
    event.preventDefault()
    Meteor.logout()
    return