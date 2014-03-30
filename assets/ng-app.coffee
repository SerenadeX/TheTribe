@app = angular.module "theTribe", [
  "ngRoute"
  "ngAnimate"
]

@app.config [
  "$routeProvider"
  "$locationProvider"
  ($routeProvider, $locationProvider) ->
    $routeProvider.when "/", {templateUrl: "/partials/home"}
    $routeProvider.when "/login", {templateUrl: "/partials/login"}
    $routeProvider.when "/register", {templateUrl: "/partials/register"}
    $locationProvider.html5Mode true
    $locationProvider.hashPrefix "!"
]