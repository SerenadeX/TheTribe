mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId
crypto = require 'crypto'

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
    salt:         String
    hash:         String
  }


  PersonSchema.statics.encryptPassword = (password) ->
    @salt = crypto.randomBytes(128).toString "base64"
    @hash = md5 password+@salt
    
  PersonSchema.statics.isValidPassword = (password) ->
    hash = md5 password+@salt
    hash is @hash




  Person = db.model "Person", PersonSchema
  Person.pre "save", (next) ->
    

  return Person