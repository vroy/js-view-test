# Helper methods that allows you to conditionally run code based on the Rails
# controller/action that is being shown. Make sure that your body tag has these
# 2 data attributes:
#
#     data-rails-controller="<%= params[:controller] %>"
#     data-rails-action="<%= params[:action] %>"


# Returns true if the rails controller/action matches.
#
#     if runMe "promos", "index"
#       alert "I'm the index page of the promos controller"
window.runMe = (controller, action=null) ->
  active_controller = $("body").data("rails-controller")
  active_action = $("body").data("rails-action")

  if controller? and action?
    return (controller == active_controller and action == active_action)
  else if controller == active_controller
    return true
  else
    return false


# Runs your callback on document ready if the rails controller/action matches.
#
#     includeMeOn "promos", "index", ->
#       alert "I'm the index page of the promos controller, and my DOM is ready."
window.includeMeOn = (controller, action, cb) ->
  unless cb?
    cb = action
    action = null

  $(document).ready ->
    cb?() if runMe(controller, action)
