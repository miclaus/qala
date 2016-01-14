Meteor.startup ->

  Uploader.finished = (index, fileInfo, templateContext) ->
    url = fileInfo.url
    sourceImage = document.createElement('img')
    sourceImage.src = url
    colors = []
    sourceImage.onload = ->
      colorThief = new ColorThief.colorRob()
      colors = colorThief.getPalette(sourceImage, 2) # 2=3
    Pictures.insert
      createdAt: moment().format('LLL')
      url: url
      userId: Session.get('uploaderUserId')
      username: Session.get('uploaderUsername')
      likes: []
      colors: colors
      views: 0
    Session.set 'uploaderUserId', null
    Session.set 'uploaderUsername', null
    return

  return
