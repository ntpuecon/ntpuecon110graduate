carouselPage = function(){
  require(htmltools)
  require(reactR)
  tagList(
    div(style="position:absolute; bottom: 5%; right: 5%",
      floating_control()),
    div(style="position:absolute; bottom: 5%; right: 45%; z-index:2;display:none;", id="controlContainer",
      globeControl()),
    tags$main(
      carousel()),

    div(
      id="globeplace",
      # style="display:none;",
      class="globe-container2",
      plot_capitalTrees()
    ))  |>
    attachAppDependencies()|> tagList(sidenavCarouselDep(), reactR::html_dependency_react())
}
