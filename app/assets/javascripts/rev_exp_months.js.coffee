$ -> 
  $('html').on 'click', 'body:not(.edit_mode) .editable', on_click_editable_month_column
  $('#save').click save_month
  $('html').on 'keypress', '.column.with_form form input', save_month_when_entered_pressed
  $('#cancel').click cancel_month_edit
  $(window).on 'beforeunload', warn_if_not_saved
  scroll_to_newest_month()

cancel_month_edit = ->
  $('.column.editable').removeClass('masked').show()  # show month that was hidden
  $('.column.with_form').remove()                     # remove form column
  exit_edit_mode()
  false   # prevent default action

save_month = ->
  $('#save').addClass('disabled').html('Saving...')
  $('#rev_exp_month_confirmed').val($('#confirmed').is(':checked'))
  $('.column.with_form form').submit()
  false   # prevent default action

save_month_when_entered_pressed = (e)->
  save_month() if e.which == 13

on_click_editable_month_column = (e)->
  # Show 'working' animation
  $(this).addClass('masked')
  # remember the position of the mouse
  window.saved_mouse_position = { x: e.clientX, y: e.clientY }
  # Get edit form from the server
  $.get $(this).data('get-form-path')

scroll_to_newest_month = ->
  $('.data')[0].scrollLeft = $('.data')[0].scrollWidth - $('.data').width() * 2 + $('.data .column').width() * 2

warn_if_not_saved = -> "You have unsaved changes. If you leave this page, you will lose your changes." if $('body').hasClass('edit_mode')

set_initial_focus = ->
  $(document.elementFromPoint(window.saved_mouse_position.x, window.saved_mouse_position.y)).focus().select()

@enter_edit_mode = ->
  $('body').addClass('edit_mode')
  $('#save').html('Save Month').removeClass('disabled')
  set_initial_focus()

@exit_edit_mode = ->
  $('body').removeClass('edit_mode')
