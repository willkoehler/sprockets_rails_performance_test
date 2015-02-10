$ -> setup_sortable()

setup_sortable = ->
  $('#rev_exp_charts').sortable
    handle: '.grip'
    tolerance: 'pointer'
    update: ->
      $.post($(this).data('sort-path'), $(this).sortable('serialize'))

