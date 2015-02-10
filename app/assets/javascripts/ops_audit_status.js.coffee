#= require ops_audit_edit_base

$ -> new OpsAuditStatus

class OpsAuditStatus extends OpsAuditEditBase

  constructor: ->
    $('input[type=checkbox][name*="active_goal"]').click @active_status_changed
    $('.ops_audit_standard').on 'level_changed', (e) => @reset_active_goal_and_ready_for_review $(e.target)
    @highlight_all_active_goals()
    super()
  
  active_status_changed: (e) =>
    $standard = $(e.target).closest('.ops_audit_standard')
    $standard.toggleClass('active_goal', e.target.checked)
    @highlight_active_goal $standard

  highlight_active_goal: ($standard) ->
    $standard.find('.level').removeClass('active')
    $standard.find('input[type=radio]:checked').closest('.level').prev('.level').addClass('active') if $standard.hasClass 'active_goal'

  highlight_all_active_goals: ->
    $('.ops_audit_standard.active_goal input[type=radio]:checked').closest('.level').prev('.level').addClass('active')

  reset_active_goal_and_ready_for_review: ($target) ->
    $standard = $target.closest('.ops_audit_standard')
    $standard.find('input[type=checkbox][name*="active_goal"]').prop('checked', false)
    $standard.find('input[type=checkbox][name*="ready_for_review"]').prop('checked', false)
    $standard.find('.level').removeClass('active')
