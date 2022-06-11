plot_capitalTrees() |> econIDV::get_traceInfo() |>
  View()

plot_capitalTrees() |>
  plotly::style(
    visible=F
  ) -> f0
f0
f0 |> plotly_build() -> p
length(p)
f0 |>
  plotly::style(
    visible=T,
    hovertext="茂廷老師",
    name="臺灣",
    hoverinfo="text+name",
    traces=1
  ) #|>
  plotly_build() |> View()
list(visible=T,
  hovertext="茂廷老師",
  name="臺灣",
  hoverinfo="text+name") |> jsonlite::toJSON(auto_unbox = T) |> clipr::write_clip()
