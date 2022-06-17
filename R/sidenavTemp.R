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
      sidenav_content()
    )

  ) -> tag_element

  tag_element |> tagList(
    tags$script("document.addEventListener('DOMContentLoaded', function() {
    var elemsSN = document.querySelectorAll('.sidenav');
    var instancesSN = M.Sidenav.init(elemsSN);
  });")
  ) |> attachAppDependencies()
}
sidenav_content = function(){
  require(htmltools)
  tagList(
    tags$style(
      ".li.vertical-autolayout {display: flex;
flex-direction: column;
align-items: center;
padding: 0px;
gap: 11px;}
      .li.vertical-autolayout > div {
      /* Inside auto layout */

flex: none;
order: 0;
flex-grow: 0;
      }"
    ),
  tags$ul(
    tags$li(
      tags$a(class="btn","經濟系系友會LINE", href="https://page.line.me/?accountId=826wroqn", target="_blank")))

  ) #end of tagList
}
