EXPORT_WIDTH = 1400

@save_chart_as_png = (chart_selector, filename) ->
  chart = $(chart_selector).highcharts()
  render_width = EXPORT_WIDTH
  render_height = render_width * chart.chartHeight / chart.chartWidth

  svg = chart.getSVG {
    exporting:
      sourceWidth: chart.chartWidth
      sourceHeight: chart.chartHeight
  }

  canvas = $('<canvas></canvas>').attr({
    height: render_height
    width: render_width
  })[0]

  canvg(canvas, svg, {
    scaleWidth: render_width
    scaleHeight: render_height
    ignoreDimensions: true
  })

  download(canvas, filename + '.png')

download = (canvas, filename) ->
  download_in_ie(canvas, filename) || download_with_link(canvas, filename)

# Works in IE10 and newer
download_in_ie = (canvas, filename) ->
  navigator.msSaveOrOpenBlob && navigator.msSaveOrOpenBlob(canvas.msToBlob(), filename)

# Works in Chrome and FF. Safari just opens the image in current window, since
# .download attribute is not supported
download_with_link = (canvas, filename) ->
  a = document.createElement('a')
  a.download = filename
  a.href = canvas.toDataURL("image/png")
  document.body.appendChild(a)
  a.click()
  a.remove()
