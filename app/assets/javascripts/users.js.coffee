$ ->
  # show customer-specific fields for customers
  check_hospital_visibility()
  $('#user_role').change check_hospital_visibility
  # only show welcome email note when user can login
  $('#user_can_login').change -> $('#welcome_email_note').toggle $(this).is(':checked')

check_hospital_visibility = ->
  $('#customer_fields').toggle $('#user_role').val()=='customer'

