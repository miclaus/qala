Meteor.startup ->
	Uploader.finished = (index, fileInfo, templateContext) ->
    	console.log fileInfo
