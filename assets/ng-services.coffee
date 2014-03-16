@app.service "proxy", ($http) ->
  register: (form, callback) ->
    $http.post("/register", form).success((response) ->
      callback null, response
    ).error((response) ->
      callback "error", response
    )