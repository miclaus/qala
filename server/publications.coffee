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
  Pictures.insert
    url: 'images/2.png'
  Pictures.insert
    _id: '56789'
    url: 'images/3.png'
  Pictures.insert
    url: 'images/4.png'
  Pictures.insert
    url: 'images/5.png'

Meteor.publish 'pictures', ->
  Pictures.find {}

Pictures.allow
  insert : ->
    true

# Comments

# dev only
Comments.remove({})

if Comments.find().fetch().length is 0
  Comments.insert
    pictureId: '12345'
  Comments.insert
    pictureId: '56789'
  Comments.insert
    pictureId: '56789'
  Comments.insert
    pictureId: '56789'

Meteor.publish 'comments', ->
  Comments.find {}

Comments.allow
  insert : ->
    true
