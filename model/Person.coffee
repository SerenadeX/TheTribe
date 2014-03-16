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


  PersonSchema.methods.encryptPassword = (password) ->
    @salt = crypto.randomBytes(128).toString "base64"
    md5 = crypto.createHash "md5"
    md5.update password+@salt
    @hash = md5.digest "hex"
    
  PersonSchema.methods.isValidPassword = (password) ->
    md5 = crypto.createHash "md5"
    md5.update password+@salt
    hash = md5.digest "hex"
    hash is @hash




  Person = db.model "Person", PersonSchema
  