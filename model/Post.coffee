mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = (db) ->

  CommentSchema = new Schema {
    userId: ObjectId
    text: String
  }


  PostSchema = new Schema {
    timestamp: {type: Date, default: Date.now()}
    userId: ObjectId
    text: String
    type: String          #Can be photo, text, video, location or link
    provider: String      #What social media it came from, including this one.
    urls: [String]
    comments: [CommentSchema]
    likes: [{userId: ObjectId}]
  }

  PostSchema.index {userId: 1}
  PostSchema.index {type: 1}
  

  Post = db.model "Post", PostSchema