carouselPage = function(){
  require(htmltools)
  require(reactR)
  color="purple lighten-4"
  tagList(
    # carouselGlobeNav(),
    # div(style="position:absolute; bottom: 5%; right: 45%; z-index:2;display:none;", id="controlContainer",
    #   globeControl()),
    tags$main(
      div(class="row",
        div(class="col s12 m6 offset-m3",
          carousel(),
          div(
            class="globe-outercontainer", style="
    position: absolute;
    bottom: 10%;
    left: 10%;",
            div(
              id="globeplace",
              # style="display:none;",
              class="globe-container2",
              plot_capitalTrees()
            ))
          ))
      ),
    tags$div(class="page-footer footer-control",
      zoomControl(),
      div(class="wishBtnContainer", id="giveWish",
        tags$a(
          class="btn-floating waves-effect waves-light", style="color:#039be5",
          href="form.html",
          tags$i(class="material-icons","volunteer_activism")))
      )
    #,
    # floating_control()
    )  |>
    attachAppDependencies()|> tagList(sidenavCarouselDep(), carouselPageDep(), globeDep()) |>
    add_pwa_deps() |>
    add_pwacompat_deps()
}
carouselGlobeNav = function(){
  tags$nav(
    sidenav(
      tags$li(
        tags$a(
          id="sidenav-play",

          # href=href,
          class=glue::glue("btn-large waves-effect waves-light {color}"),
          tags$i(class="material-icons", "slideshow")
        )),
      tags$li(
        tags$a(
          id="sidenav-stop", style="display:none;",
          # href=href,
          class=glue::glue("btn-large waves-effect waves-light {color}"),
          tags$i(class="material-icons", "stop")
        )),
      tags$li(tags$a(
        href="form.html",
        class=glue::glue("btn-large waves-effect waves-light {color}"),
        tags$i(class="material-icons", "volunteer_activism")
      )),
      icon="menu-open"
    ))
}
globeZoomControl= function(){
  require(htmltools)
  div(
    class="zoomcontrol",
    div(
      class="zoombtn", id="zoom-out",
      tags$i(class="material-icons", "remove")
    ),
    div(class='zoombtn', id="switchPosition",
      tags$i(class="material-icons", "move_up")),
    div(class='zoombtn', id="play_arrow",
      tags$i(class="material-icons", "play_arrow")),  div(class='zoombtn', id="stop",
        style="display:none;",
        tags$i(class="material-icons", "stop")),
    div(class="speedControlInsidePanel",
      ui_speedControl()),
    div(
      class="zoombtn", id="zoom-in",
      tags$i(class="material-icons", "add")
    )
  ) |>
    attachAppDependencies()
}

zoomControl= function(){
  require(htmltools)
  div(
    class="zoomcontrol",
    div(class="speedControlInsidePanel",
      ui_sizeControl()),
    # div(
    #   class="zoombtn", id="zoom-out",
    #   tags$i(class="material-icons", "remove")
    # ),
    div(class='zoombtn', id="switchPosition",
      tags$i(class="material-icons", "move_up")),
    div(class='zoombtn', id="play_arrow",
      tags$i(class="material-icons", "play_arrow")),  div(class='zoombtn', id="stop",
        style="display:none;",
        tags$i(class="material-icons", "stop")),
    div(class="speedControlInsidePanel",
    ui_speedControl())#,
    # div(class="zoombtn", id="giveWish",
    #   tags$a(href="form.html",
    #     tags$i(class="material-icons","volunteer_activism")))
  ) |>
    attachAppDependencies()
}
