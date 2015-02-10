# Load another group of notes when page is scrolled near the bottom
$ -> watchScroll() if $('#loading_more_indicator').length

@watchScroll = ->
  $(window).scroll(checkScroll)
  $(window).scroll();   # trigger dummy event in case entire page fits on screen

checkScroll = ->
  if (nearBottomOfPage())
    $(window).unbind('scroll', checkScroll)
    $.getScript($('#loading_more_indicator').data('more-url'))

nearBottomOfPage = ->
  $(window).scrollTop() > ($(document).height() - $(window).height() - 350)
