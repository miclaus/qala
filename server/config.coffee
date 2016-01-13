# Accounts.config
#   sendVerificationEmail : true


Meteor.startup ->
  UploadServer.init
    tmpDir: process.env.PWD + '/.uploads/tmp'
    uploadDir: process.env.PWD + '/.uploads/'
    checkCreateDirectories: true
    finished: (fileInfo, formFields) ->
      console.log 'upload finished, perform a disk operation'
    mimeTypes:
      'jpeg': 'image/jpeg'
      'jpg': 'image/jpeg'
      'png': 'image/png'
      'bmp': 'image/bmp'
