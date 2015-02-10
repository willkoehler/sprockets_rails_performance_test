$ -> 
  $('#rev_exp_chart_secondary_numerator').change check_benchmark_state
  $('input:radio[name="rev_exp_chart[benchmark_type]"]').change check_secondary_series_selection

check_secondary_series_selection = ->
  if benchmark_option_selected()
    $('#rev_exp_chart_secondary_numerator').val('')
    $('#rev_exp_chart_secondary_denominator').val('')

check_benchmark_state = ->
  if secondary_series_option_selected()
    $('#rev_exp_chart_benchmark_type_none').prop('checked', true)
  
secondary_series_option_selected = ->
  has_secondary_series_controls() && $('#rev_exp_chart_secondary_numerator').val() != ''

benchmark_option_selected = ->
  $('#rev_exp_chart_benchmark_type_none').is(':not(:checked)')

has_secondary_series_controls = ->
  $('#rev_exp_chart_secondary_numerator').length > 0
  
@toggle_all_hospitals_for = (category_id, selected) ->
  $("#category_#{category_id} input[type=checkbox]").prop('checked', selected)