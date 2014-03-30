@LoginCtrl = ($scope,$location,$http,proxy) ->
  $scope.form = {name:{}}
  $scope.login = {}
  $scope.register = ->
    proxy.register $scope.form, (err, response) ->
      return console.log "Error registering: err" if err
      console.log "userregistered"