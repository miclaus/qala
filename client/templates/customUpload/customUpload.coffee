Template.customUpload.created = ->
  Uploader.init this

Template.customUpload.rendered = ->
  Uploader.render.call this

Template.customUpload.events
  'change #picture_input': (event) ->
    console.log 'picture_input has changed ...'
    Uploader.startUpload.call Template.instance(), event


# Template.customUpload.helpers
# 	'infoLabel': ->
# 		instance = Template.instance()
# 		if instance.info.get()
# 			if instance.globalInfo.get().running
# 				returnVal = info.name + ' - ' + progress.progress + '% - [' + progress.bitrate + ']'
# 			else
# 				returnVal = info.name + ' - ' + info.size + 'B'
#
# 	'progress': ->
# 		Template.instance().globalInfo.get().progress + '%'
