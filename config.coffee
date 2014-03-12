{container} = require 'dependable'
deps = container()
path = require 'path'
deps.register "PUBLICDIR", __dirname + "/public"
deps.register "VIEWDIR"  , __dirname + "/views"
deps.register "PORT"     , process.env.PORT || "9000"

deps.load path.join __dirname, "routes"
deps.load path.join __dirname, "model"

module.exports = deps
