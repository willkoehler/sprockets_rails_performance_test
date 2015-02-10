theme_colors = [
  "#E1D8C5"  # primary series
  "#8C7764"  # trendline
  "#DD7933"  # secondary series
  # "#44A0CA"  # secondary series
  "#8D7761"  # 75th percentile
  "#C9AA8D"  # 25th percentile
]

Highcharts.setOptions
  colors: theme_colors
  
  credits:
    enabled: false

  exporting:
    enabled: false

  chart:
    alignTicks: false
    marginTop: 115          # only way to increase margin between chart and subtitle
    style:
      fontFamily: "Helvetica Neue, Arial, Helvetica, sans-serif"

  title:
    style:
      fontSize: '20px'
      color: theme_colors[1]
      fontWeight: 'bold'

  subtitle:
    style:
      fontSize: '16px'
      color: '#666666'

  tooltip:
    enabled: false

  legend:
    itemStyle:
      fontWeight: 'normal'
      fontSize: '15px'

  xAxis:
    tickLength: 0
    lineColor: '#C0C0C0'
    labels:
      style:
        fontSize: '15px'

  yAxis: [{
    title:
      text: null      # don't show axis title
    labels:
      style:
        fontSize: '15px'
  },{
    gridLineWidth: 0  # hide grid lines for secondary y-axis
    min: 0
    opposite: true
    title: 
      text: null      # don't show axis title
    labels:
      style: 
        fontSize: '15px'
        color: theme_colors[2]
  }]

  plotOptions:
    column:
      pointPadding: 0       # make columns wider
      groupPadding: 0.15    # make columns wider
    line:
      lineWidth: 4
      marker:
        enabled: false
        symbol: 'circle'
    series:
      animation: false              # disable all render animations
      enableMouseTracking: false    # disable all mouse events
      dataLabels:
        crop: false         # force data labels to be on top of columns
        overflow: 'hidden'  # force data labels to be on top of columns
        style:
          fontSize: '15px'
