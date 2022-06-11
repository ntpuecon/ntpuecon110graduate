carouselPage2 = function(){
  require(htmltools)
  require(reactR)
  color="purple lighten-4"
  tagList(
    # carouselGlobeNav(),
    # div(style="position:absolute; bottom: 5%; right: 45%; z-index:2;display:none;", id="controlContainer",
    #   globeControl()),
    tags$main(
      style="position:fixed; width:100%;",
      div(class="row",
        div(class="col s12 m6 offset-m3",
          style="height:500px;",
          carousel2())),
        div(class="row",
          div(class="col s12 m3 offset-m3",
            style="position:relative;height:300px;",
            div(style="height:300px;overflow:overlay;",
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
              )
          ))
        ),
     footer2()
    #,
    # floating_control()
  )  |>
    attachAppDependencies()|> tagList(sidenavCarouselDep(), carouselPageDep(), globeDep()) |>
    add_pwa_deps() |>
    add_pwacompat_deps()
}
footer2=function(){
  div(class='row', style="position:fixed;margin-bottom:0px;bottom:0%;width:100%;background:#82828250;",
    div(class="col s12 m6 offset-m4",
      style="height:70px;min-width:300px;",
      tags$div(class="page-footer footer-control",

        zoomControl(),
        div(class="wishBtnContainer", id="giveWish",
          tags$a(
            class="btn-floating waves-effect waves-light", style="color:#039be5",
            href="form.html",
            tags$i(class="material-icons","volunteer_activism")))
        )
      )
  )
}
carousel2 = function(...){
  require(htmltools)
  arglist = list(...)
  arglist |> purrr::map(carouselItem) -> carouselItems
  tags$div(class = "carousel", id="greetingGallery",
    style="overflow: inital !important; max-width: 700px;",
    carouselItems
    # carouselHiddenItems(10)
  ) |>
    attachAppDependencies() |>
    tagList(
      # tags$style("
      #   .hide {display:none;}"),
      html_dependency_react()
    )
}
