window.runMe = (controller, action=null) ->
  active_controller = $("body").data("rails-controller")
  active_action = $("body").data("rails-action")

  if controller? and action?
    return (controller == active_controller and action == active_action)
  else if controller == active_controller
    return true
  else
    return false

window.includeMeOn = (controller, action, cb) ->
  unless cb?
    cb = action
    action = null

  $ ->
    cb?() if runMe(controller, action)
