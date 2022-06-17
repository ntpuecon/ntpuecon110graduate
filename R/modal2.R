modal = function(){
  tagList(
    tags$style('

'),
    tags$a(class = "waves-effect waves-light btn modal-trigger",
      href = "#modal1",
      "Modal"),
    tags$div(id = "modal1",
      class = "modal",
      tags$div(class = "modal-content",
        tags$h4("Modal Header"),
        tags$p("A bunch of text")),
      tags$div(class = "modal-footer",
        tags$a(href = "#!",
          class = "modal-close waves-effect waves-green btn-flat",
          "Agree"))),
    tags$script(" document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems, options);
  });")
  ) -> tag_element

  tag_element |> attachAppDependencies()
}

