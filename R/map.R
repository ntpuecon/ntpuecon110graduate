globe <- function(lat= 24.9442979, lon=121.370319, roll=0) {
  require(plotly)
  g <- list(
    projection = list(
      type ='orthographic',#   'natural earth',
      rotation = list(
        lon=lon,
        lat=lat,
        roll=roll
      )
    ),
    showland = TRUE,
    landcolor = toRGB("#e5ecf6")
  )
  fig <- plot_ly(type = 'scattergeo', mode = 'markers')
  fig <- fig %>% layout(geo = g)
  fig
}
globe_ratate = function(p=globe(), rotate=15){
  p=globe()
  p |> plotly::plotly_build() -> p2
  p2$x$layout$geo$projection$rotation$lon -> currentLon
  plotly::layout(
    p,
    geo=list(projection=list(rotation=list(
      lon=currentLon+rotate
    )))
  )
}
globe_zoom = function(p=globe(), zoom=1){
  plotly::layout(
    p,
    geo=list(projection=list(scale=1.3))
  )
}
