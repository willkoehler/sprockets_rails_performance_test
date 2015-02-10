# setup idle timer to logout after user is idle for [timeout] seconds
@enable_session_timeout = (timeout) ->
  if(timeout > 0)
    $.idleTimer(timeout*1000)
    $(document).bind 'idle.idleTimer', -> window.location = "/logout?timeout=1"

enable_session_timeout($('html').data('session-timeout'))
