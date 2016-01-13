if Meteor.isClient
    Template.profile.events 'click .logout': (event) ->
        event.preventDefault()
        Meteor.logout()
        return

uploads_tab = document.querySelector('.uploads_tab')
likes_tab = document.querySelector('.likes_tab')
uploads = document.querySelector('.uploads')
likes = document.querySelector('.likes')

# if uploads_tab
uploads_tab.onclick = (event) ->
    event.preventDefault()
    likes.classList.remove 'active_tab'
    likes_tab.classList.remove 'active'
    uploads.classList.add 'active_tab'
    uploads_tab.classList.add 'active'
    return

# if likes_tab
likes_tab.onclick = (event) ->
    event.preventDefault()
    likes.classList.add 'active_tab'
    likes_tab.classList.add 'active'
    uploads.classList.remove 'active_tab'
    uploads_tab.classList.remove 'active'
    return
