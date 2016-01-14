# Pictures

# dev only
Pictures.remove({})

if Pictures.find().fetch().length is 0
  Pictures.insert
    _id: '12345'
    url: 'images/1.png'
    likes: [
      'asdf'
      'awetret'
      'fjghj'
    ]
    username: 'iosif'
  Pictures.insert
    url: 'images/2.png'
    username: 'iosif'
  Pictures.insert
    _id: '56789'
    url: 'images/3.png'
    username: 'vali'
  Pictures.insert
    url: 'images/4.png'
    username: 'vali'
  Pictures.insert
    url: 'images/5.png'
    username: 'vali'

Meteor.publish 'pictures', ->
  Pictures.find {}

Pictures.allow
  # TODO only if loggedIn
  insert : ->
    true
  update : ->
    true

# Comments

# dev only
###
Comments.remove({})

if Comments.find().fetch().length is 0
  Comments.insert
    pictureId: '12345'
    message: 'hola'
    username: 'vali'
  Comments.insert
    pictureId: '56789'
    message: 'certo'
    username: 'vali'
  Comments.insert
    pictureId: '56789'
    message: 'farfalle'
    username: 'iosif'
  Comments.insert
    pictureId: '56789'
    message: 'haha'
    username: 'iosif'
###

Meteor.publish 'comments', ->
  Comments.find {}

Comments.allow
  insert : ->
    true
