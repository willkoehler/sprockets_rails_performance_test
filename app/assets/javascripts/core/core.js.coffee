$ ->
  # fade out and hide flash messages after 5 seconds
  $('.header_bar.flash_message').fadeTo(300, 1).delay(3500).fadeOut(300)

  # focus on the field with "autofocus" attribute (for non-HTML5 browsers)
  $("input[autofocus='autofocus']:first").focus().select()
  # emulate the placeholder attribute in web browsers that don't support it
  $('input, textarea').placeholder()

  # Reload grid when a search field is changed
  $('.search_form select').change -> $(this.form).submit();
  $('.search_form input[type=checkbox]').click -> $(this.form).submit();

  # Install click handler for all <a> tags with a 'function' attribute
  # Usage: <%= link_to 'chat now!', '#', function: 'do_something', data: { params: [55, 'stuff'] } %>
  $(document).on 'click', 'a[function]', ->
    # call the function and pass in the parameters specified in data-params
    window[$(this).attr('function')].apply(this, $(this).data().params || [])
    # return false to prevent default action
    return(false)

# Fade out, slide up, and remove contents of a table row
# Based on http://stackoverflow.com/questions/467336
@remove_table_row = (selector) ->
  $row = $(selector)
  $row.find('td').wrapInner('<div style="display: block;" />')
  $row.find('td > div').fadeTo 125, 0, ->
    $row.find('td').animate { 'padding-top' : 0, 'padding-bottom' : 0 }, 400
    $row.find('td > div').slideUp 200, ->
      $row.remove()

