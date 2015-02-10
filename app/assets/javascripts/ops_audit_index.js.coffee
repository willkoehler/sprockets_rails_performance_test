$ ->
  $('#baseline_audit').change baseline_audit_changed
  $('tr.driver .label').click driver_row_clicked

baseline_audit_changed = -> window.location.replace $(this).find(":selected").data('url')

driver_row_clicked = (e) ->
  $driver_row = $(this).closest('tr')
  if $driver_row.hasClass('expanded') then hide_categories($driver_row) else show_categories($driver_row)

show_categories = ($driver) ->
  $driver.addClass 'expanded'
  $("tr.category.#{$driver.data('driver')}").show()

hide_categories = ($driver) ->
  $driver.removeClass 'expanded'
  $("tr.category.#{$driver.data('driver')}").hide()
  