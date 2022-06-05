modal = function(content,id="tree", modal_button=modalButton){
  tagList(

    modal_button(href=paste0("#",id), id=id),
    tags$div(id = id,
      class = "modal",
      style="overflow: hidden;",
      tags$div(class = "modal-content",
        content),
      tags$div(class = "modal-footer",
        style="position:absolute;top:0%;",
        tags$a(href = "#!",
          class = "modal-close waves-effect waves-green btn-flat",
          tags$i(class = "material-icons", "close"))))
  ) -> tag_element

  tag_element
}
modalButton =  function(href,id){
  tag_element <- tagList(tags$style("\n\n"), tags$a(class = "btn-floating btn-large purple lighten-1 modal-trigger", id = "btn-tree", `data-target`=id,
    href=href,
    tags$i(class = "material-icons", "forest")))
  attachAppDependencies(tag_element)
}
