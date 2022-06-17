sidenavControl_globe = function(){tagList(
  tags$ul(
    style="width: 200px;",
  tags$li(
    class="center",
    tags$i(class = "material-icons","public")),
  tags$li(
    class="align-center",
    tags$div(class="divider")),
  tags$li(
    div(
      class="LR-container",
      tags$i(class = "material-icons tiny left","public"),
      tags$i(class = "material-icons small right","public")
    )
  ),
  tags$li(
    div(
      class="LR-container",

      div(
        class = "switch",
        tags$label(tags$i(class = "material-icons tiny", style="opacity:0.3","public"),
            tags$input(type = "checkbox"),
            tags$span(class = "lever"),
          tags$i(class = "material-icons tiny", style="opacity:1","public"))),
      ))
    )
  )-> tag_element

tag_element |>
  tagList(
    tags$style("
      .LR-container {display: flex;
flex-direction: row;
justify-content: space-between;
align-items: center;
padding: 0px;
gap: 40px;}
.LR-container > * {
flex: none;
flex-grow: 0;
}"),
    materialiseDep(),
    googleDep()
  )
}
