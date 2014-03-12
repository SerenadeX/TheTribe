module.exports = ->
  index: (req, res, next) ->
    res.render "index"
  socketTest: (req) ->
    data = req.data
    console.log "bob", data