module.exports = (Person) ->
  register: (req, res, next) ->
    console.log req.body
    newUser = new Person req.body
    newUser.encryptPassword req.body.password
    newUser.save (err, user) ->
      return next err if err
      res.send {success: true} if !err

  login: (req, res, next) ->
    res.send {}