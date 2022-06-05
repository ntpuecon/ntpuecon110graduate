control = function(){
  require(htmltools)
  tags$div(
    class="conrol",
    tags$div(
      class="top-control",
      div(class="control-btn",
        tags$i(class="material-icons", "expand_less"))
    ),
    div(
      class="bottom-control",
      div(class="control-btn",
        tags$i(class="material-icons", "expand_more"))
    ),
    div(
      class="center-control",
      div(class="control-btn",
        tags$i(class="material-icons", "play_arrow", id="play"),
        tags$i(id="stop", style="display:none;",
          class="material-icons", "stop"))
    ),
    div(
      class="left-control",
      div(class="control-btn",
        tags$i(class="material-icons", "chevron_left"))
    ),
    div(
      class="right-control",
      div(class="control-btn",
        tags$i(class="material-icons", "chevron_right"))
    )
  ) |>
    attachAppDependencies()
}
