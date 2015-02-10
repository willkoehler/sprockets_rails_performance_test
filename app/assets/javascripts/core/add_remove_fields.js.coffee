# remove group of fields when "remove" link is clicked (based on http://railscasts.com/episodes/197)
@remove_fields = ->
  $(this).prev("input[type=hidden]").val("1")
  $(this).closest("div.removeable_fields").fadeTo(125,0).slideUp(125, => $(this).trigger('fields_removed'))

# add group of fields when "add" link is clicked (based on http://railscasts.com/episodes/197)
@add_fields = (association, new_fields) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_#{association}", 'g')
  $new_fields = $(new_fields.replace(regexp, new_id))           # give new fields a unique id
  $(this).closest('.insert_point').before($new_fields)          # insert the new fields
  $("input:not([type='hidden']):first", $new_fields).focus();   # set focus in first added field
  $(this).trigger('fields_added', [$new_fields])                # notify listeners that fields have been added

