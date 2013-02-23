includeMeOn "offers", ->
  $(".js-ran").append("<li>offers.js.coffee</li>")

  if runMe("offers", "new")
    $(".js-ran").append("<li>offers.js.coffee#new</li>")
