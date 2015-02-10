$ ->
  # Enable date picker for all fields with .usedatepicker class
  $('input.usedatepicker').datepicker( { format: 'm/d/yyyy', autoclose: true, forceParse: false, keyboardNavigation: false } )

  # Add click handlers to all clickable elements in the datepicker. These dummy event handlers
  # cause iOS to highlight the elements when tapped, providing visual feedback to the user.
  # Note that since the datepicker is rendered dynamically, we need to update the events any time
  # the month changes. We need the timeout because changeMonth and changeYear events fire before the
  # calendar elements are updated.
  $('input.usedatepicker').on('show changeMonth changeYear', ->
    setTimeout -> $('.datepicker th:not(.dow), td.day, span.month, span.year').off().on('click', -> true))