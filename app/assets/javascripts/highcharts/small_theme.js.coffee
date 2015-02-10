# The small theme's values are merged with the default theme.
# Include this file where needed with "javascript 'highcharts/small_theme'"

Highcharts.setOptions
  title: { style: { fontSize: '16px' } }
  subtitle: { style: { display: 'none' } }
  legend: { enabled: false }

  chart:
    backgroundColor: null   # transparent - prevents background from clipping rounded border
    marginTop: 65           # always make room for two title rows so chart size is uniform
  
  xAxis:
    labels:
      style:
        fontSize: '11px'
      y: 17   # move labels closer to x-axis line

  yAxis: [{
    tickPixelInterval: 40
    title:
      text: null      # don't show axis title
    labels:
      style:
        fontSize: '11px'
  },{
    gridLineWidth: 0  # hide grid lines for secondary y-axis
    min: 0
    opposite: true
    title: 
      text: null      # don't show axis title
    labels:
      style: 
        fontSize: '11px'
        color: Highcharts.getOptions().colors[2]
  }]

  tooltip: { enabled: false }
  
  plotOptions:
    series:
      dataLabels:
        style:
          fontSize: '11px'
    column:
      pointPadding: 0       # make columns slightly wider
      groupPadding: 0.14    # make columns slightly wider
