config = require './config'
express = require 'express.io'
app = express().http().io()


config.resolve (render, users, PORT, PUBLICDIR, VIEWDIR) ->
  

  app.configure ->
    
    #Parse body and cookies
    app.use express.bodyParser()
    app.use express.cookieParser()

    #Set the PUBLICDIR for our static files
    app.use(express.static(PUBLICDIR))



    # Error handling
    app.use (err, req, res, next) ->
      console.log err.stack
      res.send 500, "error top"

    # Set the view directory and the jade engine
    app.set "views", VIEWDIR 
    app.set "view engine", "jade"

    # All routes go below

    # Socket routes
    # app.io.route "openme", render.socketTest

    # Service routes
    app.post "/user/register", users.register

    # Default route
    app.get "*", render.index

    app.listen PORT, ->
      console.log "Listening on #{PORT}"