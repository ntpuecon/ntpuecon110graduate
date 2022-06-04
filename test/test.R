startapp = function(){
  globe() |>
    apptest::App() ->> app
  app$create()
  app$setup()
  app$view()
}
# https://plotly.com/javascript/animations/
globe() |> plotly_build() |> View()

create_widget() |> class()

startapp()

pt=econIDV::PlotlyTools()
pt$query_layout$`Color,modebar,hover,and others`()
pt$`query_Color,modebar,hover,and others`()
pt$query_layout$`Title and others`()
pt$`query_Title and others`()
pt$query_layout$Geo()
pt$query_Geo()

create_widget() |> econWeb::browseTag2()

create_widget() |>
  apptest::App() -> app

app$create()
app$setup()
app$view()
