# switch section row to edit mode
@show_inline_form = (id) ->
  $('#editable_' + id).hide()
  $('#inline_form_' + id).show()

# switch section row back to display mode
@hide_inline_form = (id) ->
  $('#editable_' + id).show()
  $('#inline_form_' + id).hide()
