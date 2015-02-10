$ ->
  $('.level input[type=checkbox]').click level_option_clicked
  show_inline_form('new') if $('#ops_audit_standards .ops_audit_standard').length == 0
  setup_sortable()

level_option_clicked = (event) ->
  $(this).closest('.level').find('input[type=text], textarea').prop('disabled', !$(this).is(':checked'))

setup_sortable = ->
  $('#ops_audit_standards').sortable
    axis: 'y',
    handle: '.grip'
    tolerance: 'pointer'
    update: ->
      $.post($(this).data('sort-path'), $(this).sortable('serialize'))

@refresh_sortable = ->
  $('.ops_audit_standard').removeClass('revealable')  # revealable interferes with sortable
  $('#ops_audit_standards').sortable('refresh')
