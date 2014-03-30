@AppCtrl = ($scope, $location, $http, proxy) ->
  
  proxy.setUser (err, user) ->
    throw err if err
    $scope.user = user