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
      div(style="background: url(lib/img-1.0/side.jpg) no-repeat center;background-size: contain;
    background-position: top; background-color:white; height:100%"),
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
    tags$div(class="designer",
    tags$div(class="story",
      tags$p("Ntpu Economic wiSH（簡稱NESH）是給國立臺北大學學士班及進修學士班互留祝福的App，每一則祝福種出一顆綠樹。點擊樹可叫出種樹的祝福卡，雙擊卡片可叫出所種下的樹。畢業後同學也可透過此App，更新自己的訊息，讓彼此知道自己的近況。")),


    tags$div(class="divider"),
  tags$ul(
#     style="position: absolute;
#     bottom: 50px;
# }",
    tags$li(
      tags$a(class="btn","經濟系系友會LINE", href="https://page.line.me/?accountId=826wroqn", target="_blank"))))

  ) #end of tagList
}
