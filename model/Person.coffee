mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = (db) ->

  RelationSchema = new Schema {
    type: String
    userId: ObjectId
  }

  HistorySchema = new Schema {
    type: String  #post object type
    postId: ObjectId  #Id of the post object 
  }


  PersonSchema = new Schema {
    name: {
      first:      String
      last:       String
    }
    oauth: {
      facebook:   Array
      google:     Array
      twitter:    Array
    }
    relations:    [RelationSchema]
    history:      [HistorySchema]
    email:        String
  }

  Person = db.model "Person", PersonSchema