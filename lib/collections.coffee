# Pictures
# id, createdAt, userId, username, likes (FK userIds), colors

@Pictures = new Mongo.Collection('pictures')

if Pictures.find().fetch().length is 0
  Pictures.insert
    url: 'images/1.png'
  Pictures.insert
    url: 'images/2.png'
  Pictures.insert
    url: 'images/3.png'
  Pictures.insert
    url: 'images/4.png'
  Pictures.insert
    url: 'images/5.png'

# Comments
# id, createdAt, userId, username

@Comments = new Mongo.Collection('comments')

# User
# id, username, password, email, pictures (FK pictureIds)
