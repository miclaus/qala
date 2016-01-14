Meteor.startup ->

  Uploader.finished = (index, fileInfo, templateContext) ->
    Pictures.insert
      createdAt: moment().format('LLL')
      url: fileInfo.url
      userId: Session.get('uploaderUserId')
      username: Session.get('uploaderUsername')
      likes: []
      colors: []
      views: 0
    Session.set 'uploaderUserId', null
    Session.set 'uploaderUsername', null
    return

  return
