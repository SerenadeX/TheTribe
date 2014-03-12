mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = (db) ->

  RelationSchema = new Schema {
    type: String
    id: ObjectId
  }


  PersonSchema = new Schema {
    name: {
      first:      String
      last:       String
    }
    relations:    [RelationSchema]
    email:        String
  }

  Person = db.model "Person", PersonSchema