carouselPage = function(){
  require(htmltools)
  require(reactR)
  tagList(

    # div(style="position:absolute; bottom: 5%; right: 45%; z-index:2;display:none;", id="controlContainer",
    #   globeControl()),
    tags$main(
      carousel()),
    div(
      class="row", style="
    position: absolute;
    bottom: 10%;
    left: 10%;",
    div(
      id="globeplace",
      # style="display:none;",
      class="globe-container2",
      plot_capitalTrees(),
      zoomControl(),
      floating_control())
      # div(style="position:absolute; bottom: 5%; right: 5%",
      #   )
    ))  |>
    attachAppDependencies()|> tagList(sidenavCarouselDep(), carouselPageDep(), globeDep())
}
zoomControl= function(){
  require(htmltools)
  div(
    class="zoomcontrol",
    div(
      class="zoombtn", id="zoom-out",
      tags$i(class="material-icons", "remove")
    ),
    div(
      class="zoombtn", id="zoom-in",
      tags$i(class="material-icons", "add")
    )
  ) |>
    attachAppDependencies()
}
