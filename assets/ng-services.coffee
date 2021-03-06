@app.service "proxy", ($http) ->
  register: (form, callback) ->
    $http.post("/register", form).success((response) ->
      callback null, response
    ).error((response) ->
      callback "error", response
    )
  setUser: (callback) ->
    $http.get("/user").success((response) ->
      callback null, response      
    ).error((response) ->
      callback "not logged in", response
    )