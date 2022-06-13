installation = function(){
  tagList(
    tags$style('

'),
    tags$div(id = "installContainer",
      class = "hidden",
      tags$button(id = "butInstall",
        type = "button",
        "Install"))
  ) -> tag_element

  tag_element
}
