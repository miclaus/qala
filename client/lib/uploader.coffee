Meteor.startup ->

  Uploader.finished = (index, fileInfo, templateContext) ->
    console.log fileInfo
    # pictureId = Session.get 'pictureId'
    # url = Pictures.findOne( _id : pictureId ).url
    url = fileInfo.url
    sourceImage = document.createElement('img')
    sourceImage.src = url
    colorThief = new ColorThief.colorRob()
    console.log sourceImage
    colors = colorThief.getPalette(sourceImage, 3)
    console.log colors

    Pictures.insert
      createdAt: moment().format('LLL')
      url: url
      userId: Session.get('uploaderUserId')
      username: Session.get('uploaderUsername')
      likes: []
      colors: []
      views: 0
    Session.set 'uploaderUserId', null
    Session.set 'uploaderUsername', null
    return

  return
