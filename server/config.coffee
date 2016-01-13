# Accounts.config
# 	sendVerificationEmail : true


Meteor.startup ->
	UploadServer.init
		tmpDir: process.env.PWD + '/.uploads/tmp'
		uploadDir: process.env.PWD + '/.uploads/'
		checkCreateDirectories: true # creates the directories for you
