module.exports = (Person) ->
  index: (req, res, next) ->
    res.render "index"
  partials: (req, res, next) ->
    res.render "partials/#{req.params.name}"  