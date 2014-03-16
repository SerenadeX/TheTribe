config = require './config'
express = require 'express.io'
passport = require 'passport'
LocalStrategy = require("passport-local").Strategy

app = express().http().io()


config.resolve (render, users, Person, PORT, PUBLICDIR, VIEWDIR) ->
  

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

    # Persist user login
    app.use express.session {
      secret: "totalapp"
      store: new RedisStore
      cookie: {
        maxAge: new Date(Date.now() + 360000)
        secure: false
      }
    }


    # Passport Strategies
    passport.use new LocalStrategy {
      usernameField: "email"
      passwordField: "password"
    }, (email, password, done) ->
      Person.findOne {email: email}, (err, user) ->
        return done(err) if err
        unless user
          done null, false, {message: "Incorrect email."}
        unless user.isValidPassword password
          done null, false, {message: "Incorrect password."}
        done null, user

    passport.serializeUser (user, callback) ->
      callback null, user._id
    
    passport.deserializeUser (id, callback) ->
      Person.findById id, (err, user) ->
        callback err, user
      



    # All routes go below

    # Socket routes
    # app.io.route "openme", render.socketTest

    # Service routes

    # User Routes
    app.post "/register", users.register
    app.post "/login", passport.authenticate(), users.login





    # Default route
    app.get "*", render.index

    app.listen PORT, ->
      console.log "Listening on #{PORT}"