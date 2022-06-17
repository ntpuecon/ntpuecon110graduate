pwa_index_sidenav = function(){
  require(htmltools)
  nav=tagList(
    tags$style('

'),
    tags$div(id = "installContainer",
      class = "hide",
      tags$a(id = "butInstall",
        class = "waves-effect waves-light btn",
        "安裝此App"))
  )
  tagList(
    sidenav(nav),
    pwa_index()
  )


}

sidenav = function(nav){
  require(htmltools)
  tagList(
    tags$style('

'),
  tags$nav(nav,
    tags$a(href = "#",
      `data-target` = "slide-out",
      class = "sidenav-trigger",
      tags$i(class = "material-icons",
        "menu"))),
    tags$div(
      id = "slide-out",
      class = "sidenav",

    tags$ul(
      tags$li(tags$div(class = "user-view",
        tags$div(class = "background",
          tags$img(src = "images/office.jpg")),
        tags$a(href = "#user",
          tags$img(class = "circle",
            src = "images/yuna.jpg")),
        tags$a(href = "#name",
          tags$span(class = "white-text name",
            "John Doe")),
        tags$a(href = "#email",
          tags$span(class = "white-text email",
            "jdandturk@gmail.com")))),
      tags$li(tags$a(href = "#!",
        tags$i(class = "material-icons",
          "cloud"),
        "First Link With Icon")),
      tags$li(tags$a(href = "#!",
        "Second Link")),
      tags$li(tags$div(class = "divider")),
      tags$li(tags$a(class = "subheader",
        "Subheader")),
      tags$li(tags$a(class = "waves-effect",
        href = "#!",
        "Third Link With Waves"))))

  ) -> tag_element

  tag_element |> tagList(
    tags$script("document.addEventListener('DOMContentLoaded', function() {
    var elemsSN = document.querySelectorAll('.sidenav');
    var instancesSN = M.Sidenav.init(elemsSN);
  });")
  ) |> attachAppDependencies()
}
