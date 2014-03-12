config = require './config'
express = require 'express.io'
app = express().http().io()


config.resolve (render, PORT, PUBLICDIR, VIEWDIR) ->
  
  #Parse body and cookies
  app.use express.bodyParser()
  app.use express.cookieParser()

  #Set the PUBLICDIR for our static files
  app.use express.static PUBLICDIR

  app.configure ->
    
    # Error handling
    app.use (err, req, res, next) ->
      console.log err.stack
      res.send 500, "error top"

    # Set the view directory and the jade engine
    app.set "views", VIEWDIR 
    app.set "view engine", "jade"

    # All routes go below
    app.io.route "openme", render.socketTest

    # Default route
    app.get "*", render.index

    app.listen PORT, ->
      console.log "Listening on #{PORT}"