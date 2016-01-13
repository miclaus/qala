# Pictures
# id, createdAt, userId, username, likes (FK userIds), colors

@Pictures = new Mongo.Collection('pictures')

# Comments
# id, createdAt, pictureId, userId, username

@Comments = new Mongo.Collection('comments')

# User
# id, username, password, email, pictures (FK pictureIds)
