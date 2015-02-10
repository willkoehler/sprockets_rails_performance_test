$ ->
  sticky_polyfill()
  new StickyMonitor


# Use jquery.sticky to simulate "position: sticky" if it's not supported by the browser
sticky_polyfill = ->
  if !cssFeatureTest('position', 'sticky')
    $('.sticky').each -> $(this).sticky({ topSpacing: parseInt($(this).css('top')) })


# Add 'stuck' class to sticky elements that are the "stuck" state
class StickyMonitor

  SCROLL_ACTION_DELAY: 50
  
  constructor: ->
    $(window).scroll @scroll_handler if $('.sticky').length > 0

  scroll_handler: =>
    @scroll_timer ||= setTimeout(@scroll_handler_throttled, @SCROLL_ACTION_DELAY)
  
  scroll_handler_throttled: =>
    @scroll_timer = null
    @toggle_stuck_state_for_sticky_elements()
  
  toggle_stuck_state_for_sticky_elements: =>
    $('.sticky').each ->
      $(this).toggleClass('stuck', this.getBoundingClientRect().top - parseInt($(this).css('top')) <= 1)
