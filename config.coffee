{container} = require 'dependable'
deps = container()
path = require 'path'
mongoose = require 'mongoose'

dbString = "mongodb://localhost:27017/tribe"
mongoose.set "debug", true
db = mongoose.createConnection dbString


deps.register "db"       , db
deps.register "PUBLICDIR", __dirname + "/public"
deps.register "VIEWDIR"  , __dirname + "/views"
deps.register "PORT"     , process.env.PORT || "9000"

deps.load path.join __dirname, "routes"
deps.load path.join __dirname, "model"

module.exports = deps
