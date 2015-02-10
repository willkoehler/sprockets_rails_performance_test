class @OpsAuditEditBase

  constructor: ->
    $('input, textarea').on 'keydown change', @enable_save
    $('#save').click @save_audit
    $(window).on 'beforeunload', @warn_if_not_saved
    # select level when any part of level row is clicked
    $('.level').click @select_level

  save_audit: (e) =>
    $('#save').addClass('disabled').html('Saving...')
    $('#audit_form').on 'ajax:success', @reset_save
    $('#audit_form').on 'ajax:error', @enable_save
    $('#audit_form').submit()
    false   # prevent default action

  enable_save: => $('#save').html('Save').removeClass('disabled')

  reset_save: => $('#save').html('Saved').addClass('disabled')

  warn_if_not_saved: => "You have unsaved changes. If you leave this page, you will lose your changes." if @unsaved_changes()

  unsaved_changes: => !$('#save').hasClass('disabled')

  select_level: (e) =>
    return if $(e.currentTarget).find('input[type=radio]').is(':disabled')
    $(e.currentTarget).find('input[type=radio]').prop('checked',true).trigger('change')
    @highlight_level $(e.currentTarget)
    $(e.currentTarget).closest('.ops_audit_standard').trigger('level_changed')

  highlight_level: ($level) =>
    $level.siblings().removeClass('selected')
    $level.addClass('selected')
