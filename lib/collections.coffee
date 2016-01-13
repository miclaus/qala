# Pictures
# id, createdAt, userId, username, likes[] (FK userIds), colors[]

@Pictures = new Mongo.Collection('pictures')

# Comments
# id, createdAt, userId, username

@Comments = new Mongo.Collection('comments')

# User
# id, username, password, email, pictures[] (FK pictureIds)
# NOTE - users table should defaultly be defined for
# 		  the accounts package simply use Meteor.users
# @Users = new Mongo.Collection('users')
