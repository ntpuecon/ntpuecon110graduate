globe2 <- function(lat= 24.9442979, lon=121.370319, roll=0) {
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
library(plotly)
df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2011_february_us_airport_traffic.csv')
lat= 24.9442979
lon=121.370319
roll=0
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
  df$text="🌳"
  df$tree2="🌲"
  View(df)
  fig <- plot_geo(df, lat = ~lat, lon = ~long)
  fig <- fig |>
    add_text(
      text=~tree2
    ) %>%
    plotly::layout(
      showlegend=F,
      geo=g
    )
  fig <- fig %>% colorbar(title = "Incoming flights<br />February 2011")
  fig <- fig %>% layout(
    title = 'Most trafficked US airports<br />(Hover for airport)', geo = g
  )

  fig
  fig <- plot_ly(type = 'scattergeo', mode = 'markers')
  fig <- fig %>% layout(geo = g)
  fig
}
plot_capitalTrees = function(){

  # jsonlite::fromJSON("http://techslides.com/demos/country-capitals.json") -> capitals
  # capitals$tree="🌲"
  # usethis::use_data(capitals, overwrite = T)
  whichIsTaipei = which(capitals$CapitalName=="Taipei")
  rbind(capitals[whichIsTaipei,], capitals[-whichIsTaipei,]) -> capitals
  capitals$CountryName = factor(
    capitals$CountryName, levels=capitals$CountryName
  )

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

  fig <- plot_geo(capitals, lat = ~CapitalLatitude, lon = ~CapitalLongitude)
  fig <- fig |>
    add_text(
      text=~tree,
      name=~CountryName
    ) %>%
    plotly::layout(
      showlegend=F,
      geo=g
    )
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
